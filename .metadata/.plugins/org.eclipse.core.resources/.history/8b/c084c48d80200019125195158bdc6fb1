
// following variable are required for click back
var xCoordinate= 0;
var yCoordinate=0;
var documentId=0;
var documentType="";
var pNo=0;
var pdfFlag=0;
var oldXCoordinate=0;
var oldYCoordinate=0;
var fcanvas=null; 
var rectMain=null;
var tempId=null;
var filingId=0;
var uploadId;
var poID=0;
var cColumn=0;
var renderPDF=false;
var currentPageNumber;
var currentDocId;
var globaleCaseId;
var renderPageNo=1;
var XC1=0;
var XC2=0;
var YC1=0;
var YC2=0;

var globalPDFObject=null;


$(document).ready(function() {
	  $('#htmlShow').on('shown.bs.modal', function () {
		$('#myclick')[0].click();
	})
});

function openPDFDoc(caseId, docUploadID,poId,coordinateColumn){
	 // assignment for showPDF
	 filingId=caseId;
	 poID=poId;
	 cColumn=coordinateColumn;
	 if (!docUploadID || docUploadID == 0){
		 // upload id null means we have to pass blank
		 uploadId=" ";
	 }else{
		 uploadId=docUploadID;
	 }
	 // get the coordinates and page number
	 var tokenizedURL= insertParam("getCoodinates.htm");
	 var parametersTokenVal="poId="+poID+"&coordinateColumn="+coordinateColumn+"&filingId="+filingId;
	 	var pageNo=0;
		var xCoordinate=0;
		var yCoordinate=0;
		var x2=0;
		var y1=0;
	
		$.ajax({
			type : "POST",
			url : tokenizedURL,
			data:parametersTokenVal,
			async:false,
			cache: true,
			success : function(data) {
				var res= data.toString().split('||');
				var docType=res[1];
				if(docType.toLowerCase() == 'pdf')
					{
						var coordinates=res[0].split(',');
						pageNo=coordinates[4];
						xCoordinate=coordinates[0];
						yCoordinate=coordinates[3];
						x2=coordinates[2];
						y1=coordinates[1];		
						if(pageNo === undefined || coordinates == '0,0,0,0,1'){
							alert("Mapping not exist");
						}else{
							callPDF(filingId, pageNo,docType,xCoordinate,yCoordinate,pageNo,caseId,caseId,uploadId,x2,y1);
						}
					}
				else if(docType.toLowerCase() =='html')
					{
					 var coordinates=res[0];
					 if(coordinates!=null || coordinates!=undefined)
						 {
						 	var url = "showHTMLpopup.htm?filingId="+caseId+"&uploadId="+uploadId+"&coordinates="+coordinates;
						 	PopupCenter(url,"LiveSpread",1100,750);						 
						 }
					 else
						 {
						 	alert("Clickback does not exists");
						 }
					}
				else if(docType.toLowerCase() =='' || docType == null)
				{
					alert("Clickback does not exists");
				}
				else
					{
						var coordinates=res[0].split(',');
						pageNo=coordinates[4];
						var element = document.getElementById('otherDocument');
						element.setAttribute("href", "openPdfFile.htm?filingId="+caseId+"&uploadId="+uploadId+"&pageNo="+pageNo);
						element.click();
					}
			}//success
		});
}//openPDFDoc() 



function showClickBack(caseId,poId,coordinateString,docUploadID){
	 filingId=caseId;
	 poID=poId;
	 	var pageNo=0;
		var xCoordinate=0;
		var yCoordinate=0;
		var x2=0;
		var y1=0;
		var res= coordinateString.split('|');
		var docType=res[0];
		var coordinates=res[1].split(',');
		if (!docUploadID || docUploadID == 0){
			uploadId=" ";
		 }else{
			 uploadId=docUploadID;
		 }
		
		if(docType.toLowerCase() == 'pdf')
		{
			pageNo=coordinates[4];
			xCoordinate=coordinates[0];
			yCoordinate=coordinates[3];
			x2=coordinates[2];
			y1=coordinates[1];
			if(pageNo === undefined || coordinates == '0,0,0,0,1'){
				alert("Mapping not exist");
			}else{
				callPDF(filingId, pageNo,docType,xCoordinate,yCoordinate,pageNo,caseId,caseId,uploadId,x2,y1);
			}
		}
		else if(docType.toLowerCase() =='html')
		{
			var tokenizedURL= insertParam("showHTMLpopup.htm");
			var coordinates=res[1];
			$.ajax({
				 url : tokenizedURL,
				 data: {filingId:caseId,uploadId:uploadId},
				 method : 'GET',
				 async : false,
				 cache: true,
				 complete : function(data) {
					 $("#htmlViewer").html(data.responseText);
					 $("#htmlShow").modal('show');
					 $("#myclick").attr("href", "#"+coordinates);
					 $('[name="'+coordinates+'"]').addClass("selected");
				}
			 });
		}
		else
		{
			var coordinates=res[1].split(',');
			pageNo=coordinates[4];
			var element = document.getElementById('otherDocument');
			element.setAttribute("href", "openPdfFile.htm?filingId="+caseId+"&uploadId="+uploadId+"&pageNo="+pageNo);
			element.click();
		}
}



