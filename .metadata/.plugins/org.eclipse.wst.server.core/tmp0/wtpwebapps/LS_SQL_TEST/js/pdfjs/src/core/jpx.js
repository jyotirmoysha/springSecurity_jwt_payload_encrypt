"use strict";var JpxImage=function(){function r(){this.failOnCorruptedImage=false}function i(e,t){return e[t]<<24|e[t+1]<<16|e[t+2]<<8|e[t+3]}function s(e,t){return e[t]<<8|e[t+1]}function o(e){var t=1,n=0;while(e>t){t<<=1;n++}return n}function u(e,t){e.x0=Math.ceil(t.XOsiz/e.XRsiz);e.x1=Math.ceil(t.Xsiz/e.XRsiz);e.y0=Math.ceil(t.YOsiz/e.YRsiz);e.y1=Math.ceil(t.Ysiz/e.YRsiz);e.width=e.x1-e.x0;e.height=e.y1-e.y0}function a(e,t){var n=e.SIZ;var r=[];var i=Math.ceil((n.Xsiz-n.XTOsiz)/n.XTsiz);var s=Math.ceil((n.Ysiz-n.YTOsiz)/n.YTsiz);for(var o=0;o<s;o++){for(var u=0;u<i;u++){var a={};a.tx0=Math.max(n.XTOsiz+u*n.XTsiz,n.XOsiz);a.ty0=Math.max(n.YTOsiz+o*n.YTsiz,n.YOsiz);a.tx1=Math.min(n.XTOsiz+(u+1)*n.XTsiz,n.Xsiz);a.ty1=Math.min(n.YTOsiz+(o+1)*n.YTsiz,n.Ysiz);a.width=a.tx1-a.tx0;a.height=a.ty1-a.ty0;a.components=[];r.push(a)}}e.tiles=r;var f=n.Csiz;for(var l=0,c=f;l<c;l++){var h=t[l];var p=[];for(var d=0,v=r.length;d<v;d++){var m={},a=r[d];m.tcx0=Math.ceil(a.tx0/h.XRsiz);m.tcy0=Math.ceil(a.ty0/h.YRsiz);m.tcx1=Math.ceil(a.tx1/h.XRsiz);m.tcy1=Math.ceil(a.ty1/h.YRsiz);m.width=m.tcx1-m.tcx0;m.height=m.tcy1-m.tcy0;a.components[l]=m}}}function f(e,t,n){var r=t.codingStyleParameters;var i={};if(!r.entropyCoderWithCustomPrecincts){i.PPx=15;i.PPy=15}else{i.PPx=r.precinctsSizes[n].PPx;i.PPy=r.precinctsSizes[n].PPy}i.xcb_=n>0?Math.min(r.xcb,i.PPx-1):Math.min(r.xcb,i.PPx);i.ycb_=n>0?Math.min(r.ycb,i.PPy-1):Math.min(r.ycb,i.PPy);return i}function l(e,t,n){var r=1<<n.PPx;var i=1<<n.PPy;var s=t.trx1>t.trx0?Math.ceil(t.trx1/r)-Math.floor(t.trx0/r):0;var o=t.try1>t.try0?Math.ceil(t.try1/i)-Math.floor(t.try0/i):0;var u=s*o;var a=Math.floor(t.trx0/r)*r;var f=Math.floor(t.try0/i)*i;t.precinctParameters={precinctXOffset:a,precinctYOffset:f,precinctWidth:r,precinctHeight:i,numprecinctswide:s,numprecinctshigh:o,numprecincts:u}}function c(e,t,n){var r=n.xcb_;var i=n.ycb_;var s=1<<r;var o=1<<i;var u=Math.floor(t.tbx0/s);var a=Math.floor(t.tby0/o);var f=Math.ceil(t.tbx1/s);var l=Math.ceil(t.tby1/o);var c=t.resolution.precinctParameters;var h=[];var p=[];for(var d=a;d<l;d++){for(var v=u;v<f;v++){var m={cbx:v,cby:d,tbx0:s*v,tby0:o*d,tbx1:s*(v+1),tby1:o*(d+1)};var g=Math.floor((m.tbx0-c.precinctXOffset)/c.precinctWidth);var y=Math.floor((m.tby0-c.precinctYOffset)/c.precinctHeight);var b=y+g*c.numprecinctswide;m.tbx0_=Math.max(t.tbx0,m.tbx0);m.tby0_=Math.max(t.tby0,m.tby0);m.tbx1_=Math.min(t.tbx1,m.tbx1);m.tby1_=Math.min(t.tby1,m.tby1);m.precinctNumber=b;m.subbandType=t.type;var w=(m.tbx1_-m.tbx0_)*(m.tby1_-m.tby0_);m.Lblock=3;h.push(m);var E;if(b in p){E=p[b];E.cbxMin=Math.min(E.cbxMin,v);E.cbyMin=Math.min(E.cbyMin,d);E.cbxMax=Math.max(E.cbxMax,v);E.cbyMax=Math.max(E.cbyMax,d)}else{p[b]=E={cbxMin:v,cbyMin:d,cbxMax:v,cbyMax:d}}m.precinct=E}}t.codeblockParameters={codeblockWidth:r,codeblockHeight:i,numcodeblockwide:f-u+1,numcodeblockhigh:l-l+1};t.codeblocks=h;for(var v=0,S=h.length;v<S;v++){var m=h[v];var b=m.precinctNumber}t.precincts=p}function h(e,t,n){var r=[];var i=e.subbands;for(var s=0,o=i.length;s<o;s++){var u=i[s];var a=u.codeblocks;for(var f=0,l=a.length;f<l;f++){var c=a[f];if(c.precinctNumber!=t){continue}r.push(c)}}return{layerNumber:n,codeblocks:r}}function p(e){var t=e.SIZ;var n=e.currentTile.index;var r=e.tiles[n];var i=r.codingStyleDefaultParameters.layersCount;var s=t.Csiz;var o=0;for(var u=0;u<s;u++){o=Math.max(o,r.components[u].codingStyleParameters.decompositionLevelsCount)}var a=0,f=0,l=0,c=0;this.nextPacket=function(){for(;a<i;a++){for(;f<=o;f++){for(;l<s;l++){var t=r.components[l];if(f>t.codingStyleParameters.decompositionLevelsCount){continue}var n=t.resolutions[f];var u=n.precinctParameters.numprecincts;for(;c<u;){var p=h(n,c,a);c++;return p}c=0}l=0}f=0}throw"Out of packets"}}function d(e){var t=e.SIZ;var n=e.currentTile.index;var r=e.tiles[n];var i=r.codingStyleDefaultParameters.layersCount;var s=t.Csiz;var o=0;for(var u=0;u<s;u++){o=Math.max(o,r.components[u].codingStyleParameters.decompositionLevelsCount)}var a=0,f=0,l=0,c=0;this.nextPacket=function(){for(;a<=o;a++){for(;f<i;f++){for(;l<s;l++){var t=r.components[l];if(a>t.codingStyleParameters.decompositionLevelsCount){continue}var n=t.resolutions[a];var u=n.precinctParameters.numprecincts;for(;c<u;){var p=h(n,c,f);c++;return p}c=0}l=0}f=0}throw"Out of packets"}}function v(e){var t=e.SIZ;var n=e.currentTile.index;var r=e.tiles[n];var i=t.Csiz;for(var s=0;s<i;s++){var o=r.components[s];var u=o.codingStyleParameters.decompositionLevelsCount;var a=[];var h=[];for(var v=0;v<=u;v++){var m=f(e,o,v);var g={};var y=1<<u-v;g.trx0=Math.ceil(o.tcx0/y);g.try0=Math.ceil(o.tcy0/y);g.trx1=Math.ceil(o.tcx1/y);g.try1=Math.ceil(o.tcy1/y);l(e,g,m);a.push(g);var b;if(v===0){b={};b.type="LL";b.tbx0=Math.ceil(o.tcx0/y);b.tby0=Math.ceil(o.tcy0/y);b.tbx1=Math.ceil(o.tcx1/y);b.tby1=Math.ceil(o.tcy1/y);b.resolution=g;c(e,b,m);h.push(b);g.subbands=[b]}else{var w=1<<u-v+1;var E=[];b={};b.type="HL";b.tbx0=Math.ceil(o.tcx0/w-.5);b.tby0=Math.ceil(o.tcy0/w);b.tbx1=Math.ceil(o.tcx1/w-.5);b.tby1=Math.ceil(o.tcy1/w);b.resolution=g;c(e,b,m);h.push(b);E.push(b);b={};b.type="LH";b.tbx0=Math.ceil(o.tcx0/w);b.tby0=Math.ceil(o.tcy0/w-.5);b.tbx1=Math.ceil(o.tcx1/w);b.tby1=Math.ceil(o.tcy1/w-.5);b.resolution=g;c(e,b,m);h.push(b);E.push(b);b={};b.type="HH";b.tbx0=Math.ceil(o.tcx0/w-.5);b.tby0=Math.ceil(o.tcy0/w-.5);b.tbx1=Math.ceil(o.tcx1/w-.5);b.tby1=Math.ceil(o.tcy1/w-.5);b.resolution=g;c(e,b,m);h.push(b);E.push(b);g.subbands=E}}o.resolutions=a;o.subbands=h}var S=r.codingStyleDefaultParameters.progressionOrder;var x;switch(S){case 0:r.packetsIterator=new p(e);break;case 1:r.packetsIterator=new d(e);break;default:throw"Unsupported progression order "+S}}function m(e,t,n,r){function f(e){while(u<e){var r=t[n+i];i++;if(a){s=s<<7|r;u+=7;a=false}else{s=s<<8|r;u+=8}if(r==255){a=true}}u-=e;return s>>>u&(1<<e)-1}function l(){u=0;if(a){i++;a=false}}function c(){var e=f(1);if(e===0){return 1}e=e<<1|f(1);if(e==2){return 2}e=e<<2|f(2);if(e<=14){return(e&3)+3}e=e<<5|f(5);if(e<=510){return(e&31)+6}e=e<<7|f(7);return(e&127)+37}var i=0;var s,u=0,a=false;var h=e.currentTile.index;var p=e.tiles[h];var d=p.packetsIterator;while(i<r){var v=d.nextPacket();if(!f(1)){l();continue}var m=v.layerNumber;var g=[];for(var y=0,b=v.codeblocks.length;y<b;y++){var w=v.codeblocks[y];var x=w.precinct;var T=w.cbx-x.cbxMin;var N=w.cby-x.cbyMin;var C=false;var k=false;if("included"in w){C=!!f(1)}else{var x=w.precinct;var L,A;if("inclusionTree"in x){L=x.inclusionTree}else{var O=x.cbxMax-x.cbxMin+1;var M=x.cbyMax-x.cbyMin+1;L=new S(O,M,m);A=new E(O,M);x.inclusionTree=L;x.zeroBitPlanesTree=A}if(L.reset(T,N,m)){while(true){if(f(1)){var _=!L.nextLevel();if(_){w.included=true;C=k=true;break}}else{L.incrementValue(m);break}}}}if(!C){continue}if(k){A=x.zeroBitPlanesTree;A.reset(T,N);while(true){if(f(1)){var _=!A.nextLevel();if(_){break}}else{A.incrementValue()}}w.zeroBitPlanes=A.value}var D=c();while(f(1)){w.Lblock++}var P=o(D);var H=(D<1<<P?P-1:P)+w.Lblock;var B=f(H);g.push({codeblock:w,codingpasses:D,dataLength:B})}l();while(g.length>0){var j=g.shift();var w=j.codeblock;if(!("data"in w)){w.data=[]}w.data.push({data:t,start:n+i,end:n+i+j.dataLength,codingpasses:j.codingpasses});i+=j.dataLength}}return i}function g(e,t,r,i,s,o,u,a,f,l){for(var c=0,h=a.length;c<h;++c){var p=a[c];var d=p.tbx1_-p.tbx0_;var v=p.tby1_-p.tby0_;if(d===0||v===0){continue}if(!("data"in p)){continue}var m,g;m=new x(d,v,p.subbandType,p.zeroBitPlanes);g=2;var y=p.data,b=0,w=0;for(var E=0,S=y.length;E<S;E++){var T=y[E];b+=T.end-T.start;w+=T.codingpasses}var N=new Uint8Array(b),C=0;for(var E=0,S=y.length;E<S;E++){var T=y[E];var k=T.data.subarray(T.start,T.end);N.set(k,C);C+=k.length}var L=new ArithmeticDecoder(N,0,b);m.setDecoder(L);for(var E=0;E<w;E++){switch(g){case 0:m.runSignificancePropogationPass();break;case 1:m.runMagnitudeRefinementPass();break;case 2:m.runCleanupPass();if(l){m.checkSegmentationSymbol()}break}g=(g+1)%3}var A=p.tbx0_-t+(p.tby0_-r)*i;var O,M,_,D=0;var P=f===n.IRREVERSIBLE;var H=m.coefficentsSign;var B=m.coefficentsMagnitude;var j=m.bitsDecoded;for(var F=0;F<v;F++){for(var C=0;C<d;C++){O=(H[D]?-1:1)*B[D];M=j[D];_=P||u>M?1<<u-M:1;e[A++]=O*_*o;D++}A+=i-d}}}function y(e,r,i){var s=r.components[i];var o=s.codingStyleParameters;var u=s.quantizationParameters;var a=o.decompositionLevelsCount;var f=u.SPqcds;var l=u.scalarExpounded;var c=u.guardBits;var h=o.transformation;var p=o.segmentationSymbolUsed;var d=e.components[i].precision;var h=o.transformation;var v=h===n.IRREVERSIBLE?new N:new C;var m=[];var y=0,b=0;for(var w=0;w<=a;w++){var E=s.resolutions[w];for(var S=0,x=E.subbands.length;S<x;S++){var T,k;if(!l){T=f[0].mu;k=f[0].epsilon+(w>0?1-w:0)}else{T=f[b].mu;k=f[b].epsilon}var L=E.subbands[S];var A=L.tbx1-L.tbx0;var O=L.tby1-L.tby0;var M=t[L.type];var _=h===n.IRREVERSIBLE?Math.pow(2,d+M-k)*(1+T/2048):1;var D=c+k-1;var P=new Float32Array(A*O);g(P,L.tbx0,L.tby0,A,O,_,D,L.codeblocks,h,p);m.push({width:A,height:O,items:P});b++}}var H=v.calculate(m,s.tcx0,s.tcy0);return{left:s.tcx0,top:s.tcy0,width:H.width,height:H.height,items:H.items}}function b(e){var t=e.SIZ;var r=e.components;var i=t.Csiz;var s=[];for(var o=0,u=e.tiles.length;o<u;o++){var a=e.tiles[o];var f=[];for(var l=0;l<i;l++){var c=y(e,a,l);f.push(c)}if(a.codingStyleDefaultParameters.multipleComponentTransform){var h=a.components[0];var p=h.codingStyleParameters.transformation;if(p===n.IRREVERSIBLE){var d=f[0].items;var v=f[1].items;var m=f[2].items;for(var g=0,b=d.length;g<b;++g){var w=d[g],E=v[g],S=m[g];d[g]=w+1.402*S+.5;v[g]=w-.34413*E-.71414*S+.5;m[g]=w+1.772*E+.5}}else{var d=f[0].items;var v=f[1].items;var m=f[2].items;for(var g=0,b=d.length;g<b;++g){var w=d[g],E=v[g],S=m[g];var x=w-(S+E>>2);v[g]=x;d[g]=S+x;m[g]=E+x}}}for(var l=0;l<i;l++){var T=r[l];if(T.isSigned){continue}var N=1<<T.precision-1;var C=f[l];var k=C.items;for(var g=0,b=k.length;g<b;g++){k[g]+=N}}for(var l=0;l<i;l++){var T=r[l];var N=T.isSigned?128:0;var L=T.precision-8;var C=f[l];var k=C.items;var A=new Uint8Array(k.length);for(var g=0,b=k.length;g<b;g++){var O=(k[g]>>L)+N;A[g]=O<0?0:O>255?255:O}f[l].items=A}s.push(f)}return s}function w(e,t){var n=e.SIZ;var r=n.Csiz;var i=e.tiles[t];var s=[];for(var o=0;o<r;o++){var u=i.components[o];var a=o in e.currentTile.QCC?e.currentTile.QCC[o]:e.currentTile.QCD;u.quantizationParameters=a;var f=o in e.currentTile.COC?e.currentTile.COC[o]:e.currentTile.COD;u.codingStyleParameters=f}i.codingStyleDefaultParameters=e.currentTile.COD}var t={LL:0,LH:1,HL:1,HH:2};var n={IRREVERSIBLE:0,REVERSIBLE:1};r.prototype={load:function(t){var n=new XMLHttpRequest;n.open("GET",t,true);n.responseType="arraybuffer";n.onload=function(){var e=new Uint8Array(n.response||n.mozResponseArrayBuffer);this.parse(e);if(this.onload){this.onload()}}.bind(this);n.send(null)},parse:function(t){function n(e,t,n){var r=0;for(var i=0;i<n;i++){r=r*256+(e[t+i]&255)}return r}var r=n(t,0,2);if(r===65359){this.parseCodestream(t,0,t.length);return}var i=0,s=t.length;while(i<s){var o=8;var u=n(t,i,4);var a=n(t,i+4,4);i+=o;if(u==1){u=n(t,i,8);i+=8;o+=8}if(u===0){u=s-i+o}if(u<o){error("JPX error: Invalid box field size")}var f=u-o;var l=true;switch(a){case 1783634458:break;case 1785737832:l=false;break;case 1668246642:break;case 1785737827:this.parseCodestream(t,i,i+f);break}if(l){i+=f}}},parseCodestream:function(t,n,r){var o={};try{var f=n;while(f<r){var l=s(t,f);f+=2;var c=0,h;switch(l){case 65359:o.mainHeader=true;break;case 65497:break;case 65361:c=s(t,f);var p={};p.Xsiz=i(t,f+4);p.Ysiz=i(t,f+8);p.XOsiz=i(t,f+12);p.YOsiz=i(t,f+16);p.XTsiz=i(t,f+20);p.YTsiz=i(t,f+24);p.XTOsiz=i(t,f+28);p.YTOsiz=i(t,f+32);var d=s(t,f+36);p.Csiz=d;var g=[];h=f+38;for(var y=0;y<d;y++){var E={precision:(t[h]&127)+1,isSigned:!!(t[h]&128),XRsiz:t[h+1],YRsiz:t[h+1]};u(E,p);g.push(E)}o.SIZ=p;o.components=g;a(o,g);o.QCC=[];o.COC=[];break;case 65372:c=s(t,f);var S={};h=f+2;var x=t[h++];var T,N;switch(x&31){case 0:T=8;N=true;break;case 1:T=16;N=false;break;case 2:T=16;N=true;break;default:throw"Invalid SQcd value "+x}S.noQuantization=T==8;S.scalarExpounded=N;S.guardBits=x>>5;var C=[];while(h<c+f){var k={};if(T==8){k.epsilon=t[h++]>>3;k.mu=0}else{k.epsilon=t[h]>>3;k.mu=(t[h]&7)<<8|t[h+1];h+=2}C.push(k)}S.SPqcds=C;if(o.mainHeader){o.QCD=S}else{o.currentTile.QCD=S;o.currentTile.QCC=[]}break;case 65373:c=s(t,f);var L={};h=f+2;var A;if(o.SIZ.Csiz<257){A=t[h++]}else{A=s(t,h);h+=2}var x=t[h++];var T,N;switch(x&31){case 0:T=8;N=true;break;case 1:T=16;N=false;break;case 2:T=16;N=true;break;default:throw"Invalid SQcd value "+x}L.noQuantization=T==8;L.scalarExpounded=N;L.guardBits=x>>5;var C=[];while(h<c+f){var k={};if(T==8){k.epsilon=t[h++]>>3;k.mu=0}else{k.epsilon=t[h]>>3;k.mu=(t[h]&7)<<8|t[h+1];h+=2}C.push(k)}L.SPqcds=C;if(o.mainHeader){o.QCC[A]=L}else{o.currentTile.QCC[A]=L}break;case 65362:c=s(t,f);var O={};h=f+2;var M=t[h++];O.entropyCoderWithCustomPrecincts=!!(M&1);O.sopMarkerUsed=!!(M&2);O.ephMarkerUsed=!!(M&4);var _={};O.progressionOrder=t[h++];O.layersCount=s(t,h);h+=2;O.multipleComponentTransform=t[h++];O.decompositionLevelsCount=t[h++];O.xcb=(t[h++]&15)+2;O.ycb=(t[h++]&15)+2;var D=t[h++];O.selectiveArithmeticCodingBypass=!!(D&1);O.resetContextProbabilities=!!(D&2);O.terminationOnEachCodingPass=!!(D&4);O.verticalyStripe=!!(D&8);O.predictableTermination=!!(D&16);O.segmentationSymbolUsed=!!(D&32);O.transformation=t[h++];if(O.entropyCoderWithCustomPrecincts){var P=[];while(h<c+f){var H=t[h++];P.push({PPx:H&15,PPy:H>>4})}O.precinctsSizes=P}if(O.sopMarkerUsed||O.ephMarkerUsed||O.selectiveArithmeticCodingBypass||O.resetContextProbabilities||O.terminationOnEachCodingPass||O.verticalyStripe||O.predictableTermination){throw"Unsupported COD options: "+globalScope.JSON.stringify(O)}if(o.mainHeader){o.COD=O}else{o.currentTile.COD=O;o.currentTile.COC=[]}break;case 65424:c=s(t,f);var B={};B.index=s(t,f+2);B.length=i(t,f+4);B.dataEnd=B.length+f-2;B.partIndex=t[f+8];B.partsCount=t[f+9];o.mainHeader=false;if(B.partIndex===0){B.COD=o.COD;B.COC=o.COC.slice(0);B.QCD=o.QCD;B.QCC=o.QCC.slice(0)}o.currentTile=B;break;case 65427:var B=o.currentTile;if(B.partIndex===0){w(o,B.index);v(o)}c=B.dataEnd-f;m(o,t,f,c);break;case 65380:c=s(t,f);break;default:throw"Unknown codestream code: "+l.toString(16)}f+=c}}catch(j){if(this.failOnCorruptedImage){error("JPX error: "+j)}else{warn("JPX error: "+j+". Trying to recover")}}this.tiles=b(o);this.width=o.SIZ.Xsiz-o.SIZ.XOsiz;this.height=o.SIZ.Ysiz-o.SIZ.YOsiz;this.componentsCount=o.SIZ.Csiz}};var E=function(){function t(e,t){var n=o(Math.max(e,t))+1;this.levels=[];for(var r=0;r<n;r++){var i={width:e,height:t,items:[]};this.levels.push(i);e=Math.ceil(e/2);t=Math.ceil(t/2)}}t.prototype={reset:function(t,n){var r=0,i=0;while(r<this.levels.length){var s=this.levels[r];var o=t+n*s.width;if(o in s.items){i=s.items[o];break}s.index=o;t>>=1;n>>=1;r++}r--;var s=this.levels[r];s.items[s.index]=i;this.currentLevel=r;delete this.value},incrementValue:function(){var t=this.levels[this.currentLevel];t.items[t.index]++},nextLevel:function(){var t=this.currentLevel;var n=this.levels[t];var r=n.items[n.index];t--;if(t<0){this.value=r;return false}this.currentLevel=t;var n=this.levels[t];n.items[n.index]=r;return true}};return t}();var S=function(){function t(e,t,n){var r=o(Math.max(e,t))+1;this.levels=[];for(var i=0;i<r;i++){var s=new Uint8Array(e*t);for(var u=0,a=s.length;u<a;u++){s[u]=n}var f={width:e,height:t,items:s};this.levels.push(f);e=Math.ceil(e/2);t=Math.ceil(t/2)}}t.prototype={reset:function(t,n,r){var i=0;while(i<this.levels.length){var s=this.levels[i];var o=t+n*s.width;s.index=o;var u=s.items[o];if(u==255){break}if(u>r){this.currentLevel=i;this.propagateValues();return false}t>>=1;n>>=1;i++}this.currentLevel=i-1;return true},incrementValue:function(t){var n=this.levels[this.currentLevel];n.items[n.index]=t+1;this.propagateValues()},propagateValues:function(){var t=this.currentLevel;var n=this.levels[t];var r=n.items[n.index];while(--t>=0){var n=this.levels[t];n.items[n.index]=r}},nextLevel:function(){var t=this.currentLevel;var n=this.levels[t];var r=n.items[n.index];n.items[n.index]=255;t--;if(t<0){return false}this.currentLevel=t;var n=this.levels[t];n.items[n.index]=r;return true}};return t}();var x=function(){function o(e,t,n,r){if(n){if(!r){return e?!t?1:0:1}else{return e?!t?0:-1:-1}}else{return e?!t?1:-1:0}}function a(e,t,n,o){this.width=e;this.height=t;this.contextLabelTable=n=="HH"?s:n=="HL"?i:r;var u=e*t;this.neighborsSignificance=new Uint8Array(u);this.coefficentsSign=new Uint8Array(u);this.coefficentsMagnitude=new Uint32Array(u);this.processingFlags=new Uint8Array(u);var a=new Uint8Array(this.width*this.height);for(var f=0,l=a.length;f<l;f++){a[f]=o}this.bitsDecoded=a;this.reset()}var t=17;var n=18;var r=new Uint8Array([0,5,8,0,3,7,8,0,4,7,8,0,0,0,0,0,1,6,8,0,3,7,8,0,4,7,8,0,0,0,0,0,2,6,8,0,3,7,8,0,4,7,8,0,0,0,0,0,2,6,8,0,3,7,8,0,4,7,8,0,0,0,0,0,2,6,8,0,3,7,8,0,4,7,8]);var i=new Uint8Array([0,3,4,0,5,7,7,0,8,8,8,0,0,0,0,0,1,3,4,0,6,7,7,0,8,8,8,0,0,0,0,0,2,3,4,0,6,7,7,0,8,8,8,0,0,0,0,0,2,3,4,0,6,7,7,0,8,8,8,0,0,0,0,0,2,3,4,0,6,7,7,0,8,8,8]);var s=new Uint8Array([0,1,2,0,1,2,2,0,2,2,2,0,0,0,0,0,3,4,5,0,4,5,5,0,5,5,5,0,0,0,0,0,6,7,7,0,7,7,7,0,7,7,7,0,0,0,0,0,8,8,8,0,8,8,8,0,8,8,8,0,0,0,0,0,8,8,8,0,8,8,8,0,8,8,8]);var u=[{contextLabel:13,xorBit:0},{contextLabel:12,xorBit:0},{contextLabel:11,xorBit:0},{contextLabel:10,xorBit:0},{contextLabel:9,xorBit:0},{contextLabel:10,xorBit:1},{contextLabel:11,xorBit:1},{contextLabel:12,xorBit:1},{contextLabel:13,xorBit:1}];a.prototype={setDecoder:function(t){this.decoder=t},reset:function(){this.contexts=new Int8Array(19);this.contexts[0]=4<<1|0;this.contexts[t]=46<<1|0;this.contexts[n]=3<<1|0},setNeighborsSignificance:function(t,n){var r=this.neighborsSignificance;var i=this.width,s=this.height;var o=t*i+n;if(t>0){if(n>0){r[o-i-1]+=16}if(n+1<i){r[o-i+1]+=16}r[o-i]+=4}if(t+1<s){if(n>0){r[o+i-1]+=16}if(n+1<i){r[o+i+1]+=16}r[o+i]+=4}if(n>0){r[o-1]+=1}if(n+1<i){r[o+1]+=1}r[o]|=128},runSignificancePropogationPass:function(){var t=this.decoder;var n=this.width,r=this.height;var i=this.coefficentsMagnitude;var s=this.coefficentsSign;var o=this.contextLabels;var u=this.neighborsSignificance;var a=this.processingFlags;var f=this.contexts;var l=this.contextLabelTable;var c=this.bitsDecoded;var h=~1;var p=1;var d=2;for(var v=0,m=n*r;v<m;v++){a[v]&=h}for(var g=0;g<r;g+=4){for(var y=0;y<n;y++){var b=g*n+y;for(var w=0;w<4;w++,b+=n){var E=g+w;if(E>=r){break}if(i[b]||!u[b]){continue}var S=l[u[b]];var x=t.readBit(f,S);if(x){var T=this.decodeSignBit(E,y);s[b]=T;i[b]=1;this.setNeighborsSignificance(E,y);a[b]|=d}c[b]++;a[b]|=p}}}},decodeSignBit:function(t,n){var r=this.width,i=this.height;var s=t*r+n;var a=this.coefficentsMagnitude;var f=this.coefficentsSign;var l=o(n>0&&a[s-1],f[s-1],n+1<r&&a[s+1],f[s+1]);var c=o(t>0&&a[s-r],f[s-r],t+1<i&&a[s+r],f[s+r]);var h=u[3*(1-l)+(1-c)];var p=h.contextLabel;var d=this.decoder.readBit(this.contexts,p);return d^h.xorBit},runMagnitudeRefinementPass:function(){var t=this.decoder;var n=this.width,r=this.height;var i=this.coefficentsMagnitude;var s=this.neighborsSignificance;var o=this.contexts;var u=this.bitsDecoded;var a=this.processingFlags;var f=1;var l=2;for(var c=0;c<r;c+=4){for(var h=0;h<n;h++){for(var p=0;p<4;p++){var d=c+p;if(d>=r){break}var v=d*n+h;if(!i[v]||(a[v]&f)!==0){continue}var m=16;if((a[v]&l)!==0){a[d*n+h]^=l;var g=s[v];var y=(g&3)+(g>>2&3)+(g>>4&7);m=y>=1?15:14}var b=t.readBit(o,m);i[v]=i[v]<<1|b;u[v]++;a[v]|=f}}}},runCleanupPass:function(){var r=this.decoder;var i=this.width,s=this.height;var o=this.neighborsSignificance;var u=this.significanceState;var a=this.coefficentsMagnitude;var f=this.coefficentsSign;var l=this.contexts;var c=this.contextLabelTable;var h=this.bitsDecoded;var p=this.processingFlags;var d=1;var v=2;var m=i;var g=i*2;var y=i*3;for(var b=0;b<s;b+=4){for(var w=0;w<i;w++){var E=b*i+w;var S=b+3<s&&p[E]===0&&p[E+m]===0&&p[E+g]===0&&p[E+y]===0&&o[E]===0&&o[E+m]===0&&o[E+g]===0&&o[E+y]===0;var x=0,T=E;var N;if(S){var C=r.readBit(l,n);if(!C){h[E]++;h[E+m]++;h[E+g]++;h[E+y]++;continue}x=r.readBit(l,t)<<1|r.readBit(l,t);N=b+x;T+=x*i;var k=this.decodeSignBit(N,w);f[T]=k;a[T]=1;this.setNeighborsSignificance(N,w);p[T]|=v;T=E;for(var L=b;L<=N;L++,T+=i){h[T]++}x++}for(;x<4;x++,T+=i){N=b+x;if(N>=s){break}if(a[T]||(p[T]&d)!==0){continue}var A=c[o[T]];var O=r.readBit(l,A);if(O==1){var k=this.decodeSignBit(N,w);f[T]=k;a[T]=1;this.setNeighborsSignificance(N,w);p[T]|=v}h[T]++}}}},checkSegmentationSymbol:function(){var n=this.decoder;var r=this.contexts;var i=n.readBit(r,t)<<3|n.readBit(r,t)<<2|n.readBit(r,t)<<1|n.readBit(r,t);if(i!=10){throw"Invalid segmentation symbol"}}};return a}();var T=function(){function t(){}t.prototype.calculate=function(t,n,r){var i=t[0];for(var s=1,o=t.length,u=1;s<o;s+=3,u++){i=this.iterate(i,t[s],t[s+1],t[s+2],n,r)}return i};t.prototype.extend=function(t,n,r){var i=n-1,s=n+1;var o=n+r-2,u=n+r;t[i--]=t[s++];t[u++]=t[o--];t[i--]=t[s++];t[u++]=t[o--];t[i--]=t[s++];t[u++]=t[o--];t[i]=t[s];t[u]=t[o]};t.prototype.iterate=function(t,n,r,i,s,o){var u=t.width,a=t.height,f=t.items;var l=n.width,c=n.height,h=n.items;var p=r.width,d=r.height,v=r.items;var m=i.width,g=i.height,y=i.items;var b=u+l;var w=a+d;var E=new Float32Array(b*w);var S,x,T,N;for(S=0;S<a;S++){var T=S*u,N=S*2*b;for(var x=0;x<u;x++,T++,N+=2){E[N]=f[T]}}for(S=0;S<c;S++){T=S*l;N=S*2*b+1;for(x=0;x<l;x++,T++,N+=2){E[N]=h[T]}}for(S=0;S<d;S++){T=S*p;N=(S*2+1)*b;for(x=0;x<p;x++,T++,N+=2){E[N]=v[T]}}for(S=0;S<g;S++){T=S*m;N=(S*2+1)*b+1;for(x=0;x<m;x++,T++,N+=2){E[N]=y[T]}}var C=4;var k=new Float32Array(b+2*C);for(var L=0;L<w;L++){if(b==1){if(s%1!==0){E[L*b]/=2}continue}T=L*b;k.set(E.subarray(T,T+b),C);this.extend(k,C,b);this.filter(k,C,b,s,k);E.set(k.subarray(C,C+b),T)}var A=16;var O=[];for(S=0;S<A;S++){O.push(new Float32Array(w+2*C))}var M,_=0,t=C+w;for(var D=0;D<b;D++){if(w==1){if(o%1!==0){E[D]/=2}continue}if(_===0){A=Math.min(b-D,A);for(T=D,N=C;N<t;T+=b,N++){for(M=0;M<A;M++){O[M][N]=E[T+M]}}_=A}_--;var P=O[_];this.extend(P,C,w);this.filter(P,C,w,o,P);if(_===0){T=D-A+1;for(N=C;N<t;T+=b,N++){for(M=0;M<A;M++){E[T+M]=O[M][N]}}}}return{width:b,height:w,items:E}};return t}();var N=function(){function t(){T.call(this)}t.prototype=Object.create(T.prototype);t.prototype.filter=function(t,n,r,i,s){var o=Math.floor(i/2);var u=Math.floor((i+r)/2);var a=n-i%1;var f=-1.586134342059924;var l=-.052980118572961;var c=.882911075530934;var h=.443506852043971;var p=1.230174104914001;var d=1/p;var v=a-2;for(var m=o-1,g=u+2;m<g;m++,v+=2){s[v]=p*t[v]}var v=a-3;for(var m=o-2,g=u+2;m<g;m++,v+=2){s[v]=d*t[v]}var v=a-2;for(var m=o-1,g=u+2;m<g;m++,v+=2){s[v]-=h*(s[v-1]+s[v+1])}var v=a-1;for(var m=o-1,g=u+1;m<g;m++,v+=2){s[v]-=c*(s[v-1]+s[v+1])}var v=a;for(var m=o,g=u+1;m<g;m++,v+=2){s[v]-=l*(s[v-1]+s[v+1])}var v=a+1;for(var m=o,g=u;m<g;m++,v+=2){s[v]-=f*(s[v-1]+s[v+1])}};return t}();var C=function(){function t(){T.call(this)}t.prototype=Object.create(T.prototype);t.prototype.filter=function(t,n,r,i,s){var o=Math.floor(i/2);var u=Math.floor((i+r)/2);var a=n-i%1;for(var f=o,l=u+1,c=a;f<l;f++,c+=2){s[c]=t[c]-Math.floor((t[c-1]+t[c+1]+2)/4)}for(var f=o,l=u,c=a+1;f<l;f++,c+=2){s[c]=t[c]+Math.floor((s[c-1]+s[c+1])/2)}};return t}();return r}()