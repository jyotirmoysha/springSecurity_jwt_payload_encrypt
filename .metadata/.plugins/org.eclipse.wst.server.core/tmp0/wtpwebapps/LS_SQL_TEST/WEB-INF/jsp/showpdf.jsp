 <!-- below code is for 100% zoom PDF page -->
<style>
.canvas-container canvas {
     width: 150% !important;
      pointer-events: none;
}

.modal-dialog{margin-top:0px !important}
</style>
<script type="text/javascript">
	  var dId=documentId;
	  var fId=filingId;
	  var uId=uploadId;
	  var rPageNo=1;
	  var pId=poID;
	  var coColumn=cColumn;
	  
	  var scale = 1.5;
	  var pdf =null;
	  var widthval = 80;
	  var heightval = 1;
	  
	  try{
	  //this "PDFLoadingMsg" div is present in rules_management_normalization.jsp
		var tmpObject=globalPDFObject; 
	  tmpObject.then(function(pdfObj) {
	  pdf=pdfObj;
		canvasCreation(dId,1,pdf);
			});
	  
  }catch(err){
		console.error(err.message);
		hideLoading();
	}
	var counter=0;  
 function canvasCreation(docId,pageNo,pdf){
	   	var XCO1=XC1;
	   	var XCO2=XC2;
	   	var YCO1=YC1;
	   	var YCO2=YC2;

	 	var id=docId+"_"+pageNo;
		var mainDiv="main";
	  	PDFJS.disableWorker = true;
		var element= document.createElement("canvas");
		element.setAttribute("id", id);
		element.setAttribute("class", id);
		var appendMain = document.getElementById(mainDiv);
		appendMain.appendChild(element);
		var canvas = document.getElementById(id);
		var context = canvas.getContext('2d');
		try {
		pdf.getPage(parseInt(1)).then(function(page) {
	    var viewport = page.getViewport(scale);
	    canvas.height = viewport.height;
	    canvas.width = viewport.width;
	    
	    var renderContext = {
	    	      canvasContext: context,
	    	      viewport: viewport
	    	    };
	    var renderTask = page.render({
	        canvasContext: context,
	        viewport: viewport
	      }).then(function() {
	        var bg = canvas.toDataURL("image/png");
	        var fcanvas = new fabric.Canvas(canvas, {
	          selection: false
	        });
	     fcanvas.setBackgroundImage(bg,fcanvas.renderAll.bind(fcanvas));
	        var rect = new fabric.Rect({
	        	left:parseInt(XCO1*scale),
		        top: parseInt(YCO2*scale)-(10*scale),
		        width: Math.ceil(XCO2-XCO1)*scale,
		        height: Math.ceil(YCO2-YCO1+5)*scale,
		        fill: 'Yellow',
		        opacity: 0.5,
		        transparentCorners: true,
		        borderColor: "black",
		       ornerColor: "black",
		        cornerSize: 5,
		        hasControls: false,
		        hasBorders: false,
		        renderOnAddRemove:false
	        });
	        fcanvas.add(rect);
	        fcanvas.renderAll();
	        if(XCO1>500)
	        	$('#viewer1 #main').scrollLeft(XCO1);	
	        if(YCO1>250)
	        	$('#viewer1 #main').scrollTop(YCO1);	
	        
	      });
	  });
		}catch(err){
			console.error(err.message);
			console.error(err);
			hideLoading();
		}
}//canvasCreation()
</script>
 <a id = "goto" href=""style="display: none" ></a>
<div id="main" class="main" style="height:420px  !important; overflow: scroll;    width: 100%;  border-style:solid;"></div>
