"use strict";var PartialEvaluator=function(){function t(e,t,n,r,i,s,o){this.state=new EvalState;this.stateStack=[];this.pdfManager=e;this.xref=t;this.handler=n;this.pageIndex=r;this.uniquePrefix=i;this.idCounters=s;this.fontCache=o}var n=1,r=2;t.prototype={hasBlendModes:function(t){if(!isDict(t)){return false}var n=[t];while(n.length){var r=n.shift();var i=r.get("ExtGState");if(isDict(i)){i=i.getAll();for(var s in i){var o=i[s];var u=o["BM"];if(isName(u)&&u.name!=="Normal"){return true}}}var a=r.get("XObject");if(!isDict(a)){continue}a=a.getAll();for(var s in a){var f=a[s];if(!isStream(f)){continue}var l=f.dict.get("Resources");if(isDict(l)&&l!==r){n.push(l)}}}return false},buildFormXObject:function(t,n,r,i,s){var o=n.dict.get("Matrix");var u=n.dict.get("BBox");var a=n.dict.get("Group");if(a){var f={matrix:o,bbox:u,smask:r,isolated:false,knockout:false};var l=a.get("S");if(isName(l)&&l.name==="Transparency"){f.isolated=a.get("I")||false;f.knockout=a.get("K")||false;var c=a.get("CS");f.colorSpace=c?ColorSpace.parseToIR(c,this.xref,t):null}i.addOp(OPS.beginGroup,[f])}i.addOp(OPS.paintFormXObjectBegin,[o,u]);this.getOperatorList(n,n.dict.get("Resources")||t,i,s);i.addOp(OPS.paintFormXObjectEnd,[]);if(a){i.addOp(OPS.endGroup,[f])}},buildPaintImageXObject:function(t,n,r,i,s,o){var u=this;var a=n.dict;var f=a.get("Width","W");var l=a.get("Height","H");if(PDFJS.maxImageSize!==-1&&f*l>PDFJS.maxImageSize){warn("Image exceeded maximum allowed size and was removed.");return}var c=a.get("ImageMask","IM")||false;if(c){var h=a.get("Width","W");var p=a.get("Height","H");var d=h+7>>3;var v=n.getBytes(d*p);var m=a.get("Decode","D");var g=n instanceof DecodeStream;var y=!!m&&m[0]>0;var b=PDFImage.createMask(v,h,p,g,y);b.cached=true;var w=[b];i.addOp(OPS.paintImageMaskXObject,w);if(s){o.key=s;o.fn=OPS.paintImageMaskXObject;o.args=w}return}var E=a.get("SMask","SM")||false;var S=a.get("Mask")||false;var x=200;if(r&&!E&&!S&&!(n instanceof JpegStream)&&f+l<x){var T=new PDFImage(this.xref,t,n,r,null,null);var b=T.createImageData(true);i.addOp(OPS.paintInlineImageXObject,[b]);return}var N=this.uniquePrefix||"";var C="img_"+N+ ++this.idCounters.obj;i.addDependency(C);var w=[C,f,l];if(!E&&!S&&n instanceof JpegStream&&n.isNativelySupported(this.xref,t)){i.addOp(OPS.paintJpegXObject,w);this.handler.send("obj",[C,this.pageIndex,"JpegStream",n.getIR()]);return}PDFImage.buildImage(function(e){var t=e.createImageData(false);u.handler.send("obj",[C,u.pageIndex,"Image",t],null,[t.data.buffer])},u.handler,u.xref,t,n,r);i.addOp(OPS.paintImageXObject,w);if(s){o.key=s;o.fn=OPS.paintImageXObject;o.args=w}},handleSMask:function(t,n,r){var i=t.get("G");var s={subtype:t.get("S").name,backdrop:t.get("BC")};this.buildFormXObject(n,i,s,r)},handleTilingType:function(t,n,r,i,s,o){var u=this.getOperatorList(i,s.get("Resources")||r);o.addDependencies(u.dependencies);o.addOp(t,getTilingPatternIR({fnArray:u.fnArray,argsArray:u.argsArray},s,n))},handleSetFont:function(t,n,r,i){var s;if(n){n=n.slice();s=n[0].name}var o=this;var u=this.loadFont(s,r,this.xref,t,i);this.state.font=u;var a=u.loadedName;if(!u.sent){var f=u.translated.exportData();o.handler.send("commonobj",[a,"Font",f]);u.sent=true}return a},handleText:function(t){var n=this.state.font.translated;var r=n.charsToGlyphs(t);var i=!!(this.state.textRenderingMode&TextRenderingMode.ADD_TO_PATH_FLAG);if(n.data&&(i||PDFJS.disableFontFace)){for(var s=0;s<r.length;s++){if(r[s]===null){continue}var o=r[s].fontChar;if(!n.renderer.hasBuiltPath(o)){var u=n.renderer.getPathJs(o);this.handler.send("commonobj",[n.loadedName+"_path_"+o,"FontPath",u])}}}return r},setGState:function(t,n,r,i){function o(e,n,o){switch(n){case"Type":break;case"LW":case"LC":case"LJ":case"ML":case"D":case"RI":case"FL":case"CA":case"ca":e.push([n,o]);break;case"Font":var u=s.handleSetFont(t,null,o[0],r);r.addDependency(u);e.push([n,[u,o[1]]]);break;case"BM":e.push([n,o]);break;case"SMask":if(isName(o)&&o.name==="None"){e.push([n,false]);break}var a=i.fetchIfRef(o);if(isDict(a)){s.handleSMask(a,t,r);e.push([n,true])}else{warn("Unsupported SMask type")}break;case"OP":case"op":case"OPM":case"BG":case"BG2":case"UCR":case"UCR2":case"TR":case"TR2":case"HT":case"SM":case"SA":case"AIS":case"TK":info("graphic state operator "+n);break;default:info("Unknown graphic state operator "+n);break}}var s=this;var u=[];var a=n.map;for(var f in a){var l=a[f];o(u,f,l)}r.addOp(OPS.setGState,[u])},loadFont:function(t,n,r,i,s){function o(){return{translated:new ErrorFont("Font "+t+" is not available"),loadedName:"g_font_error"}}var u;if(n){assert(isRef(n));u=n}else{var a=i.get("Font");if(a){u=a.getRaw(t)}else{warn("fontRes not available");return o()}}if(this.fontCache.has(u)){return this.fontCache.get(u)}n=r.fetchIfRef(u);if(!isDict(n)){return o()}var f=isDict(u);if(!f){this.fontCache.put(u,n)}n.loadedName="g_font_"+(f?t.replace(/\W/g,""):u.num+"_"+u.gen);if(!n.translated){var l;try{l=this.translateFont(n,r)}catch(c){UnsupportedManager.notify(UNSUPPORTED_FEATURES.font);l=new ErrorFont(c instanceof Error?c.message:c)}n.translated=l}if(n.translated.loadCharProcs){var h=n.get("CharProcs").getAll();var p=n.get("Resources")||i;var d=Object.keys(h);var v={};for(var m=0,g=d.length;m<g;++m){var y=d[m];var b=h[y];var w=this.getOperatorList(b,p);v[y]=w.getIR();if(!s){continue}s.addDependencies(v.dependencies)}n.translated.charProcOperatorList=v}n.loaded=true;return n},getOperatorList:function(t,i,s,o){var u=this;var a=this.xref;var f=this.handler;var l={};s=s||new OperatorList;i=i||new Dict;var c=i.get("XObject")||new Dict;var h=i.get("Pattern")||new Dict;var p=new EvaluatorPreprocessor(t,a);if(o){p.setState(o)}var d=new LegacyPromise;var v;while(v=p.read()){var m=v.args;var g=v.fn;switch(g){case OPS.setStrokeColorN:case OPS.setFillColorN:if(m[m.length-1].code){break}var y=m[m.length-1];var b;if(isName(y)&&(b=h.get(y.name))){var w=isStream(b)?b.dict:b;var E=w.get("PatternType");if(E==n){u.handleTilingType(g,m,i,b,w,s);m=[];continue}else if(E==r){var S=w.get("Shading");var x=w.get("Matrix");var b=Pattern.parseShading(S,x,a,i);m=b.getIR()}else{error("Unkown PatternType "+E)}}break;case OPS.paintXObject:if(m[0].code){break}var T=m[0].name;if(l.key===T){s.addOp(l.fn,l.args);m=[];continue}var N=c.get(T);if(N){assertWellFormed(isStream(N),"XObject should be a stream");var C=N.dict.get("Subtype");assertWellFormed(isName(C),"XObject should have a Name subtype");if("Form"==C.name){u.buildFormXObject(i,N,null,s,p.getState());m=[];continue}else if("Image"==C.name){u.buildPaintImageXObject(i,N,false,s,T,l);m=[];continue}else{error("Unhandled XObject subtype "+C.name)}}break;case OPS.setFont:var k=u.handleSetFont(i,m,null,s);s.addDependency(k);m[0]=k;break;case OPS.endInlineImage:var L=m[0].cacheKey;if(L&&l.key===L){s.addOp(l.fn,l.args);m=[];continue}u.buildPaintImageXObject(i,m[0],true,s,L,l);m=[];continue;case OPS.save:var A=this.state;this.stateStack.push(this.state);this.state=A.clone();break;case OPS.restore:var O=this.stateStack.pop();if(O){this.state=O}break;case OPS.showText:m[0]=this.handleText(m[0]);break;case OPS.showSpacedText:var M=m[0];var _=M.length;for(var D=0;D<_;++D){if(isString(M[D])){M[D]=this.handleText(M[D])}}break;case OPS.nextLineShowText:m[0]=this.handleText(m[0]);break;case OPS.nextLineSetSpacingShowText:m[2]=this.handleText(m[2]);break;case OPS.setTextRenderingMode:this.state.textRenderingMode=m[0];break;case OPS.setFillColorSpace:case OPS.setStrokeColorSpace:m=[ColorSpace.parseToIR(m[0],a,i)];break;case OPS.shadingFill:var P=i.get("Shading");if(!P){error("No shading resource found")}var S=P.get(m[0].name);if(!S){error("No shading object found")}var H=Pattern.parseShading(S,null,a,i);var B=H.getIR();m=[B];g=OPS.shadingFill;break;case OPS.setGState:var j=m[0];var F=i.get("ExtGState");if(!isDict(F)||!F.has(j.name)){break}var I=F.get(j.name);u.setGState(i,I,s,a);m=[];continue}s.addOp(g,m)}for(var D=0,q=p.savedStatesDepth;D<q;D++){s.addOp(OPS.restore,[])}return s},getTextContent:function(t,n,r){function f(e,t){return u.loadFont(e,t,a,n,null)}r=r||new TextState;var i=[];var s=.35;var o=1.5;var u=this;var a=this.xref;n=a.fetchIfRef(n)||new Dict;var l=null;var c={};var h=new EvaluatorPreprocessor(t,a);var p=n;var d=[];var v=null;var m=0,g=0;var y;while(y=h.read()){var b=y.fn;var w=y.args;switch(b){case OPS.setFont:v=f(w[0].name).translated;r.fontSize=w[1];break;case OPS.setTextRise:r.textRise=w[0];break;case OPS.setHScale:r.textHScale=w[0]/100;break;case OPS.setLeading:r.leading=w[0];break;case OPS.moveText:r.translateTextMatrix(w[0],w[1]);break;case OPS.setLeadingMoveText:r.leading=-w[1];r.translateTextMatrix(w[0],w[1]);break;case OPS.nextLine:r.translateTextMatrix(0,-r.leading);break;case OPS.setTextMatrix:r.setTextMatrix(w[0],w[1],w[2],w[3],w[4],w[5]);break;case OPS.setCharSpacing:m=w[0];break;case OPS.setWordSpacing:g=w[0];break;case OPS.beginText:r.initialiseTextObj();break;case OPS.showSpacedText:var E=w[0];for(var S=0,x=E.length;S<x;S++){if(typeof E[S]==="string"){d.push(fontCharsToUnicode(E[S],v))}else if(E[S]<0&&v.spaceWidth>0){var T=-E[S]/v.spaceWidth;if(T>o){T=Math.round(T);while(T--){d.push(" ")}}else if(T>s){d.push(" ")}}}break;case OPS.showText:d.push(fontCharsToUnicode(w[0],v));break;case OPS.nextLineShowText:d.push(fontCharsToUnicode(w[0],v));break;case OPS.nextLineSetSpacingShowText:d.push(fontCharsToUnicode(w[2],v));break;case OPS.paintXObject:d.length=0;if(w[0].code){break}if(!l){l=n.get("XObject")||new Dict}var N=w[0].name;if(c.key===N){if(c.texts){Util.concatenateToArray(i,c.texts)}break}var C=l.get(N);if(!C){break}assertWellFormed(isStream(C),"XObject should be a stream");var k=C.dict.get("Subtype");assertWellFormed(isName(k),"XObject should have a Name subtype");if("Form"!==k.name){c.key=N;c.texts=null;break}var L=this.getTextContent(C,C.dict.get("Resources")||n,r);c.key=N;c.texts=L;Util.concatenateToArray(i,L);break;case OPS.setGState:var A=w[0];var O=n.get("ExtGState");if(!isDict(O)||!O.has(A.name)){break}var M=O.get(A.name);for(var _=0;_<M.length;_++){if(M[_]==="Font"){v=f(w[0].name).translated}}break}if(d.length>0){var D=d.join("");var P=PDFJS.bidi(D,-1,v.vertical);var H=r.calcRenderParams(h.ctm);var B=r.fontSize*H.vScale;var j=v.ascent?v.ascent*B:v.descent?(1+v.descent)*B:B;P.x=H.renderMatrix[4]-j*Math.sin(H.angle);P.y=H.renderMatrix[5]+j*Math.cos(H.angle);if(P.dir=="ttb"){P.x+=H.vScale/2;P.y-=H.vScale}P.angle=H.angle;P.size=B;i.push(P);d.length=0}}return i},extractDataStructures:function(t,n,r,i){var s=t.get("ToUnicode")||n.get("ToUnicode");if(s){i.toUnicode=this.readToUnicode(s,r,i)}if(i.composite){var o=t.get("CIDSystemInfo");if(isDict(o)){i.cidSystemInfo={registry:o.get("Registry"),ordering:o.get("Ordering"),supplement:o.get("Supplement")}}var u=t.get("CIDToGIDMap");if(isStream(u)){i.cidToGidMap=this.readCidToGidMap(u)}}var a=[];var f=null;if(t.has("Encoding")){var l=t.get("Encoding");if(isDict(l)){f=l.get("BaseEncoding");f=isName(f)?f.name:null;if(l.has("Differences")){var c=l.get("Differences");var h=0;for(var p=0,d=c.length;p<d;p++){var v=c[p];if(isNum(v)){h=v}else{a[h++]=v.name}}}}else if(isName(l)){f=l.name}else{error("Encoding is not a Name nor a Dict")}if(f!=="MacRomanEncoding"&&f!=="MacExpertEncoding"&&f!=="WinAnsiEncoding"){f=null}}if(f){i.defaultEncoding=Encodings[f].slice()}else{var l=i.type==="TrueType"?Encodings.WinAnsiEncoding:Encodings.StandardEncoding;if(!!(i.flags&FontFlags.Symbolic)){l=!i.file&&/Symbol/i.test(i.name)?Encodings.SymbolSetEncoding:Encodings.MacRomanEncoding}i.defaultEncoding=l}i.differences=a;i.baseEncodingName=f;i.dict=t},readToUnicode:function(t){var n=t;var r=[];if(isName(n)){return CMapFactory.create(n).map}else if(isStream(n)){var i=CMapFactory.create(n).map;i.forEach(function(e,t){var n=[];for(var r=0;r<e.length;r+=2){var s=e.charCodeAt(r)<<8|e.charCodeAt(r+1);if((s&63488)!==55296){n.push(s);continue}r+=2;var o=e.charCodeAt(r)<<8|e.charCodeAt(r+1);n.push(((s&1023)<<10)+(o&1023)+65536)}i[t]=String.fromCharCode.apply(String,n)});return i}return null},readCidToGidMap:function(t){var n=t.getBytes();var r=[];for(var i=0,s=n.length;i<s;i++){var o=n[i++]<<8|n[i];if(o===0){continue}var u=i>>1;r[u]=o}return r},extractWidths:function(t,n,r,i){var s=[];var o=0;var u=[];var a;if(i.composite){o=t.get("DW")||1e3;var f=t.get("W");if(f){for(var l=0,c=f.length;l<c;l++){var h=f[l++];var p=n.fetchIfRef(f[l]);if(isArray(p)){for(var d=0,v=p.length;d<v;d++){s[h++]=p[d]}}else{var m=f[++l];for(var d=h;d<=p;d++){s[d]=m}}}}if(i.vertical){var g=t.get("DW2")||[880,-1e3];a=[g[1],o*.5,g[0]];g=t.get("W2");if(g){for(var l=0,c=g.length;l<c;l++){var h=g[l++];var p=n.fetchIfRef(g[l]);if(isArray(p)){for(var d=0,v=p.length;d<v;d++){u[h++]=[p[d++],p[d++],p[d]]}}else{var y=[g[++l],g[++l],g[++l]];for(var d=h;d<=p;d++){u[d]=y}}}}}}else{var b=i.firstChar;var f=t.get("Widths");if(f){var d=b;for(var l=0,c=f.length;l<c;l++){s[d++]=f[l]}o=parseFloat(r.get("MissingWidth"))||0}else{var w=t.get("BaseFont");if(isName(w)){var E=this.getBaseFontMetrics(w.name);s=this.buildCharCodeToWidth(E.widths,i);o=E.defaultWidth}}}var S=true;var x=o;for(var T in s){var N=s[T];if(!N){continue}if(!x){x=N;continue}if(x!=N){S=false;break}}if(S){i.flags|=FontFlags.FixedPitch}i.defaultWidth=o;i.widths=s;i.defaultVMetrics=a;i.vmetrics=u},isSerifFont:function(t){var n=t.split("-")[0];return n in serifFonts||n.search(/serif/gi)!==-1},getBaseFontMetrics:function(t){var n=0;var r=[];var i=false;var s=stdFontMap[t]||t;if(!(s in Metrics)){if(this.isSerifFont(t)){s="Times-Roman"}else{s="Helvetica"}}var o=Metrics[s];if(isNum(o)){n=o;i=true}else{r=o}return{defaultWidth:n,monospace:i,widths:r}},buildCharCodeToWidth:function(t,n){var r=Object.create(null);var i=n.differences;var s=n.defaultEncoding;for(var o=0;o<256;o++){if(o in i&&t[i[o]]){r[o]=t[i[o]];continue}if(o in s&&t[s[o]]){r[o]=t[s[o]];continue}}return r},translateFont:function(t,n){var r=t;var i=t.get("Subtype");assertWellFormed(isName(i),"invalid font Subtype");var s=false;if(i.name=="Type0"){var o=t.get("DescendantFonts");if(!o){error("Descendant fonts are not specified")}t=isArray(o)?n.fetchIfRef(o[0]):o;i=t.get("Subtype");assertWellFormed(isName(i),"invalid font Subtype");s=true}var u=s?65535:255;var a=t.get("FontDescriptor");if(!a){if(i.name=="Type3"){a=new Dict;a.set("FontName",Name.get(i.name))}else{var f=t.get("BaseFont");if(!isName(f)){error("Base font is not specified")}f=f.name.replace(/[,_]/g,"-");var l=this.getBaseFontMetrics(f);var c=f.split("-")[0];var h=(this.isSerifFont(c)?FontFlags.Serif:0)|(l.monospace?FontFlags.FixedPitch:0)|(symbolsFonts[c]?FontFlags.Symbolic:FontFlags.Nonsymbolic);var p={type:i.name,name:f,widths:l.widths,defaultWidth:l.defaultWidth,flags:h,firstChar:0,lastChar:u};this.extractDataStructures(t,t,n,p);p.widths=this.buildCharCodeToWidth(l.widths,p);return new Font(f,null,p)}}var d=t.get("FirstChar")||0;var v=t.get("LastChar")||u;var m=a.get("FontName");var g=t.get("BaseFont");if(isString(m)){m=Name.get(m)}if(isString(g)){g=Name.get(g)}if(i.name!=="Type3"){var y=m&&m.name;var b=g&&g.name;if(y!==b){info("The FontDescriptor's FontName is \""+y+'" but should be the same as the Font\'s BaseFont "'+b+'"')}}m=m||g;assertWellFormed(isName(m),"invalid font name");var w=a.get("FontFile","FontFile2","FontFile3");if(w){if(w.dict){var E=w.dict.get("Subtype");if(E){E=E.name}var S=w.dict.get("Length1");var x=w.dict.get("Length2")}}var p={type:i.name,name:m.name,subtype:E,file:w,length1:S,length2:x,loadedName:r.loadedName,composite:s,wideChars:s,fixedPitch:false,fontMatrix:t.get("FontMatrix")||FONT_IDENTITY_MATRIX,firstChar:d||0,lastChar:v||u,bbox:a.get("FontBBox"),ascent:a.get("Ascent"),descent:a.get("Descent"),xHeight:a.get("XHeight"),capHeight:a.get("CapHeight"),flags:a.get("Flags"),italicAngle:a.get("ItalicAngle"),coded:false};if(s){var T=r.get("Encoding");if(isName(T)){p.cidEncoding=T.name}p.cMap=CMapFactory.create(T,{url:PDFJS.cMapUrl,packed:PDFJS.cMapPacked},null);p.vertical=p.cMap.vertical}this.extractDataStructures(t,r,n,p);this.extractWidths(t,n,a,p);if(i.name==="Type3"){p.coded=true}return new Font(m.name,w,p)}};return t}();var OperatorList=function(){function r(e){var t=[];var n=e.fnArray,r=e.argsArray;for(var i=0,s=e.length;i<s;i++){switch(n[i]){case OPS.paintInlineImageXObject:case OPS.paintInlineImageXObjectGroup:case OPS.paintImageMaskXObject:var o=r[i][0];if(!o.cached){t.push(o.data.buffer)}break}}return t}function i(e,t,n){this.messageHandler=t;this.fnArray=[];this.argsArray=[];this.dependencies={};this.pageIndex=n;this.intent=e}var t=1e3;var n=t-5;i.prototype={get length(){return this.argsArray.length},addOp:function(e,r){this.fnArray.push(e);this.argsArray.push(r);if(this.messageHandler){if(this.fnArray.length>=t){this.flush()}else if(this.fnArray.length>=n&&(e===OPS.restore||e===OPS.endText)){this.flush()}}},addDependency:function(e){if(e in this.dependencies){return}this.dependencies[e]=true;this.addOp(OPS.dependency,[e])},addDependencies:function(e){for(var t in e){this.addDependency(t)}},addOpList:function(e){Util.extendObj(this.dependencies,e.dependencies);for(var t=0,n=e.length;t<n;t++){this.addOp(e.fnArray[t],e.argsArray[t])}},getIR:function(){return{fnArray:this.fnArray,argsArray:this.argsArray,length:this.length}},flush:function(e){(new QueueOptimizer).optimize(this);var t=r(this);this.messageHandler.send("RenderPageChunk",{operatorList:{fnArray:this.fnArray,argsArray:this.argsArray,lastChunk:e,length:this.length},pageIndex:this.pageIndex,intent:this.intent},null,t);this.dependencies={};this.fnArray.length=0;this.argsArray.length=0}};return i}();var TextState=function(){function t(){this.fontSize=0;this.textMatrix=[1,0,0,1,0,0];this.stateStack=[];this.leading=0;this.textHScale=1;this.textRise=0}t.prototype={initialiseTextObj:function(){var t=this.textMatrix;t[0]=1;t[1]=0;t[2]=0;t[3]=1;t[4]=0;t[5]=0},setTextMatrix:function(t,n,r,i,s,o){var u=this.textMatrix;u[0]=t;u[1]=n;u[2]=r;u[3]=i;u[4]=s;u[5]=o},translateTextMatrix:function(t,n){var r=this.textMatrix;r[4]=r[0]*t+r[2]*n+r[4];r[5]=r[1]*t+r[3]*n+r[5]},calcRenderParams:function(t){var n=this.textMatrix;var r=this.fontSize;var i=r*this.textHScale;var s=this.textRise;var o=Math.sqrt(n[2]*n[2]+n[3]*n[3]);var u=Math.atan2(n[1],n[0]);var a=n[0]*t[0]+n[1]*t[2];var f=n[0]*t[1]+n[1]*t[3];var l=n[2]*t[0]+n[3]*t[2];var c=n[2]*t[1]+n[3]*t[3];var h=n[4]*t[0]+n[5]*t[2]+t[4];var p=n[4]*t[1]+n[5]*t[3]+t[5];var d=[i*a,i*f,r*l,r*c,s*l+h,s*c+p];return{renderMatrix:d,vScale:o,angle:u}}};return t}();var EvalState=function(){function t(){this.font=null;this.textRenderingMode=TextRenderingMode.FILL}t.prototype={clone:function(){return Object.create(this)}};return t}();var EvaluatorPreprocessor=function e(){function e(e,n){this.parser=new Parser(new Lexer(e,t),false,n);this.ctm=new Float32Array([1,0,0,1,0,0]);this.savedStates=[]}var t={w:{id:OPS.setLineWidth,numArgs:1,variableArgs:false},J:{id:OPS.setLineCap,numArgs:1,variableArgs:false},j:{id:OPS.setLineJoin,numArgs:1,variableArgs:false},M:{id:OPS.setMiterLimit,numArgs:1,variableArgs:false},d:{id:OPS.setDash,numArgs:2,variableArgs:false},ri:{id:OPS.setRenderingIntent,numArgs:1,variableArgs:false},i:{id:OPS.setFlatness,numArgs:1,variableArgs:false},gs:{id:OPS.setGState,numArgs:1,variableArgs:false},q:{id:OPS.save,numArgs:0,variableArgs:false},Q:{id:OPS.restore,numArgs:0,variableArgs:false},cm:{id:OPS.transform,numArgs:6,variableArgs:false},m:{id:OPS.moveTo,numArgs:2,variableArgs:false},l:{id:OPS.lineTo,numArgs:2,variableArgs:false},c:{id:OPS.curveTo,numArgs:6,variableArgs:false},v:{id:OPS.curveTo2,numArgs:4,variableArgs:false},y:{id:OPS.curveTo3,numArgs:4,variableArgs:false},h:{id:OPS.closePath,numArgs:0,variableArgs:false},re:{id:OPS.rectangle,numArgs:4,variableArgs:false},S:{id:OPS.stroke,numArgs:0,variableArgs:false},s:{id:OPS.closeStroke,numArgs:0,variableArgs:false},f:{id:OPS.fill,numArgs:0,variableArgs:false},F:{id:OPS.fill,numArgs:0,variableArgs:false},"f*":{id:OPS.eoFill,numArgs:0,variableArgs:false},B:{id:OPS.fillStroke,numArgs:0,variableArgs:false},"B*":{id:OPS.eoFillStroke,numArgs:0,variableArgs:false},b:{id:OPS.closeFillStroke,numArgs:0,variableArgs:false},"b*":{id:OPS.closeEOFillStroke,numArgs:0,variableArgs:false},n:{id:OPS.endPath,numArgs:0,variableArgs:false},W:{id:OPS.clip,numArgs:0,variableArgs:false},"W*":{id:OPS.eoClip,numArgs:0,variableArgs:false},BT:{id:OPS.beginText,numArgs:0,variableArgs:false},ET:{id:OPS.endText,numArgs:0,variableArgs:false},Tc:{id:OPS.setCharSpacing,numArgs:1,variableArgs:false},Tw:{id:OPS.setWordSpacing,numArgs:1,variableArgs:false},Tz:{id:OPS.setHScale,numArgs:1,variableArgs:false},TL:{id:OPS.setLeading,numArgs:1,variableArgs:false},Tf:{id:OPS.setFont,numArgs:2,variableArgs:false},Tr:{id:OPS.setTextRenderingMode,numArgs:1,variableArgs:false},Ts:{id:OPS.setTextRise,numArgs:1,variableArgs:false},Td:{id:OPS.moveText,numArgs:2,variableArgs:false},TD:{id:OPS.setLeadingMoveText,numArgs:2,variableArgs:false},Tm:{id:OPS.setTextMatrix,numArgs:6,variableArgs:false},"T*":{id:OPS.nextLine,numArgs:0,variableArgs:false},Tj:{id:OPS.showText,numArgs:1,variableArgs:false},TJ:{id:OPS.showSpacedText,numArgs:1,variableArgs:false},"'":{id:OPS.nextLineShowText,numArgs:1,variableArgs:false},'"':{id:OPS.nextLineSetSpacingShowText,numArgs:3,variableArgs:false},d0:{id:OPS.setCharWidth,numArgs:2,variableArgs:false},d1:{id:OPS.setCharWidthAndBounds,numArgs:6,variableArgs:false},CS:{id:OPS.setStrokeColorSpace,numArgs:1,variableArgs:false},cs:{id:OPS.setFillColorSpace,numArgs:1,variableArgs:false},SC:{id:OPS.setStrokeColor,numArgs:4,variableArgs:true},SCN:{id:OPS.setStrokeColorN,numArgs:33,variableArgs:true},sc:{id:OPS.setFillColor,numArgs:4,variableArgs:true},scn:{id:OPS.setFillColorN,numArgs:33,variableArgs:true},G:{id:OPS.setStrokeGray,numArgs:1,variableArgs:false},g:{id:OPS.setFillGray,numArgs:1,variableArgs:false},RG:{id:OPS.setStrokeRGBColor,numArgs:3,variableArgs:false},rg:{id:OPS.setFillRGBColor,numArgs:3,variableArgs:false},K:{id:OPS.setStrokeCMYKColor,numArgs:4,variableArgs:false},k:{id:OPS.setFillCMYKColor,numArgs:4,variableArgs:false},sh:{id:OPS.shadingFill,numArgs:1,variableArgs:false},BI:{id:OPS.beginInlineImage,numArgs:0,variableArgs:false},ID:{id:OPS.beginImageData,numArgs:0,variableArgs:false},EI:{id:OPS.endInlineImage,numArgs:1,variableArgs:false},Do:{id:OPS.paintXObject,numArgs:1,variableArgs:false},MP:{id:OPS.markPoint,numArgs:1,variableArgs:false},DP:{id:OPS.markPointProps,numArgs:2,variableArgs:false},BMC:{id:OPS.beginMarkedContent,numArgs:1,variableArgs:false},BDC:{id:OPS.beginMarkedContentProps,numArgs:2,variableArgs:false},EMC:{id:OPS.endMarkedContent,numArgs:0,variableArgs:false},BX:{id:OPS.beginCompat,numArgs:0,variableArgs:false},EX:{id:OPS.endCompat,numArgs:0,variableArgs:false},BM:null,BD:null,"true":null,fa:null,fal:null,fals:null,"false":null,nu:null,nul:null,"null":null};e.prototype={get savedStatesDepth(){return this.savedStates.length},read:function(){var n=[];while(true){var r=this.parser.getObj();if(isEOF(r)){return null}if(!isCmd(r)){if(r!==null&&r!==undefined){n.push(r instanceof Dict?r.getAll():r);assertWellFormed(n.length<=33,"Too many arguments")}continue}var i=r.cmd;var s=t[i];if(!s){warn('Unknown command "'+i+'"');continue}var o=s.id;if(s.variableArgs){if(n.length>s.numArgs){info("Command "+o+": expected [0,"+s.numArgs+"] args, but received "+n.length+" args")}}else{if(n.length<s.numArgs){info("Command "+o+": because expected "+s.numArgs+" args, but received "+n.length+" args; skipping");n=[];continue}else if(n.length>s.numArgs){info("Command "+o+": expected "+s.numArgs+" args, but received "+n.length+" args")}}this.preprocessCommand(o,n);return{fn:o,args:n}}},getState:function(){return{ctm:this.ctm}},setState:function(t){this.ctm=t.ctm},preprocessCommand:function(t,n){switch(t|0){case OPS.save:this.savedStates.push(this.getState());break;case OPS.restore:var r=this.savedStates.pop();if(r){this.setState(r)}break;case OPS.transform:var i=this.ctm;var s=new Float32Array(6);s[0]=i[0]*n[0]+i[2]*n[1];s[1]=i[1]*n[0]+i[3]*n[1];s[2]=i[0]*n[2]+i[2]*n[3];s[3]=i[1]*n[2]+i[3]*n[3];s[4]=i[0]*n[4]+i[2]*n[5]+i[4];s[5]=i[1]*n[4]+i[3]*n[5]+i[5];this.ctm=s;break}}};return e}();var QueueOptimizer=function(){function t(e,t,n){var r=e;for(var i=0,s=t.length-1;i<s;i++){var o=t[i];r=r[o]||(r[o]=[])}r[t[t.length-1]]=n}function n(e,t,n,r){for(var i=0;i<t;i++){var s=r[e+4*i+2];var o=s.length==1&&s[0];if(o&&o.width==1&&o.height==1&&(!o.data.length||o.data.length==1&&o.data[0]===0)){n[e+4*i+2]=OPS.paintSolidColorImageMask;continue}break}return t-i}function i(){}var r=[];t(r,[OPS.save,OPS.transform,OPS.paintInlineImageXObject,OPS.restore],function(t){var n=10;var r=200;var i=1e3;var s=1;var o=t.fnArray,u=t.argsArray;var a=t.currentOperation-3,f=a+4;var l=o.length;for(;f<l&&o[f-4]===o[f];f++){}var c=Math.min(f-a>>2,r);if(c<n){t.currentOperation=f-1;return}var h=0;var p=[],d=0;var v=s,m=s;for(var g=0;g<c;g++){var y=u[a+(g<<2)+1];var b=u[a+(g<<2)+2][0];if(v+b.width>i){h=Math.max(h,v);m+=d+2*s;v=0;d=0}p.push({transform:y,x:v,y:m,w:b.width,h:b.height});v+=b.width+2*s;d=Math.max(d,b.height)}var w=Math.max(h,v)+s;var E=m+d+s;var S=new Uint8Array(w*E*4);var x=w<<2;for(var g=0;g<c;g++){var T=u[a+(g<<2)+2][0].data;var N=p[g].w<<2;var C=0;var k=p[g].x+p[g].y*w<<2;S.set(T.subarray(0,N),k-x);for(var L=0,A=p[g].h;L<A;L++){S.set(T.subarray(C,C+N),k);C+=N;k+=x}S.set(T.subarray(C-N,C),k);while(k>=0){T[k-4]=T[k];T[k-3]=T[k+1];T[k-2]=T[k+2];T[k-1]=T[k+3];T[k+N]=T[k+N-4];T[k+N+1]=T[k+N-3];T[k+N+2]=T[k+N-2];T[k+N+3]=T[k+N-1];k-=x}}o.splice(a,c*4,OPS.paintInlineImageXObjectGroup);u.splice(a,c*4,[{width:w,height:E,kind:ImageKind.RGBA_32BPP,data:S},p]);t.currentOperation=a});t(r,[OPS.save,OPS.transform,OPS.paintImageMaskXObject,OPS.restore],function(t){var r=10;var i=100;var s=1e3;var o=t.fnArray,u=t.argsArray;var a=t.currentOperation-3,f=a+4;var l=o.length;for(;f<l&&o[f-4]===o[f];f++){}var c=f-a>>2;c=n(a,c,o,u);if(c<r){t.currentOperation=f-1;return}var h=false;if(u[a+1][1]===0&&u[a+1][2]===0){f=a+4;h=true;for(var p=1;p<c;p++,f+=4){var d=u[f-3];var v=u[f+1];if(u[f-2][0]!==u[f+2][0]||d[0]!==v[0]||d[1]!==v[1]||d[2]!==v[2]||d[3]!==v[3]){if(p<r){h=false}else{c=p}break}}}if(h){c=Math.min(c,s);var m=new Float32Array(c*2);f=a+1;for(var p=0;p<c;p++){var v=u[f];m[p<<1]=v[4];m[(p<<1)+1]=v[5];f+=4}o.splice(a,c*4,OPS.paintImageMaskXObjectRepeat);u.splice(a,c*4,[u[a+2][0],u[a+1][0],u[a+1][3],m]);t.currentOperation=a}else{c=Math.min(c,i);var g=[];for(var p=0;p<c;p++){var v=u[a+(p<<2)+1];var y=u[a+(p<<2)+2][0];g.push({data:y.data,width:y.width,height:y.height,transform:v})}o.splice(a,c*4,OPS.paintImageMaskXObjectGroup);u.splice(a,c*4,[g]);t.currentOperation=a}});t(r,[OPS.save,OPS.transform,OPS.paintImageXObject,OPS.restore],function(e){var t=3;var n=1e3;var r=e.fnArray,i=e.argsArray;var s=e.currentOperation-3,o=s+4;if(i[s+1][1]!==0||i[s+1][2]!==0){return}var u=r.length;for(;o+3<u&&r[o-4]===r[o];o+=4){if(r[o-3]!==r[o+1]||r[o-2]!==r[o+2]||r[o-1]!==r[o+3]){break}if(i[o-2][0]!==i[o+2][0]){break}var a=i[o-3];var f=i[o+1];if(a[0]!==f[0]||a[1]!==f[1]||a[2]!==f[2]||a[3]!==f[3]){break}}var l=Math.min(o-s>>2,n);if(l<t){e.currentOperation=o-1;return}var c=new Float32Array(l*2);o=s+1;for(var h=0;h<l;h++){var f=i[o];c[h<<1]=f[4];c[(h<<1)+1]=f[5];o+=4}var p=[i[s+2][0],i[s+1][0],i[s+1][3],c];r.splice(s,l*4,OPS.paintImageXObjectRepeat);i.splice(s,l*4,p);e.currentOperation=s});t(r,[OPS.beginText,OPS.setFont,OPS.setTextMatrix,OPS.showText,OPS.endText],function(e){var t=3;var n=1e3;var r=e.fnArray,i=e.argsArray;var s=e.currentOperation-4,o=s+5;var u=r.length;for(;o<u&&r[o-5]===r[o];o++){if(r[o]===OPS.setFont){if(i[o-5][0]!==i[o][0]||i[o-5][1]!==i[o][1]){break}}}var a=Math.min((o-s)/5|0,n);if(a<t){e.currentOperation=o-1;return}if(s>=4&&r[s-4]===r[s+1]&&r[s-3]===r[s+2]&&r[s-2]===r[s+3]&&r[s-1]===r[s+4]&&i[s-4][0]===i[s+1][0]&&i[s-4][1]===i[s+1][1]){a++;s-=5}var f=s+7;o=s+4;for(var l=1;l<a;l++){r[o]=r[f];i[o]=i[f];r[o+1]=r[f+1];i[o+1]=i[f+1];o+=2;f+=5}var c=(a-1)*3;r.splice(o,c);i.splice(o,c);e.currentOperation=o});i.prototype={optimize:function(t){var n=t.fnArray,i=t.argsArray;var s={currentOperation:0,fnArray:n,argsArray:i};var o,u=i.length;var a;for(o=0;o<u;o++){a=(a||r)[n[o]];if(typeof a==="function"){s.currentOperation=o;a=a(s);o=s.currentOperation;u=s.fnArray.length}}}};return i}()