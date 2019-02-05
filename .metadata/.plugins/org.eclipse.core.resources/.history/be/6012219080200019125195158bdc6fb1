<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Expires" content="-1" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/commonCSS/custom-style.css?value=${applicationScope['version']}" />
<link rel="stylesheet" type="text/css" href="css/commonCSS/bulkupload-media-query.css" />
<link href="css/uploadCss/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
<link type="text/css" href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="css/uploadCss/theme.css" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="js/choosen/chosen.css" />
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/uic/jquery-2.1.1.min.js" ></script>
<script src="js/jquery/jquery-ui.custom.min.js"></script>
<script src="js/choosen/chosen.jquery.js"></script>
<script src='js/jquery-customselect.js'></script>
<script src="js/uploadJs/fileinput.js" type="text/javascript"></script>
<script src="js/uploadJs/theme.js" type="text/javascript"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/appjs/bulkUpload.js"></script>
<script src="js/jquery-confirm.min.js" ></script>
<style>
.modal-header .close {display:none !important;}
.btn-complete{color: #fff; background-color: #00adcf !important; border-color: #00adcf !important; border-radius: 5px;}
.btn-complete:hover{background-color: #073262 !important; border-color: #073262 !important; color:#fff; border-radius: 5px;}
</style>
</head>
<body>
	<div class="container-fluid mar-top80 rmDiv">
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading text-center">ACCOUNT INFORMATION</div>
				<div class="panel-body lt-panel">
					<div class="account"><p class="text-center">Before you upload your document please enter <span>Company Name</span> and <span>Company Id</span> to help us identify you.</p></div>		
				</div>
			</div>
		</div><!-- col-md-3 -->
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-body rt-panel">
					<div class="row">
						<div id="bulkUploadDiv" class="tblContainer" style="padding:0 10px 0 0">
							<div class="upload-panel" style="overflow-y:auto; overflow-x:hidden">
								<div class="col-md-6" style="display:none">
									<div class="col-md-4"><label class="custom-lbl">Group Name: <span class="txt-red">*</span></label></div>
									<div class="col-md-8"><input type="text" name="Groupname" class="form-control" id="Groupname" readonly="true" style="background-color: #EBEBE4;" class="required" value="${groupName}" /></div>
								</div>
							 
							 <div class="col-md-6" style="display:none">
								<div class="col-md-4"><label class="custom-lbl">Sub Portifolio: <span class="txt-red">*</span></label></div>
								<div class="col-md-8">
									<select id="Portfolio" name="Portfolio" class="select-new form-control" onchange="getIndustryList(this.value);">
										<option value="0">Select</option>
										<c:forEach var="portfolio" items="${portfolioList}">
											<option value="${portfolio.subPortFolioId}">${portfolio.subPortFolioName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="col-md-6 mar-top10">
								<div class="col-md-4"><label class="custom-lbl">Company Name: <span class="txt-red">*</span></label></div>
								<div class="col-md-8">
								<input type="text" name="c-name" id="c-name" class="required form-control" value="" onblur="setValuesOfCompanyName(this.value);"/>
						         <input type="hidden" name="entity_id" id="entity_id" value=""/>
								</div>
							</div>
							
							<div class="col-md-6 mar-top10">
								<div class="col-md-4"><label class="custom-lbl">Company Id: <span class="txt-red">*</span></label></div>
								<div class="col-md-8">
								<input type="text" name="company_id" id="company_id" maxlength="20" class="required form-control" placeholder="Maximum string length for Company Id is 20" onblur="setValuesOfCompanyId(this.value);" />
							</div>
							</div>
							
							<c:if test = "${userGrpAttrMappingMap['Country'] eq 'Country'}">
							<div class="col-md-6 mar-top10">
							<div class="col-md-4"><label class="custom-lbl">Country:</label></div>
							<div class="col-md-8">
							<input type="text" name="country-name" id="country-name" class="required clr form-control" onblur="" value=""/>
							<input type="hidden" name="country-id" id="country-id" value="" class="clr form-control"/>
							</div>
							</div>
							</c:if>
							
							<c:if test="${userGrpAttrMappingMap['FYE'] eq 'FYE'}">
							<div class="col-md-6 mar-top10">
							<div class="col-md-4"><label class="custom-lbl">FYE:<span class="txt-red">*</span></label></div>
							<div class="col-md-3 year-panel"><input type="text" name="fYEYear" id="fYEYear" class="required clr form-control" placeholder="Year"   value="" maxlength="4" onblur="resetMonthAndDays();"/></div>
							<div class="col-md-3 month-panel"><input type="text" name="fYEMonth-name" id="fYEMonth-name" class="required clr form-control" placeholder="Month" onblur="validateFyeMonth();" value=""  /></div>
							<div class="col-md-2 day-panel" id="FYEDaySelect"></div>
							</div>
							</c:if>
							
							<c:if test="${userGrpAttrMappingMap['Industry_Code'] eq 'Industry_Code'}">
							<div class="col-md-6 mar-top10">
								<div class="col-md-4"><label class="custom-lbl">Industry Code : <span class="txt-red">*</span></label></div>
								<div class="col-md-8"><input type="text" name="industryId" id="industryId" class="required clr form-control"  /></div>	
							</div>
							</c:if>
							
							<c:if test="${userGrpAttrMappingMap['Dealer_Name'] eq 'Dealer_Name'}">
							<div class="col-md-6 mar-top10">
								<div class="col-md-4"><label class="custom-lbl">Dealer Name: <span class="txt-red">*</span></label></div>
								<div class="col-md-8">
									<select id="dealerId" name="dealerId" class="required form-control">
									 <option value="">Select</option>
									 <c:forEach var="dealerObj" items="${dealerList}">
									<option value="${dealerObj.id}">${dealerObj.dealerName}</option>
									</c:forEach>
									</select>
								</div>
							</div>
							</c:if>
							
							<div class="col-md-6 lang mar-top10">
								<div class="col-md-4"><label class="custom-lbl">Language: <span class="txt-red">*</span></label></div>
								<div class="col-md-8">
									<select id="language" name="language" class="required form-control">
										<option value="">Select</option>
										 <c:forEach var="languageObj" items="${languageList}">
										  <option value="${languageObj.languageName}" ${languageObj.languageName == 'English' ? 'selected="selected"' : ''}>${languageObj.languageName}</option>
										 </c:forEach>
									</select>
								</div>		
							</div>
							
							<div class="col-md-6 mar-top10">
								<div class="col-md-4"><label class="custom-lbl">Norm Template: <span class="txt-red">*</span></label></div>
								<div class="col-md-8">
									<select id="templateName" name="templateName" class="required form-control">
										<option value="">Select</option>
										<c:forEach var="templateIdName" items="${templateIdNameList}">
										<option value="${templateIdName.value}">${templateIdName.value}</option>
										</c:forEach>
									</select>
								</div>		
							</div>
							
							
							<c:if test="${userGrpAttrMappingMap['SIC'] eq 'SIC'}">
							<div class="col-md-6 mar-top10">
								<div class="col-md-4"><label class="custom-lbl">SIC Description: </label></div>
								<div class="col-md-8">
									<input type="text" name="sic_description" id="sic_description" class="required clr form-control" onblur="" value=""/>
									<input type="hidden" name="sicId" id="sicId" value="" class="form-control" />
								</div>		
							</div>
							</c:if>
							
	<%-- 						<c:if test="${userGrpAttrMappingMap['Sector'] eq 'Sector'}">
								<div class="col-md-6 mar-top10">
									<div class="col-md-4"><label class="custom-lbl">Sector Name: <span class="txt-red">*</span></label></div>
									<div class="col-md-8">
										<select id="sectorId" name="sectorId" class="required form-control">
											<option value="0">Select</option>
											<c:forEach var="sector" items="${sectorList}">
											<option value="${sector.sectorId}">${sector.sectorName}</option>
											</c:forEach>
									    </select>
									</div>
								</div>
							</c:if> --%>
							<c:if test="${userGrpAttrMappingMap['NAICS'] eq 'NAICS'}">
							<div class="col-md-6 mar-top10">
							 <div class="col-md-4"><label class="custom-lbl">NAICS Description: </label></div>
							  <div class="col-md-8">
							   <input type="text" name="naics_description" id="naics_description" class="required clr form-control" onblur="" value=""/>
								<input type="hidden" name="naicsId" id="naicsId" value="" class="form-control" />
							  </div>		
							</div>
							</c:if>
						<c:if test="${userGrpAttrMappingMap['Industry Type'] eq 'Industry Type'}">	
						 <div class="col-md-6 mar-top10">
								<div class="col-md-4"><label class="custom-lbl">Industry Type: </label></div>
							<div class="col-md-8">
							  <select id="industry_type" name="industry_type" class="required form-control">
								<option value="0">Select</option>
								<c:forEach var="industryType" items="${industryTypeList}">
								<option value="${industryType.industryTypeId}">${industryType.industryName}</option>
  							    </c:forEach>
							  </select>
							</div>		
							</div>
							</c:if>
							
							<c:if test="${isGoldenCaseUser eq 'Y'}">
								<div class="col-md-6 mar-top10">
									<div class="col-md-4"><label class="custom-lbl">Golden Case Feature: </label></div>
									<div class="col-md-8">
										<select id="goldenCaseId" name="goldenCaseId" class="required form-control">
											<option value="0">Select</option>
											<c:forEach var="goldenSetMetadata" items="${goldenSetMetadatasList}">
											<option value="${goldenSetMetadata.caseId}">${goldenSetMetadata.caseName}</option>
											</c:forEach>
									    </select>
									</div>
								</div>
							</c:if>
							
							
							
							<div class="col-md-12">
							<div class="mar-lt14"><label class="custom-lbl">Upload files:<span class="txt-red">*</span></label></div>
							<div class="pad-bot5 mar-lt14 alert-lbl">Acceptable Document Formats:pdf,doc,docx,xls,ppt,txt,jpg,jpeg,gif,bmp,tif,xlsx,msg<br/>File Name contains 'A-Z','a-z','0-9','-','_',space characters and file extension '.' only</div>
								<div class="container kv-main">
								    <form id="upload_file"  action="upload_file" method="POST" enctype="multipart/form-data">
								       <input type="hidden" name="customerId"  id="customerId"  value="${customerId}" />
								        <div class="file-loading">
								            <input id="fileupload" name="fileupload" type="file" multiple>
								        </div>
								        <div class="text-center" style="margin-top:20px">
								       		</div>
								 </form>
								 </div><!-- main-div -->
								<div class="text-center btn-panel">
								<button type="button" class="btn btn-complete" onclick="submitFiles();" style="font-size:12px; padding:6px 8px !important"><i class="fa fa-thumbs-up" style="margin-right:3px"></i>Complete</button>
								</div>
								</div>
							
							</div>
							
							
						 </div><!-- bulk-upload -->
					</div><!-- row -->
				</div><!-- panel-body -->
		</div><!-- panel-default -->
	</div><!-- col-md-9 -->
</div><!-- row -->
</div><!-- container-fluid -->

<div id="loadinglayer"></div>


  <div id="confirmPopUp" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog mar-top78">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">File Uploaded SuccessFully</h4>
      </div>
      <div class="modal-body">
        <table id="confirmTbl" class="table table-striped table-bordered datatable-new" cellspacing="0" width="100%">
              <thead>
                <tr>
         		<th style="text-align:left !important">Company Name</th>
     	        <th style="text-align:left !important">Company Id</th>
 	            <th style="text-align:left !important">Document Type</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="callBulkupload()">Close</button>
      </div>
    </div>

  </div>
</div>
<script>
var uploadDeleteUrl='upload_delete.htm';
var uploadFileUrl='upload_file.htm'
var isPasswordCorrect="isPasswordCorrect.htm";
var uploadConfirm="bulk_upload_confirm.htm";
var fileUplodObj = $("#fileupload");
var characterReg =  /(^[\w\s-_]+\.)(pdf|doc|docx|xls|ppt|txt|jpg|jpeg|gif|bmp|tif|xlsx|msg)$/i ;
   
/* * ready  ** */
var naicsResultdata=[];
var sicsResultdata=[];
var businessNameListData=[];


$(document).ready(function () {
		//validation
		$('#c-name').keyup(function () { 
		    this.value = this.value.replace(/[^a-zA-Z0-9\.\s_-]/g,'');
		});
    	
		$('#fileupload').click(function(){
			var itemLength = $('#uploadedTbl tbody tr.kv-preview-thumb').length;
			if(itemLength>=10)
				{
					$.alert("Max upload capacity per case is 10 documents.");
					return false;
				}
		});
		
		//naics
		   $("#naics_description").autocomplete({
	        	source: getNaicsDescription,
	            minLength: 2,
	            select:function(event,ui){
	            	var selectedDescription = $.trim(ui.item.label);
	            	$.each(naicsResultdata, function(k, v) {
	            		if(selectedDescription===v){
	            			$('#naicsId').val(k);
	            			$('#naics_description').val(selectedDescription);
	            			return false;
	            		}
	            	});
	             },
	            change: function( event, ui ) {
	            	 var val = $(this).val();
	            	  exists = $.inArray(val,naicsResultdata);
	            	  if (exists<0) {
	            	    $(this).val("");
	            	    return false;
	            	  }
	            }
           });
		//sic 
		   $("#sic_description").autocomplete({
	        	source: getSicDescription,
	            minLength: 2,
	            select:function(event,ui){
	            	var selectedDescription = $.trim(ui.item.label);
	            	var resultVal=selectedDescription.split(":");
	            	$('#sicId').val(resultVal[0]);
	            	$('#sic_description').val(selectedDescription); 
	            	},
		            change: function( event, ui ) {
		            	 var val = $(this).val();
		            	  exists = $.inArray(val,sicsResultdata);
		            	  if (exists<0) {
		            	    $(this).val("");
		            	    return false;
		            	  }
		            }

	            });
		
		var countryNameList = [${countryNameList}];
		var jsonCountryArray =  [${jsonCountry}];
    	
		$("#country-name").autocomplete({
			 source:countryNameList,
	         minLength: 1,
	         select:function(event,ui){
	        	var userChoice = $.trim(ui.item.label);                
	             
	         	var isNewOption = (countryNameList.indexOf(userChoice) === -1);
	         	if ((typeof userChoice === 'undefined') || (userChoice.length === 0)) {
	         		$("#country-id").val("");
	         	}else if(isNewOption) {
	         		$("#country-id").val("");
	           }else {
	        	   $.each(jsonCountryArray, function(index, val) {
	        		   if(userChoice==val.countryName){
	               			$("#country-id").val(val.countryId);
	               		}
	        	   });
	           }
	         },
	         change : function(event,ui){
	        	 var userChoice = $.trim(ui.item.label);                
	             
	          	var isNewOption = (countryNameList.indexOf(userChoice) === -1);
	          	if ((typeof userChoice === 'undefined') || (userChoice.length === 0)) {
	          		$("#country-id").val("");
	          	}else if(isNewOption) {
	          		$("#country-id").val("");
	            }else {
	         	   $.each(jsonCountryArray, function(index, val) {
	         		   if(userChoice==val.countryName){
	                			$("#country-id").val(val.countryId);
	                		}
	         	   });
	            }
	         }
		});
    
       var montthList = [${monthList}];
		var sel="";
		$("#fYEMonth-name").autocomplete({
			 source:montthList,
	         minLength: 1,
	         select:function(event,ui){
	         	var userChoice = $.trim(ui.item.label).toLowerCase().replace(/\b[a-z]/g, function(letter) {
	         	    return letter.toUpperCase();
	         	});              
	         	setMonthDate(userChoice);
	          }
		});
		
		function companyIdsList(request, response){
			 var resultsArray=[];
		 		console.info("in companyIdsList function ");
		 		var resultsArray =[];
				$.ajaxSetup({
					cache: true
				});
		 		$.ajax({
		 			type: 'GET',
		 			url: 'getcompanyIdsList.htm',
		 			dataType: "json",
		 			async:false,
		 			cache: true,
		 			data: {companyId : $("#company_id").val()},
		 			success: function(data){
		 			if (data != null){  
		 			var resultJSON=JSON.stringify(data);
		 			resultdata = $.parseJSON(resultJSON);
		 			$.each(resultdata, function(k, v) {
		 			   resultsArray.push(v);
		 			   
		 			});
		 			}
		 			response(resultsArray);
		 			}
		 		});
		 	  }
		 	  function businessNameList(request, response){
		 		 var resultsArray=[];
		 		console.info("in businessNameList function ");
		 		$("#entity_id").val("");
		 		var resultsArray =[];
				$.ajaxSetup({
					cache: true
				});
		 		$.ajax({
		 			type: 'GET',
		 			url: 'getBusinessNameList.htm',
		 			dataType: "json",
		 			async:false,
		 			cache: true,
		 			data: {cName : $("#c-name").val()},
		 			success: function(data){
		 			if (data != null){  
		 			var resultJSON=JSON.stringify(data);
		 			businessNameListData = $.parseJSON(resultJSON);
		 			$.each(businessNameListData, function(k, v) {
		 			  resultsArray.push(v);
		 			});
		 			}
		 			response(resultsArray);
		 			}
		 		});
		 	  }
				
		 	  
		      //company_Id autocompletion  
		    	   $( "#company_id" ).autocomplete({
		    		      source: companyIdsList,
		    		      minLength: 1,
		    		      select:function(event,ui){
		    		    	cpId = $.trim(ui.item.label);   
		    		    	$('#company_id').val(cpId);
		    		    	setValuesOfCompanyId(cpId);
		    		    	
			              }
		    		    });
		      // company Name autocompletion 
		        $("#c-name").autocomplete({
		            source:businessNameList,
		            minLength: 1,
		             select:function(event,ui){
		               var companyName = $.trim(ui.item.label);              	
		               $('#c-name').val(companyName); 
		            	$.each(businessNameListData, function(k, v) {
		            	if(companyName===v){
		            		$('#entity_id').val(k);
		            		setValuesOfCompanyName(v);
		            	  }
		            	});
	               	},
		        });
			
		        $("#sic_description").autocomplete({
		        	source: getSicDescription,
		            minLength: 2, 	
		            select:function(event,ui){
		            	var selectedDescription = $.trim(ui.item.label);
		            	for(i=0;i<sicsResultdata.length;i++){
		            	 if(selectedDescription===sicsResultdata[i].value){
		            	  $('#sicId').val(sicsResultdata[i].key);
		            	  $('#sic_description').val(selectedDescription);
		            	  return false; 
		            	 }
		            	}
		             },
		            change: function( event, ui ) {
		            	 var val = $(this).val();
		            	  var exists =0;
			               for(i=0;i<sicsResultdata.length;i++)
			               {
			            	 if(sicsResultdata[i].value===val)
			            	 {
			            		 exists=1;		        	
		        			 }
			               }

		            	  if (exists<=0) {
		            	    $(this).val("");
		            	    $('#sicId').val("0");
		            	    return false;
		            	  }
		            }
	            });

		        $("#naics_description").autocomplete({
		        	source: getNaicsDescription,
		            minLength: 2, 	
		            select:function(event,ui){
		            	var selectedDescription = $.trim(ui.item.label);
		            	for(i=0;i<naicsResultdata.length;i++){
		            	 if(selectedDescription===naicsResultdata[i].value){
		            	  $('#naicsId').val(naicsResultdata[i].key);
		            	  $('#naics_description').val(selectedDescription);
		            	  return false; 
		            	 }
		            	}
		             },
		            change: function( event, ui ) {
		            	 var val = $(this).val();
		            	  var exists =0;
			               for(i=0;i<naicsResultdata.length;i++)
			               {
			            	 if(naicsResultdata[i].value===val)
			            	 {
			            		 exists=1;		        	
		        			 }
			               }

		            	  if (exists<=0) {
		            	    $(this).val("");
		            	    $('#naicsId').val("0");
		            	    return false;
		            	  }
		            }
	            });

		        


		});	
		
		function getSicDescription(request, response)
		{
			sicsResultdata=[];
			console.info("in getSicDescription function ");
			var resultsArray =[];
			$.ajaxSetup({
				cache: true
			});
			$.ajax({
				type: 'GET',
				url: 'getSicDescription.htm',
				dataType: "json",
				async:false,
				cache: true,
				data: {sic_description : $("#sic_description").val()},
				success: function(data){
				if (data != null){  
				var resultJSON=JSON.stringify(data);
				resultdata = $.parseJSON(resultJSON);
				$.each(resultdata, function(k, v) {
				  sicsResultdata.push({key:k,value:v});
				  resultsArray.push(v);
				   
				});
				}
				response(resultsArray);
				}
			});
		}
		
		function getNaicsDescription(request, response)
		{
			naicsResultdata=[];
			 var resultdata=[];
			console.info("in getNaicsDescription function ");
			var resultsArray =[];
			$.ajaxSetup({
				cache: true
			});
			$.ajax({
				type: 'GET',
				url: 'getNaicsDescription.htm',
				dataType: "json",
				async:false,
				cache: true,
				data: {naics_description : $("#naics_description").val()},
				success: function(data){
				if (data != null){  
				var resultJSON=JSON.stringify(data);
				resultdata = $.parseJSON(resultJSON);
				$.each(resultdata, function(k, v) {
				resultsArray.push(v);
				naicsResultdata.push({key:k,value:v});
				});
				}
				response(resultdata);
				}
			});
		}
    
    /* end ready code*/
     
     function parserDropDown(fileName){
        		var selectParsers = '<select id="parser" name="parser" class="selectedVal form-control" style="height:26px !important; width:auto;">'; 
        		<c:forEach items="${parserMasterList}" var="parserName" varStatus="status">
        		selectParsers = selectParsers+"<option value=\"${parserName.parserValue}~"+fileName+"\">${parserName.parserName}</option>";
        		</c:forEach>
        		selectParsers = selectParsers+'</select>';
        		return selectParsers;
        		}  
     
     
    function resetMonthAndDays(){
   		var yearVal=$("#fYEYear").val();
   		var montthList = [${monthList}];
   		var sel="";
   		var userChoice = $.trim($("#fYEMonth-name").val());              
      	var isNewOption = (montthList.indexOf(userChoice) === -1);
      	 if(!$.isNumeric(yearVal) && yearVal.length>0){
      		$.alert("Please enter Valid Year");
      		$("#fYEYear").val("");
      		$("#fYEMonth-name").val("");
      		$("#FYEDaySelect").html("");
      	 }else{
      		if ((typeof userChoice === 'undefined') || (userChoice.length === 0)) {
          		$("#FYEDaySelect").html("");
          	}else if(isNewOption) {
          		$("#FYEDaySelect").html("");
          		$.alert("Please enter Valid Month");
            }else {
            	 sel = '<select id="fYEDay" name="fYEDay" class="required form-control" style="width:47px; padding:4px">';  
         		   if(userChoice== "April" || userChoice== "June" || userChoice== "September" || userChoice== "November"){
         			  for(var i=1; i <=30;i++){
         				 sel = sel+"<option value='"+i+"'>"+i+"</option>";
         			  }
                	}else if(userChoice== "February" ){
                		var yearVal=parseInt($("#fYEYear").val());
                		var days=28;
                		if(yearVal%4==0){
                			days=29;
                		}
                		for(var i=1; i <=days;i++){
            				 sel = sel+"<option value='"+i+"' >"+i+"</option>";
            			  }
                	}else{
                		for(var i=1; i <=31;i++){
                		 sel = sel+"<option value='"+i+"' >"+i+"</option>";
           			  }
                	}
         		  sel = sel+'</select>';
         		$("#FYEDaySelect").html(sel);
            }
      	 }
    }
         
         
         
     
      function setMonthDate(userChoice){
        		var montthList = [${monthList}];
        		var isNewOption = (montthList.indexOf(userChoice) === -1);
              	if ((typeof userChoice === 'undefined') || (userChoice.length === 0)) {
              		$("#FYEDaySelect").html("");
              	}else if(isNewOption) {
              		$("#FYEDaySelect").html("");
              		$("#fYEMonth-name").val("");
              		$.alert("Please enter Valid Month");
                }else {
                	$("#fYEMonth-name").val(userChoice.toLowerCase().replace(/\b[a-z]/g, function(letter) {
                 	    return letter.toUpperCase();
                 	}));
                	              
                	 sel = '<select id="fYEDay" name="fYEDay" class="required form-control" style="width:47px; padding:4px">';  
             		   if(userChoice== "April" || userChoice== "June" || userChoice== "September" || userChoice== "November"){
             			  for(var i=1; i <=30;i++){
             				 sel = sel+"<option value='"+i+"' style='font-style:italic; background:#006995; color:#fff;'>"+i+"</option>";
             			  }
                    	}else if(userChoice== "February" ){
                    		var yearVal=parseInt($("#fYEYear").val());
                    		var days=28;
                    		if(yearVal%4==0){
                    			days=29;
                    		}
                    		for(var i=1; i <=days;i++){
                				 sel = sel+"<option value='"+i+"' style='font-style:italic; background:#006995; color:#fff;'>"+i+"</option>";
                			  }
                    	}else{
                    		for(var i=1; i <=31;i++){
                    		 sel = sel+"<option value='"+i+"' style='font-style:italic; background:#006995; color:#fff;'>"+i+"</option>";
               			  }
                    	}
             		  sel = sel+'</select>';
             		$("#FYEDaySelect").html(sel);
                }
              	
        	}
        	

</script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>			
</html>