function showQAChecksClickBack(caseId,coordinateString,docUploadID){
	 filingId=caseId;
	 	var pageNo=0;
		var xCoordinate=0;
		var yCoordinate=0;
		var x2=0;
		var y1=0;
		var docType='PDF';
		var coordinates=coordinateString.split(',');
		if (!docUploadID || docUploadID == 0){
			uploadId=" ";
		 }else{
			 uploadId=docUploadID;
		 }
		
		if(docType.toLowerCase() == 'pdf')
		{
			pageNo=coordinates[4];
			xCoordinate=coordinates[0];
			yCoordinate=coordinates[3];
			x2=coordinates[2];
			y1=coordinates[1];
			if(pageNo === undefined || coordinates == '0,0,0,0,1'){
				alert("Mapping not exist");
			}else{
				callPDF(filingId, pageNo,docType,xCoordinate,yCoordinate,pageNo,caseId,caseId,uploadId,x2,y1);
			}
		}
		else if(docType.toLowerCase() =='html')
		{
			var tokenizedURL= insertParam("showHTMLpopup.htm");
			var coordinates=res[1];
			$.ajax({
				 url : tokenizedURL,
				 data: {filingId:caseId,uploadId:uploadId},
				 method : 'GET',
				 async : false,
				 cache: true,
				 complete : function(data) {
					 $("#htmlViewer").html(data.responseText);
					 $("#htmlShow").modal('show');
					 $("#myclick").attr("href", "#"+coordinates);
					 $('[name="'+coordinates+'"]').addClass("selected");
				}
			 });
		}
		else
		{
			var coordinates=res[1].split(',');
			pageNo=coordinates[4];
			var element = document.getElementById('otherDocument');
			element.setAttribute("href", "openPdfFile.htm?filingId="+caseId+"&uploadId="+uploadId+"&pageNo="+pageNo);
			element.click();
		}
}



function callPdfForClickBackFromQARolledup(caseId,coordinateString,docUploadID){
	 filingId=caseId;
	 	var pageNo=0;
		var xCoordinate=0;
		var yCoordinate=0;
		var x2=0;
		var y1=0;
		var docType='PDF';
		var coordinates=coordinateString.split(',');
		if (!docUploadID || docUploadID == 0){
			uploadId=" ";
		 }else{
			 uploadId=docUploadID;
		 }
		
		if(docType.toLowerCase() == 'pdf')
		{
			pageNo=coordinates[4];
			xCoordinate=coordinates[0];
			yCoordinate=coordinates[3];
			x2=coordinates[2];
			y1=coordinates[1];
			if(pageNo === undefined || coordinates == '0,0,0,0,1'){
				alert("Mapping not exist");
			}else{
				callPDF(filingId, pageNo,docType,xCoordinate,yCoordinate,pageNo,caseId,caseId,uploadId,x2,y1);
			}
		}
		else if(docType.toLowerCase() =='html')
		{
			var tokenizedURL= insertParam("showHTMLpopup.htm");
			var coordinates=res[1];
			$.ajax({
				 url : tokenizedURL,
				 data: {filingId:caseId,uploadId:uploadId},
				 method : 'GET',
				 async : false,
				 cache: true,
				 complete : function(data) {
					 $("#htmlViewer").html(data.responseText);
					 $("#htmlShow").modal('show');
					 $("#myclick").attr("href", "#"+coordinates);
					 $('[name="'+coordinates+'"]').addClass("selected");
				}
			 });
		}
		else
		{
			var coordinates=res[1].split(',');
			pageNo=coordinates[4];
			var element = document.getElementById('otherDocument');
			element.setAttribute("href", "openPdfFile.htm?filingId="+caseId+"&uploadId="+uploadId+"&pageNo="+pageNo);
			element.click();
		}
}



