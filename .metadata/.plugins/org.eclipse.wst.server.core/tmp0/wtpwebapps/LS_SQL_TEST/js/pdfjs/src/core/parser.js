"use strict";function isEOF(e){return e==EOF}var EOF={};var Parser=function(){function t(e,t,n){this.lexer=e;this.allowStreams=t;this.xref=n;this.imageCache={length:0,adler32:0,stream:null};this.refill()}t.prototype={refill:function(){this.buf1=this.lexer.getObj();this.buf2=this.lexer.getObj()},shift:function(){if(isCmd(this.buf2,"ID")){this.buf1=this.buf2;this.buf2=null}else{this.buf1=this.buf2;this.buf2=this.lexer.getObj()}},getObj:function(t){if(isCmd(this.buf1,"BI")){this.shift();return this.makeInlineImage(t)}if(isCmd(this.buf1,"[")){this.shift();var n=[];while(!isCmd(this.buf1,"]")&&!isEOF(this.buf1)){n.push(this.getObj(t))}if(isEOF(this.buf1)){error("End of file inside array")}this.shift();return n}if(isCmd(this.buf1,"<<")){this.shift();var r=new Dict(this.xref);while(!isCmd(this.buf1,">>")&&!isEOF(this.buf1)){if(!isName(this.buf1)){info("Malformed dictionary: key must be a name object");this.shift();continue}var i=this.buf1.name;this.shift();if(isEOF(this.buf1)){break}r.set(i,this.getObj(t))}if(isEOF(this.buf1)){error("End of file inside dictionary")}if(isCmd(this.buf2,"stream")){return this.allowStreams?this.makeStream(r,t):r}this.shift();return r}if(isInt(this.buf1)){var s=this.buf1;this.shift();if(isInt(this.buf1)&&isCmd(this.buf2,"R")){var o=new Ref(s,this.buf1);this.shift();this.shift();return o}return s}if(isString(this.buf1)){var u=this.buf1;this.shift();if(t){u=t.decryptString(u)}return u}var a=this.buf1;this.shift();return a},makeInlineImage:function(t){var n=this.lexer;var r=n.stream;var i=new Dict;while(!isCmd(this.buf1,"ID")&&!isEOF(this.buf1)){if(!isName(this.buf1)){error("Dictionary key must be a name object")}var s=this.buf1.name;this.shift();if(isEOF(this.buf1)){break}i.set(s,this.getObj(t))}var o=r.pos;var u=0,a,f,l;while(u!=4&&(a=r.getByte())!==-1){switch(a|0){case 32:case 13:case 10:var c=r.peekBytes(5);for(f=0,l=c.length;f<l;f++){a=c[f];if(a!==10&&a!==13&&(a<32||a>127)){u=0;break}}u=u===3?4:0;break;case 69:u=2;break;case 73:u=u===2?3:0;break;default:u=0;break}}var h=r.pos-4-o;var p=r.makeSubStream(o,h,i);var d=1e3;var v=false,m;if(h<d&&this.imageCache.length===h){var g=p.getBytes();p.reset();var y=1;var b=0;for(var f=0,l=g.length;f<l;++f){y=(y+(g[f]&255))%65521;b=(b+y)%65521}m=b<<16|y;if(this.imageCache.stream&&this.imageCache.adler32===m){this.buf2=Cmd.get("EI");this.shift();this.imageCache.stream.reset();return this.imageCache.stream}v=true}if(!v&&!this.imageCache.stream){this.imageCache.length=h;this.imageCache.stream=null}if(t){p=t.createStream(p,h)}p=this.filter(p,i,h);p.dict=i;if(v){p.cacheKey="inline_"+h+"_"+m;this.imageCache.adler32=m;this.imageCache.stream=p}this.buf2=Cmd.get("EI");this.shift();return p},fetchIfRef:function(t){return isRef(t)?this.xref.fetch(t):t},makeStream:function(t,n){var r=this.lexer;var i=r.stream;r.skipToNextLine();var s=i.pos-1;var o=this.fetchIfRef(t.get("Length"));if(!isInt(o)){info("Bad "+o+" attribute in stream");o=0}i.pos=s+o;r.nextChar();this.shift();this.shift();if(!isCmd(this.buf1,"endstream")){i.pos=s;var u=2048;var a=9;var f=[101,110,100,115,116,114,101,97,109];var l=0,c=false;while(i.pos<i.end){var h=i.peekBytes(u);var p=h.length-a;var c=false,d,v;for(d=0,v=0;d<p;d++){var m=h[d];if(m!==f[v]){d-=v;v=0}else{v++;if(v>=a){d++;c=true;break}}}if(c){l+=d-a;i.pos+=d-a;break}l+=p;i.pos+=p}if(!c){error("Missing endstream")}o=l;r.nextChar();this.shift();this.shift()}this.shift();i=i.makeSubStream(s,o,t);if(n){i=n.createStream(i,o)}i=this.filter(i,t,o);i.dict=t;return i},filter:function(t,n,r){var i=this.fetchIfRef(n.get("Filter","F"));var s=this.fetchIfRef(n.get("DecodeParms","DP"));if(isName(i)){return this.makeFilter(t,i.name,r,s)}var o=r;if(isArray(i)){var u=i;var a=s;for(var f=0,l=u.length;f<l;++f){i=u[f];if(!isName(i)){error("Bad filter name: "+i)}s=null;if(isArray(a)&&f in a){s=a[f]}t=this.makeFilter(t,i.name,o,s);o=null}}return t},makeFilter:function(t,n,r,i){if(t.dict.get("Length")===0){return new NullStream(t)}if(n=="FlateDecode"||n=="Fl"){if(i){return new PredictorStream(new FlateStream(t,r),r,i)}return new FlateStream(t,r)}if(n=="LZWDecode"||n=="LZW"){var s=1;if(i){if(i.has("EarlyChange")){s=i.get("EarlyChange")}return new PredictorStream(new LZWStream(t,r,s),r,i)}return new LZWStream(t,r,s)}if(n=="DCTDecode"||n=="DCT"){return new JpegStream(t,r,t.dict,this.xref)}if(n=="JPXDecode"||n=="JPX"){return new JpxStream(t,r,t.dict)}if(n=="ASCII85Decode"||n=="A85"){return new Ascii85Stream(t,r)}if(n=="ASCIIHexDecode"||n=="AHx"){return new AsciiHexStream(t,r)}if(n=="CCITTFaxDecode"||n=="CCF"){return new CCITTFaxStream(t,r,i)}if(n=="RunLengthDecode"||n=="RL"){return new RunLengthStream(t,r)}if(n=="JBIG2Decode"){return new Jbig2Stream(t,r,t.dict)}warn('filter "'+n+'" not supported yet');return t}};return t}();var Lexer=function(){function t(e,t){this.stream=e;this.nextChar();this.strBuf=[];this.knownCommands=t}function r(e){if(e>=48&&e<=57){return e&15}if(e>=65&&e<=70||e>=97&&e<=102){return(e&15)+9}return-1}t.isSpace=function(t){return t===32||t===9||t===13||t===10};var n=[1,0,0,0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,2,0,0,2,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,2,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];t.prototype={nextChar:function(){return this.currentChar=this.stream.getByte()},peekChar:function(){return this.stream.peekBytes(1)[0]},getNumber:function(){var t=this.currentChar;var n=false;var r=0;var i=1;if(t===45){i=-1;t=this.nextChar()}else if(t===43){t=this.nextChar()}if(t===46){r=10;t=this.nextChar()}if(t<48||t>57){error("Invalid number: "+String.fromCharCode(t));return 0}var s=t-48;var o=0;var u=1;while((t=this.nextChar())>=0){if(48<=t&&t<=57){var a=t-48;if(n){o=o*10+a}else{if(r!==0){r*=10}s=s*10+a}}else if(t===46){if(r===0){r=1}else{break}}else if(t===45){warn("Badly formated number")}else if(t===69||t===101){var f=true;t=this.peekChar();if(t===43||t===45){u=t===45?-1:1;this.nextChar()}else if(t<48||t>57){break}n=true}else{break}}if(r!==0){s/=r}if(n){s*=Math.pow(10,u*o)}return i*s},getString:function(){var t=1;var n=false;var r=this.strBuf;r.length=0;var i=this.nextChar();while(true){var s=false;switch(i|0){case-1:warn("Unterminated string");n=true;break;case 40:++t;r.push("(");break;case 41:if(--t===0){this.nextChar();n=true}else{r.push(")")}break;case 92:i=this.nextChar();switch(i){case-1:warn("Unterminated string");n=true;break;case 110:r.push("\n");break;case 114:r.push("\r");break;case 116:r.push("	");break;case 98:r.push("\b");break;case 102:r.push("\f");break;case 92:case 40:case 41:r.push(String.fromCharCode(i));break;case 48:case 49:case 50:case 51:case 52:case 53:case 54:case 55:var o=i&15;i=this.nextChar();s=true;if(i>=48&&i<=55){o=(o<<3)+(i&15);i=this.nextChar();if(i>=48&&i<=55){s=false;o=(o<<3)+(i&15)}}r.push(String.fromCharCode(o));break;case 13:if(this.peekChar()===10){this.nextChar()}break;case 10:break;default:r.push(String.fromCharCode(i));break}break;default:r.push(String.fromCharCode(i));break}if(n){break}if(!s){i=this.nextChar()}}return r.join("")},getName:function(){var t;var i=this.strBuf;i.length=0;while((t=this.nextChar())>=0&&!n[t]){if(t===35){t=this.nextChar();var s=r(t);if(s!=-1){var o=r(this.nextChar());if(o==-1){error("Illegal digit in hex char in name: "+o)}i.push(String.fromCharCode(s<<4|o))}else{i.push("#",String.fromCharCode(t))}}else{i.push(String.fromCharCode(t))}}if(i.length>128){error("Warning: name token is longer than allowed by the spec: "+i.length)}return Name.get(i.join(""))},getHexString:function(){var t=this.strBuf;t.length=0;var i=this.currentChar;var s=true;var o;var u;while(true){if(i<0){warn("Unterminated hex string");break}else if(i===62){this.nextChar();break}else if(n[i]===1){i=this.nextChar();continue}else{if(s){o=r(i);if(o===-1){warn('Ignoring invalid character "'+i+'" in hex string');i=this.nextChar();continue}}else{u=r(i);if(u===-1){warn('Ignoring invalid character "'+i+'" in hex string');i=this.nextChar();continue}t.push(String.fromCharCode(o<<4|u))}s=!s;i=this.nextChar()}}return t.join("")},getObj:function(){var t=false;var r=this.currentChar;while(true){if(r<0){return EOF}if(t){if(r===10||r==13){t=false}}else if(r===37){t=true}else if(n[r]!==1){break}r=this.nextChar()}switch(r|0){case 48:case 49:case 50:case 51:case 52:case 53:case 54:case 55:case 56:case 57:case 43:case 45:case 46:return this.getNumber();case 40:return this.getString();case 47:return this.getName();case 91:this.nextChar();return Cmd.get("[");case 93:this.nextChar();return Cmd.get("]");case 60:r=this.nextChar();if(r===60){this.nextChar();return Cmd.get("<<")}return this.getHexString();case 62:r=this.nextChar();if(r===62){this.nextChar();return Cmd.get(">>")}return Cmd.get(">");case 123:this.nextChar();return Cmd.get("{");case 125:this.nextChar();return Cmd.get("}");case 41:error("Illegal character: "+r);break}var i=String.fromCharCode(r);var s=this.knownCommands;var o=s&&i in s;while((r=this.nextChar())>=0&&!n[r]){var u=i+String.fromCharCode(r);if(o&&!(u in s)){break}if(i.length==128){error("Command token too long: "+i.length)}i=u;o=s&&i in s}if(i=="true"){return true}if(i=="false"){return false}if(i=="null"){return null}return Cmd.get(i)},skipToNextLine:function(){var t=this.stream;var n=this.currentChar;while(n>=0){if(n===13){n=this.nextChar();if(n===10){this.nextChar()}break}else if(n===10){this.nextChar();break}n=this.nextChar()}}};return t}();var Linearization=function(){function t(e){this.parser=new Parser(new Lexer(e),false,null);var t=this.parser.getObj();var n=this.parser.getObj();var r=this.parser.getObj();this.linDict=this.parser.getObj();if(isInt(t)&&isInt(n)&&isCmd(r,"obj")&&isDict(this.linDict)){var i=this.linDict.get("Linearized");if(!(isNum(i)&&i>0)){this.linDict=null}}}t.prototype={getInt:function(t){var n=this.linDict;var r;if(isDict(n)&&isInt(r=n.get(t))&&r>0){return r}error('"'+t+'" field in linearization table is invalid')},getHint:function(t){var n=this.linDict;var r,i;if(isDict(n)&&isArray(r=n.get("H"))&&r.length>=2&&isInt(i=r[t])&&i>0){return i}error("Hints table in linearization table is invalid: "+t)},get length(){if(!isDict(this.linDict)){return 0}return this.getInt("L")},get hintsOffset(){return this.getHint(0)},get hintsLength(){return this.getHint(1)},get hintsOffset2(){return this.getHint(2)},get hintsLenth2(){return this.getHint(3)},get objectNumberFirst(){return this.getInt("O")},get endFirst(){return this.getInt("E")},get numPages(){return this.getInt("N")},get mainXRefEntriesOffset(){return this.getInt("T")},get pageFirst(){return this.getInt("P")}};return t}()