"use strict";var Jbig2Image=function(){function t(){}function n(e,t,n){this.data=e;this.start=t;this.end=n}function r(e,t,n){var r=e.getContexts(t);var i=1;var s=1,o=0,u;var a=32,f=4436;while(s){var l=n.readBit(r,i);i=i<256?i<<1|l:(i<<1|l)&511|256;switch(s){case 1:u=!!l;break;case 2:if(l){break}s=7;a=2;f=0;break;case 3:if(l){break}s=7;a=4;f=4;break;case 4:if(l){break}s=7;a=6;f=20;break;case 5:if(l){break}s=7;a=8;f=84;break;case 6:if(l){break}s=7;a=12;f=340;break;default:o=(o<<1|l)>>>0;if(--a===0){s=0}continue}s++}o+=f;return!u?o:o>0?-o:null}function i(e,t,n){var r=e.getContexts("IAID");var i=1;for(var s=0;s<n;s++){var o=t.readBit(r,i);i=i<<1|o}if(n<31){return i&(1<<n)-1}return i&2147483647}function l(e){var t=1,n=0;while(e>t){t<<=1;n++}return n}function c(e,t){return e[t]<<24|e[t+1]<<16|e[t+2]<<8|e[t+3]}function h(e,t){var n=c(e,t);return n&2147483648?n+4294967296:n}function p(e,t){return e[t]<<8|e[t+1]}function d(e,t){return e[t]<<24>>24}function v(e,t,n,r,i,s,u,f){if(e){error("JBIG2 error: MMR encoding is not supported")}var l=!!s;var c=o[r].concat(u);c.sort(function(e,t){return e.y-t.y||e.x-t.x});var h=c.length;var p=new Int8Array(h);var d=new Int8Array(h);var v=[];var m=0,g=0,y=0,b=0;for(var w=0;w<h;w++){p[w]=c[w].x;d[w]=c[w].y;g=Math.min(g,c[w].x);y=Math.max(y,c[w].x);b=Math.min(b,c[w].y);if(w<h-1&&c[w].y===c[w+1].y&&c[w].x===c[w+1].x-1){m|=1<<h-1-w}else{v.push(w)}}var E=v.length;var S=new Int8Array(E);var x=new Int8Array(E);var T=new Uint16Array(E);for(var N=0;N<E;N++){w=v[N];S[N]=c[w].x;x[N]=c[w].y;T[N]=1<<h-1-w}var C=-g;var k=-b;var L=t-y;var A=a[r];var O=new Uint8Array(t);var M=[];var _=f.decoder;var D=f.contextCache.getContexts("GB");var P=0,N,H,B,j,w,F=0,I,q;for(var R=0;R<n;R++){if(i){var U=_.readBit(D,A);P^=U;if(P){M.push(O);continue}}O=new Uint8Array(O);M.push(O);for(H=0;H<t;H++){if(l&&s[R][H]){O[H]=0;continue}if(H>=C&&H<L&&R>=k){F=F<<1&m;for(w=0;w<E;w++){B=R+x[w];j=H+S[w];I=M[B][j];if(I){I=T[w];F|=I}}}else{F=0;q=h-1;for(w=0;w<h;w++,q--){j=H+p[w];if(j>=0&&j<t){B=R+d[w];if(B>=0){I=M[B][j];if(I){F|=I<<q}}}}}var z=_.readBit(D,F);O[H]=z}}return M}function m(e,t,n,r,i,s,o,a,l){var c=u[n].coding;if(n===0){c=c.concat([a[0]])}var h=c.length;var p=new Int32Array(h);var d=new Int32Array(h);for(var v=0;v<h;v++){p[v]=c[v].x;d[v]=c[v].y}var m=u[n].reference;if(n===0){m=m.concat([a[1]])}var g=m.length;var y=new Int32Array(g);var b=new Int32Array(g);for(var v=0;v<g;v++){y[v]=m[v].x;b[v]=m[v].y}var w=r[0].length;var E=r.length;var S=f[n];var x=[];var T=l.decoder;var N=l.contextCache.getContexts("GR");var C=0;for(var k=0;k<t;k++){if(o){var L=T.readBit(N,S);C^=L;if(C){error("JBIG2 error: prediction is not supported")}}var A=new Uint8Array(e);x.push(A);for(var O=0;O<e;O++){var M=0;for(var v=0;v<h;v++){var _=k+d[v],D=O+p[v];if(_<0||D<0||D>=e){M<<=1}else{M=M<<1|x[_][D]}}for(var v=0;v<g;v++){var _=k+b[v]+s;var D=O+y[v]+i;if(_<0||_>=E||D<0||D>=w){M<<=1}else{M=M<<1|r[_][D]}}var P=T.readBit(N,M);A[O]=P}}return x}function g(e,t,n,s,o,u,a,f,c,h,p){if(e){error("JBIG2 error: huffman is not supported")}var d=[];var g=0;var b=l(n.length+s);var w=p.decoder;var E=p.contextCache;while(d.length<s){var S=r(E,"IADH",w);g+=S;var x=0;var T=0;while(true){var N=r(E,"IADW",w);if(N===null){break}x+=N;T+=x;var C;if(t){var k=r(E,"IAAI",w);if(k>1){C=y(e,t,x,g,0,k,1,n.concat(d),b,0,0,1,0,u,c,h,p)}else{var L=i(E,w,b);var A=r(E,"IARDX",w);var O=r(E,"IARDY",w);var M=L<n.length?n[L]:d[L-n.length];C=m(x,g,c,M,A,O,false,h,p)}}else{C=v(false,x,g,a,false,null,f,p)}d.push(C)}}var _=[];var D=[],P=false;var H=n.length+s;while(D.length<H){var B=r(E,"IAEX",w);while(B--){D.push(P)}P=!P}for(var j=0,F=n.length;j<F;j++){if(D[j]){_.push(n[j])}}for(var I=0;I<s;j++,I++){if(D[j]){_.push(d[I])}}return _}function y(e,t,n,s,o,u,a,f,l,c,h,p,d,v,g,y,b){if(e){error("JBIG2 error: huffman is not supported")}var w=[];for(var E=0;E<s;E++){var S=new Uint8Array(n);if(o){for(var x=0;x<n;x++){S[x]=o}}w.push(S)}var T=b.decoder;var N=b.contextCache;var C=-r(N,"IADT",T);var k=0;var E=0;while(E<u){var L=r(N,"IADT",T);C+=L;var A=r(N,"IAFS",T);k+=A;var O=k;do{var M=a==1?0:r(N,"IAIT",T);var _=a*C+M;var D=i(N,T,l);var P=t&&r(N,"IARI",T);var H=f[D];var B=H[0].length;var j=H.length;if(P){var F=r(N,"IARDW",T);var I=r(N,"IARDH",T);var q=r(N,"IARDX",T);var R=r(N,"IARDY",T);B+=F;j+=I;H=m(B,j,g,H,(F>>1)+q,(I>>1)+R,false,y,b)}var U=_-(p&1?0:j);var z=O-(p&2?B:0);if(c){for(var W=0;W<j;W++){var S=w[z+W];if(!S){continue}var X=H[W];var V=Math.min(n-U,B);switch(d){case 0:for(var $=0;$<V;$++){S[U+$]|=X[$]}break;case 2:for(var $=0;$<V;$++){S[U+$]^=X[$]}break;default:error("JBIG2 error: operator "+d+" is not supported")}}O+=j-1}else{for(var $=0;$<j;$++){var S=w[U+$];if(!S){continue}var X=H[$];switch(d){case 0:for(var W=0;W<B;W++){S[z+W]|=X[W]}break;case 2:for(var W=0;W<B;W++){S[z+W]^=X[W]}break;default:error("JBIG2 error: operator "+d+" is not supported")}}O+=B-1}E++;var J=r(N,"IADS",T);if(J===null){break}O+=J+h}while(true)}return w}function b(e,t){var n={};n.number=h(e,t);var r=e[t+4];var i=r&63;if(!s[i]){error("JBIG2 error: invalid segment type: "+i)}n.type=i;n.typeName=s[i];n.deferredNonRetain=!!(r&128);var o=!!(r&64);var u=e[t+5];var a=u>>5&7;var f=[u&31];var l=t+6;if(u==7){a=c(e,l-1)&536870911;l+=3;var d=a+7>>3;f[0]=e[l++];while(--d>0){f.push(e[l++])}}else if(u==5||u==6){error("JBIG2 error: invalid referred-to flags")}n.retainBits=f;var v=n.number<=256?1:n.number<=65536?2:4;var m=[];for(var g=0;g<a;g++){var y=v==1?e[l]:v==2?p(e,l):h(e,l);m.push(y);l+=v}n.referredTo=m;if(!o){n.pageAssociation=e[l++]}else{n.pageAssociation=h(e,l);l+=4}n.length=h(e,l);l+=4;if(n.length==4294967295){if(i===38){var b=E(e,l);var w=e[l+S];var x=!!(w&1);var T=6;var N=new Uint8Array(T);if(!x){N[0]=255;N[1]=172}N[2]=b.height>>>24&255;N[3]=b.height>>16&255;N[4]=b.height>>8&255;N[5]=b.height&255;for(var g=l,C=e.length;g<C;g++){var k=0;while(k<T&&N[k]===e[g+k]){k++}if(k==T){n.length=g+T;break}}if(n.length==4294967295){error("JBIG2 error: segment end was not found")}}else{error("JBIG2 error: invalid unknown segment length")}}n.headerEnd=l;return n}function w(e,t,n,r){var i=[];var s=n;while(s<r){var o=b(t,s);s=o.headerEnd;var u={header:o,data:t};if(!e.randomAccess){u.start=s;s+=o.length;u.end=s}i.push(u);if(o.type==51){break}}if(e.randomAccess){for(var a=0,f=i.length;a<f;a++){i[a].start=s;s+=i[a].header.length;i[a].end=s}}return i}function E(e,t){return{width:h(e,t),height:h(e,t+4),x:h(e,t+8),y:h(e,t+12),combinationOperator:e[t+16]&7}}function x(e,t){var n=e.header;var r=e.data,i=e.start,s=e.end;var o;switch(n.type){case 0:var u={};var a=p(r,i);u.huffman=!!(a&1);u.refinement=!!(a&2);u.huffmanDHSelector=a>>2&3;u.huffmanDWSelector=a>>4&3;u.bitmapSizeSelector=a>>6&1;u.aggregationInstancesSelector=a>>7&1;u.bitmapCodingContextUsed=!!(a&256);u.bitmapCodingContextRetained=!!(a&512);u.template=a>>10&3;u.refinementTemplate=a>>12&1;i+=2;if(!u.huffman){var f=u.template===0?4:1;var l=[];for(var c=0;c<f;c++){l.push({x:d(r,i),y:d(r,i+1)});i+=2}u.at=l}if(u.refinement&&!u.refinementTemplate){var l=[];for(var c=0;c<2;c++){l.push({x:d(r,i),y:d(r,i+1)});i+=2}u.refinementAt=l}u.numberOfExportedSymbols=h(r,i);i+=4;u.numberOfNewSymbols=h(r,i);i+=4;o=[u,n.number,n.referredTo,r,i,s];break;case 6:case 7:var v={};v.info=E(r,i);i+=S;var m=p(r,i);i+=2;v.huffman=!!(m&1);v.refinement=!!(m&2);v.stripSize=1<<(m>>2&3);v.referenceCorner=m>>4&3;v.transposed=!!(m&64);v.combinationOperator=m>>7&3;v.defaultPixelValue=m>>9&1;v.dsOffset=m<<17>>27;v.refinementTemplate=m>>15&1;if(v.huffman){var g=p(r,i);i+=2;v.huffmanFS=g&3;v.huffmanDS=g>>2&3;v.huffmanDT=g>>4&3;v.huffmanRefinementDW=g>>6&3;v.huffmanRefinementDH=g>>8&3;v.huffmanRefinementDX=g>>10&3;v.huffmanRefinementDY=g>>12&3;v.huffmanRefinementSizeSelector=!!(g&14)}if(v.refinement&&!v.refinementTemplate){var l=[];for(var c=0;c<2;c++){l.push({x:d(r,i),y:d(r,i+1)});i+=2}v.refinementAt=l}v.numberOfSymbolInstances=h(r,i);i+=4;if(v.huffman){error("JBIG2 error: huffman is not supported")}o=[v,n.referredTo,r,i,s];break;case 38:case 39:var y={};y.info=E(r,i);i+=S;var b=r[i++];y.mmr=!!(b&1);y.template=b>>1&3;y.prediction=!!(b&8);if(!y.mmr){var f=y.template===0?4:1;var l=[];for(var c=0;c<f;c++){l.push({x:d(r,i),y:d(r,i+1)});i+=2}y.at=l}o=[y,r,i,s];break;case 48:var w={width:h(r,i),height:h(r,i+4),resolutionX:h(r,i+8),resolutionY:h(r,i+12)};if(w.height==4294967295){delete w.height}var x=r[i+16];var T=p(r,i+17);w.lossless=!!(x&1);w.refinement=!!(x&2);w.defaultPixelValue=x>>2&1;w.combinationOperator=x>>3&3;w.requiresBuffer=!!(x&32);w.combinationOperatorOverride=!!(x&64);o=[w];break;case 49:break;case 50:break;case 51:break;case 62:break;default:error("JBIG2 error: segment type "+n.typeName+"("+n.type+") is not implemented")}var N="on"+n.typeName;if(N in t){t[N].apply(t,o)}}function T(e,t){for(var n=0,r=e.length;n<r;n++){x(e[n],t)}}function N(e,t,n){var r=t;if(e[r]!=151||e[r+1]!=74||e[r+2]!=66||e[r+3]!=50||e[r+4]!=13||e[r+5]!=10||e[r+6]!=26||e[r+7]!=10){error("JBIG2 error: invalid header")}var i={};r+=8;var s=e[r++];i.randomAccess=!(s&1);if(!(s&2)){i.numberOfPages=h(e,r);r+=4}var o=w(i,e,r,n);error("Not implemented")}function C(e){var t=new k;for(var n=0,r=e.length;n<r;n++){var i=e[n];var s=w({},i.data,i.start,i.end);T(s,t)}return t.buffer}function k(){}function L(){}t.prototype={getContexts:function(e){if(e in this){return this[e]}return this[e]=new Int8Array(1<<16)}};n.prototype={get decoder(){var e=new ArithmeticDecoder(this.data,this.start,this.end);return shadow(this,"decoder",e)},get contextCache(){var e=new t;return shadow(this,"contextCache",e)}};var s=["SymbolDictionary",null,null,null,"IntermediateTextRegion",null,"ImmediateTextRegion","ImmediateLosslessTextRegion",null,null,null,null,null,null,null,null,"patternDictionary",null,null,null,"IntermediateHalftoneRegion",null,"ImmediateHalftoneRegion","ImmediateLosslessHalftoneRegion",null,null,null,null,null,null,null,null,null,null,null,null,"IntermediateGenericRegion",null,"ImmediateGenericRegion","ImmediateLosslessGenericRegion","IntermediateGenericRefinementRegion",null,"ImmediateGenericRefinementRegion","ImmediateLosslessGenericRefinementRegion",null,null,null,null,"PageInformation","EndOfPage","EndOfStripe","EndOfFile","Profiles","Tables",null,null,null,null,null,null,null,null,"Extension"];var o=[[{x:-1,y:-2},{x:0,y:-2},{x:1,y:-2},{x:-2,y:-1},{x:-1,y:-1},{x:0,y:-1},{x:1,y:-1},{x:2,y:-1},{x:-4,y:0},{x:-3,y:0},{x:-2,y:0},{x:-1,y:0}],[{x:-1,y:-2},{x:0,y:-2},{x:1,y:-2},{x:2,y:-2},{x:-2,y:-1},{x:-1,y:-1},{x:0,y:-1},{x:1,y:-1},{x:2,y:-1},{x:-3,y:0},{x:-2,y:0},{x:-1,y:0}],[{x:-1,y:-2},{x:0,y:-2},{x:1,y:-2},{x:-2,y:-1},{x:-1,y:-1},{x:0,y:-1},{x:1,y:-1},{x:-2,y:0},{x:-1,y:0}],[{x:-3,y:-1},{x:-2,y:-1},{x:-1,y:-1},{x:0,y:-1},{x:1,y:-1},{x:-4,y:0},{x:-3,y:0},{x:-2,y:0},{x:-1,y:0}]];var u=[{coding:[{x:0,y:-1},{x:1,y:-1},{x:-1,y:0}],reference:[{x:0,y:-1},{x:1,y:-1},{x:-1,y:0},{x:0,y:0},{x:1,y:0},{x:-1,y:1},{x:0,y:1},{x:1,y:1}]},{coding:[{x:-1,y:-1},{x:0,y:-1},{x:1,y:-1},{x:-1,y:0}],reference:[{x:0,y:-1},{x:-1,y:0},{x:0,y:0},{x:1,y:0},{x:0,y:1},{x:1,y:1}]}];var a=[7379,1946,227,395];var f=[32,8];var S=17;k.prototype={onPageInformation:function(t){this.currentPageInfo=t;var n=t.width+7>>3;var r=new Uint8Array(n*t.height);if(t.defaultPixelValue){for(var i=0,s=r.length;i<s;i++){r[i]=255}}this.buffer=r},drawBitmap:function(t,n){var r=this.currentPageInfo;var i=t.width,s=t.height;var o=r.width+7>>3;var u=r.combinationOperatorOverride?t.combinationOperator:r.combinationOperator;var a=this.buffer;var f=128>>(t.x&7);var l=t.y*o+(t.x>>3);switch(u){case 0:for(var c=0;c<s;c++){var h=f;var p=l;for(var d=0;d<i;d++){if(n[c][d]){a[p]|=h}h>>=1;if(!h){h=128;p++}}l+=o}break;case 2:for(var c=0;c<s;c++){var h=f;var p=l;for(var d=0;d<i;d++){if(n[c][d]){a[p]^=h}h>>=1;if(!h){h=128;p++}}l+=o}break;default:error("JBIG2 error: operator "+u+" is not supported")}},onImmediateGenericRegion:function(t,r,i,s){var o=t.info;var u=new n(r,i,s);var a=v(t.mmr,o.width,o.height,t.template,t.prediction,null,t.at,u);this.drawBitmap(o,a)},onImmediateLosslessGenericRegion:function(){this.onImmediateGenericRegion.apply(this,arguments)},onSymbolDictionary:function(t,r,i,s,o,u){var a;if(t.huffman){error("JBIG2 error: huffman is not supported")}var f=this.symbols;if(!f){this.symbols=f={}}var l=[];for(var c=0,h=i.length;c<h;c++){l=l.concat(f[i[c]])}var p=new n(s,o,u);f[r]=g(t.huffman,t.refinement,l,t.numberOfNewSymbols,t.numberOfExportedSymbols,a,t.template,t.at,t.refinementTemplate,t.refinementAt,p)},onImmediateTextRegion:function(t,r,i,s,o){var u=t.info;var a;var f=this.symbols;var c=[];for(var h=0,p=r.length;h<p;h++){c=c.concat(f[r[h]])}var d=l(c.length);var v=new n(i,s,o);var m=y(t.huffman,t.refinement,u.width,u.height,t.defaultPixelValue,t.numberOfSymbolInstances,t.stripSize,c,d,t.transposed,t.dsOffset,t.referenceCorner,t.combinationOperator,a,t.refinementTemplate,t.refinementAt,v);this.drawBitmap(u,m)},onImmediateLosslessTextRegion:function(){this.onImmediateTextRegion.apply(this,arguments)}};L.prototype={parseChunks:function(t){return C(t)}};return L}()