function pdfViewer(dType,xC,yC,pageNo,dId,caseId,uploadId,x2C,y1C){
	renderPageNo=pageNo;
	 documentType=dType;
	 documentId=dId;
	 XC1=xC;
	 XC2=x2C;
	 YC1=y1C;
	 YC2=yC;
	if(documentType.toLowerCase() == "pdf"){
	 pNo=pageNo;
	 var id=documentId+"_"+pNo.toString();
	 $("#viewer1").empty();
		$("#main").empty();
			pdfFlag=0;
			var tokenizedURL= insertParam("getpdf.htm");
			var parametersTokenVal="filingId="+caseId+"&uploadId="+uploadId;
			$.ajax({
				 url : tokenizedURL,
				 method : 'GET',
				 data:parametersTokenVal,
				 async : false,
				 cache: true,
				 complete : function(data) {
					 $("#viewer1").html(data.responseText);
					 $("#pdfshow").modal('show');
				}
			 });
	}
	//flag for page number change
	tempId=id;	
	
	
}//pdfViewer


//close the pop window on escape button 
$(document).keyup(function(e) {
    if (e.keyCode == 27) { // escape key maps to keycode `27`
    	 $("#PDFPopUp").click();
   }
});

$(document).keyup(function(e) {
    if (e.keyCode == 27) { // escape key maps to keycode `27`
    	 $("#htmlPopUp").click();
   }
});


// loading the PDF before click back
function callPDF(globaleCaseId, pageNo,docType,xCoordinate,yCoordinate,pageNo,caseId,caseId,uploadId,x2,y1){
	if(docType.toLowerCase() =='pdf')
		{
		if (currentPageNumber != pageNo || currentDocId != uploadId){
			var url = contextPath+"/openPdfFile.htm?filingId="+encodeURIComponent(globaleCaseId)+"&uploadId="+encodeURIComponent(uploadId)+"&pageNo="+encodeURIComponent(pageNo);
			PDFJS.disableWorker = false;
			globalPDFObject= PDFJS.getDocument(url);
			filingId=globaleCaseId;
			documentId=globaleCaseId;
			$("#viewer1").empty();
			$("#main").empty();
			currentPageNumber = pageNo;
			currentDocId = uploadId;
			renderPDF=true;
			pdfViewer(docType,xCoordinate,yCoordinate,1,caseId,caseId,uploadId,x2,y1);
			var delayMillis = 1000;
			setTimeout(function() {
				if(xCoordinate>500)
					{
						var position = parseFloat(x2)+(parseFloat(x2)-parseFloat(xCoordinate))+parseFloat(200);
						$('#viewer1 #main').scrollLeft(position);					
					}
				if(yCoordinate>250)
					{
						$('#viewer1 #main').scrollTop(yCoordinate);
					}
				
			}, delayMillis);
		}else{
			pdfViewer(docType,xCoordinate,yCoordinate,1,caseId,caseId,uploadId,x2,y1);
			var delayMillis = 500;
			setTimeout(function() {
				if(xCoordinate>500)
					{
						var position = parseFloat(x2)+(parseFloat(x2)-parseFloat(xCoordinate))+parseFloat(200);
						$('#viewer1 #main').scrollLeft(position);					
					}
				if(yCoordinate>250)
					{
						$('#viewer1 #main').scrollTop(yCoordinate);
					}
				
			}, delayMillis);
			hideLoading();
		}
	}
}
	function resetVariabels()
	{
		currentPageNumber=-1;
		currentDocId=-1;
	}
	
	
	function callPdfForClickBackFromQARolledup(caseId,coordinateString,docUploadID){
		 filingId=caseId;
		 	var pageNo=0;
			var xCoordinate=0;
			var yCoordinate=0;
			var x2=0;
			var y1=0;
			var docType='PDF';
			var coordinates=coordinateString.split(',');
			if (!docUploadID || docUploadID == 0){
				uploadId=" ";
			 }else{
				 uploadId=docUploadID;
			 }
			
			if(docType.toLowerCase() == 'pdf')
			{
				pageNo=coordinates[4];
				xCoordinate=coordinates[0];
				yCoordinate=coordinates[3];
				x2=coordinates[2];
				y1=coordinates[1];
				if(pageNo === undefined || coordinates == '0,0,0,0,1'){
					alert("Mapping not exist");
				}else{
					callClickBackChildPopup(filingId, pageNo,docType,xCoordinate,yCoordinate,pageNo,caseId,caseId,uploadId,x2,y1);
				}
			}
			else if(docType.toLowerCase() =='html')
			{
				var tokenizedURL= insertParam("showHTMLpopup.htm");
				var coordinates=res[1];
				$.ajax({
					 url : tokenizedURL,
					 data: {filingId:caseId,uploadId:uploadId},
					 method : 'GET',
					 async : false,
					 cache: true,
					 complete : function(data) {
						 $("#htmlViewer").html(data.responseText);
						 $("#htmlShow").modal('show');
						 $("#myclick").attr("href", "#"+coordinates);
						 $('[name="'+coordinates+'"]').addClass("selected");
					}
				 });
			}
			else
			{
				var coordinates=res[1].split(',');
				pageNo=coordinates[4];
				var element = document.getElementById('otherDocument');
				element.setAttribute("href", "openPdfFile.htm?filingId="+caseId+"&uploadId="+uploadId+"&pageNo="+pageNo);
				element.click();
			}
	}
	
	
	function callClickBackChildPopup(globaleCaseId, pageNo,docType,xCoordinate,yCoordinate,pageNo,caseId,caseId,uploadId,x2,y1){
		if(docType.toLowerCase() =='pdf')
			{
			if (currentPageNumber != pageNo || currentDocId != uploadId){
				var url = contextPath+"/openPdfFile.htm?filingId="+encodeURIComponent(globaleCaseId)+"&uploadId="+encodeURIComponent(uploadId)+"&pageNo="+encodeURIComponent(pageNo);
				PDFJS.disableWorker = false;
				globalPDFObject= PDFJS.getDocument(url);
				filingId=globaleCaseId;
				documentId=globaleCaseId;
				$("#viewer1").empty();
				$("#main").empty();
				currentPageNumber = pageNo;
				currentDocId = uploadId;
				renderPDF=true;
				pdfViewerClickBackChildPopup(docType,xCoordinate,yCoordinate,1,caseId,caseId,uploadId,x2,y1);
				var delayMillis = 1000;
				setTimeout(function() {
					if(xCoordinate>500)
						{
							var position = parseFloat(x2)+(parseFloat(x2)-parseFloat(xCoordinate))+parseFloat(200);
							$('#viewer1 #main').scrollLeft(position);					
						}
					if(yCoordinate>250)
						{
							$('#viewer1 #main').scrollTop(yCoordinate);
						}
					
				}, delayMillis);
			}else{
				pdfViewerClickBackChildPopup(docType,xCoordinate,yCoordinate,1,caseId,caseId,uploadId,x2,y1);
				var delayMillis = 500;
				setTimeout(function() {
					if(xCoordinate>500)
						{
							var position = parseFloat(x2)+(parseFloat(x2)-parseFloat(xCoordinate))+parseFloat(200);
							$('#viewer1 #main').scrollLeft(position);					
						}
					if(yCoordinate>250)
						{
							$('#viewer1 #main').scrollTop(yCoordinate);
						}
					
				}, delayMillis);
				hideLoading();
			}
		}
}
	
function pdfViewerClickBackChildPopup(dType,xC,yC,pageNo,dId,caseId,uploadId,x2C,y1C){
		renderPageNo=pageNo;
		 documentType=dType;
		 documentId=dId;
		 XC1=xC;
		 XC2=x2C;
		 YC1=y1C;
		 YC2=yC;
		if(documentType.toLowerCase() == "pdf"){
		 pNo=pageNo;
		 var id=documentId+"_"+pNo.toString();
				pdfFlag=0;
				var tokenizedURL= "getpdf.htm";
				var parametersTokenVal="filingId="+caseId+"&uploadId="+uploadId;
				$.ajax({
					 url : tokenizedURL,
					 method : 'GET',
					 data:parametersTokenVal,
					 async : false,
					 cache: true,
					 complete : function(data) {
						 hideLoading();
						 $("#viewer1").html(data.responseText);
					}
				 });
		}
		tempId=id;	
	}//pdfViewer


