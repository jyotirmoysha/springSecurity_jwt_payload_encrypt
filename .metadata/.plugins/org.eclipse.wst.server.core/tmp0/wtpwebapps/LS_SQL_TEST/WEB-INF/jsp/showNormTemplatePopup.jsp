<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 <script>
 function hasWhiteSpace(s) {
	  return s.indexOf(' ') >= 0;
 }
 
<c:forEach var="sectionMap" items="${sectionShortNameFullNameMap}" varStatus="status">
 var sectionName='';
	if(hasWhiteSpace('${sectionMap.key}')){
	//it returns true means string conctain space
	var res='${sectionMap.key}'.split(" ");
	 sectionName = res[1];
	}else{
	 sectionName='${sectionMap.key}';
	}
	console.info("checked box section name="+sectionName);
$('.'+sectionName+'checkbox').click(function(event) {  //on click
    if(this.checked) { // check select status
   	//Form 1checkbox
   	//DOScheckbox
     var checkBoxClassName=$(this).attr("class")
     if(hasWhiteSpace(checkBoxClassName)){
     var res=checkBoxClassName.split(" ");
     checkBoxClassName = res[1]; 
     }
      $('.'+checkBoxClassName+'4').each(function() { //loop through each checkbox
          this.checked = true;  //select all checkboxes with class "checkbox1"              
      });
  }else{
	  var checkBoxClassName=$(this).attr("class")
	     if(hasWhiteSpace(checkBoxClassName)){
	     var res=checkBoxClassName.split(" ");
	     checkBoxClassName = res[1]; 
	     }
	      $('.'+checkBoxClassName+'4').each(function() { //loop through each checkbox
	     this.checked = false;  //select all checkboxes with class "checkbox1"              
	  });    
  }
});
</c:forEach>


    $(document).ready(function() {
    	
    	$('.dropdown-toggle').dropdown();
    	$('.dropdown-menu > li').click(function() {
    	    var $toggle = $(this).parent().siblings('.dropdown-toggle');
    	    $toggle.html("<i class=\"icon icon-envelope icon-white\"></i> " + $(this).text() + "<span class=\"caret\"></span>")
    	});
    	
     	 <c:forEach items="${sectionShortNameFullNameMap}" var="sectionMap" varStatus="loop">
    	 <c:if test="${loop.count ne 1}">
        	 var sectionName='';
    		if(hasWhiteSpace('${sectionMap.key}')){
    		//it returns true means string conctain space
    		var res='${sectionMap.key}'.split(" ");
    		 sectionName = res[1];
    		}else{
    		 sectionName='${sectionMap.key}';
    		}
    		console.info("section name:"+sectionName);
    	   $('.'+sectionName+'Table').hide();
    	 </c:if>
         </c:forEach> 
    	
         var titleName='${levelName}';
         var arr = titleName.split('Level');
    	$(".panel-title").html(arr[0]+" Level");

    });
    
    
 function clickOnSection(selectedsectionNameParam){
	 console.info("in clickOnSection function2="+selectedsectionNameParam);
	 	var selectedsectionName='';
		if(hasWhiteSpace(selectedsectionNameParam)){
		//it returns true means string conctain space
		var res=selectedsectionNameParam.split(" ");
		selectedsectionName = res[1];
		}else{
		selectedsectionName=selectedsectionNameParam;
		}
	console.info("selectedsectionName="+selectedsectionName)
    
	<c:forEach items="${sectionShortNameFullNameMap}" var="sectionMap" varStatus="loop">
    var sectionName =  '<c:out value="${sectionMap.key}"/>';
    if(hasWhiteSpace(sectionName)){
     var res=sectionName.split(" ");
     sectionName = res[1];
    }
    console.info("section name="+sectionName);
	if(selectedsectionName == sectionName ){
		$("."+sectionName+"Table").show();	
	}else{
		$("."+sectionName+"Table").hide();
	}
	</c:forEach>

 }//end clickOnSection

function checkCheckboxChecked()
{
	var len = $("[name='normDictPoId']:checked").length;
	if(len)
	return true;
	else 
	return false;
}


function submitNormTemplatePopUp()
{
	
	var checkElements = document.getElementsByName('normDictPoId');
	if(checkCheckboxChecked())
	{
	 for(var i=0; checkElements[i]; ++i)
	 {
		  if(checkElements[i].checked)
		  {
			   var $this = $(checkElements[i]);
		  }
	  }
	 
	 var processData=$('#normtemplatepopUpForm').serialize();
	
		actionUrl="insertGlobelLevelData.htm";
		successData=function(data)
		{   
				var msg=data.split("#");
				var rows='';
				var poids='';
				if(msg.length>1){
					rows=msg[0];
					poids=msg[1];
					if(poids!=''){
						var po=poids.split("$");	
						if(po.length>1){
						for(var i=0;i<po.length;i++){
							$("#"+po[i]).addClass('bld');							
					       }
						$.alert(rows);
						}else{
							$("#"+poids).addClass("bld");	
							$.alert(rows);
						}
					}	
				}
				else{
					$.alert(msg);;
				}

			hideLoading();
		};
		errorData=function(data)
		{
		 	$.alert(data); 
			hideLoading();
			
		};
		if(processData=='')
		{
			console.info("data is empty");
			 $.alert("No Data Available"); 
		}
		else
		{
			showLoading();
			console.info(processData);
			callAjax(processData, successData, errorData, beforeSend, actionUrl, reqType, retDataType);
			
		}
		
	}else
	  {
		$.alert('Please select row');
		return false;
	  }
}
  </script>
 
 <style>
 .nav .open>a, .nav .open>a:hover, .nav .open>a:focus{background:#428bca !important;}
 .bg-blue{background:#DBF6FF !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .metadata_C{background:#DBF6FF !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .metadata_G{background:#fde9d9 !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .metadata_I{background:#fde9d9 !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .metadata_CG{background:#fde9d9 !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .metadata_CI{background:#fde9d9 !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .metadata_GI{background:#fde9d9 !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .metadata_CGI{background:#fde9d9 !important; border-bottom:1px solid #fff !important; border-right:1px solid #fff !important}
 .bg-orange{background:#FEE8BF !important;}
 .metadata_G{background:#FEE8BF !important;}
 .bg-sand{background:#fde9d9 !important; font-weight:bold !important;}
 .bld td{font-weight:bold !impor~AZtant; !important;}
 .tblstyle2 {font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;  }
 .tblstyle2 td{border: 1px solid #D8D8D8; padding: 5px; color:#333 !important; font-size:11px;}
.tblstyle2 thead th{background:#074156 !important; border-right:1px solid #ccc; color:#fff !important; font-size:12px !important; font-weight:bold; padding:5px !important}
.tblstyle2 tbody tr:nth-child(even) {background: #f4f4f4; !important;}
.tblstyle2 tbody tr:nth-child(odd) {background: #fff; !important;}
 </style> 




  <!-- Modal -->
  <form name="normtemplatepopUpForm" id="normtemplatepopUpForm" >
  <div class="modal fade" id="companyLevelMainPopupId" role="dialog"  style="z-index:99999">
    <div class="modal-dialog" style="width:75%; margin-top:80px !important">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="panel panel-primary" style="margin:10px">
                <div class="panel-heading">
                    <h3 class="panel-title"></h3>
                    <div style="margin:0 0px 0 160px" class="pull-left">
                        <!-- Tabs -->
                        <ul class="nav panel-tabs">
                            <c:forEach items="${sectionShortNameFullNameMap}" var="sectionMap" varStatus="loop">
                            <c:choose>
                            <c:when test="${loop.count eq 1}">
                            <li class="active"><a href="#" onclick="clickOnSection('${sectionMap.key}');" data-toggle="tab">${sectionMap.value}</a></li>
                            </c:when>
                            <c:when test="${loop.count lt 4}">
                            <li><a href="#" onclick="clickOnSection('${sectionMap.key}');" data-toggle="tab">${sectionMap.value}</a></li>
                            </c:when>
                            
                            </c:choose>
                            </c:forEach>
 					
  					 	 <li class="dropdown">
					           <a class="dropdown-toggle" data-toggle="dropdown" href="#"  id="dropdown_title">Select <b class="caret"></b></a>
					            <ul class="dropdown-menu" id="divNewNotifications">
					            <c:forEach items="${sectionShortNameFullNameMap}" var="sectionMap" varStatus="recipeCounter">
					             <c:if test="${recipeCounter.count >= 4}">
					             <li><a href="javasctipt:void(0)" onclick="clickOnSection('${sectionMap.key}')" data-toggle="tab">${sectionMap.value}</a></li>
					             </c:if>
					             </c:forEach>
					            </ul>
						 </li> 
					       
                        </ul>
                        
                    </div>
				<div class="pull-right" style="margin:-8px 0 0 6px;"><button aria-label="Close" data-dismiss="modal" class="close" type="button" style="color:#fff !important; text-shadow:none !important; font-size:18px !important" title="Close"><span aria-hidden="true">X</span></button></div>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                       
                       	<!--  Here we set template id and filing from nrom_ietm_label table -->
							<input type="hidden" name="fillingId" id="fillingId" value="${filingId}" />
							<input type="hidden" name="templateId" id="templateId" value="${templateId}" />
				            <input type="hidden" name ="searchype" id="searchype" value="${levelName}" />	
				            				
					     <c:forEach items="${sectionShortNameFullNameMap}" var="sectionMap" varStatus="status">
					    <div class="tab-pane active ${sectionMap.key}Table" id="${sectionMap.key}Table">
							<h1 style="padding:0px 0px 10px 0; width:100%; float:left; font-size:18px;">${sectionMap.value}</h1>
							<div style="height:235px; width:100%; overflow-y:auto">
							<table width="100%" cellpadding="5" cellspacing="1" border="0" bgcolor="#ebebeb" class="tblstyle2 datatable-new" id="companyGlobalLevelData">
								<thead>
									<tr>
										<th width="5%"> <input class="${sectionMap.key}checkbox" type="checkbox" name="${sectionMap.key}checkbox" id="${sectionMap.key}checkbox"></th>
										<th width="30%">As Reported Label</th>
										<th width="10%">Sub Section</th>
										<th width="25%">Normalized Label</th>
										<th width="15%">Header Label</th>
										<th width="15%">Table Label</th>
									</tr>
								</thead>
								<tbody>
							   	<c:if test="${not empty parerOutputList}">
							   	<c:forEach items="${parerOutputList}" var="parerOutputObj">
							      <c:if test="${not empty fn:trim(parerOutputObj.poSection) && not empty fn:trim(parerOutputObj.poAsRepLabel) && not empty fn:trim(parerOutputObj.nilLabel) && not empty fn:trim(parerOutputObj.poSubSection)}">
								   	<c:if test="${fn:trim(parerOutputObj.poSection) eq sectionMap.key}">
								   		<tr id="${parerOutputObj.poId}" class='${parerOutputObj.searchLevelClassName}'>
									   		<td ><input type="checkbox" name="normDictPoId" id="normDictPoId" title="${parerOutputObj.mappingName}" class="${sectionMap.key}checkbox4"  
									   		value="${parerOutputObj.poId}~rowLevel~all"></td> 
											<td  align="left"  title="${parerOutputObj.mappingName}"><c:out value="${parerOutputObj.poAsRepLabel}"></c:out> </td>
											<td align="left"  title="${parerOutputObj.mappingName}"><c:out value="${parerOutputObj.poSubSection}"></c:out></td>
											<td align="left" title="${parerOutputObj.mappingName}"><c:out value="${parerOutputObj.nilLabel}"></c:out></td>
											<td align="left" title="${parerOutputObj.mappingName}"><c:out value=""></c:out></td>
											<td align="left" title="${parerOutputObj.mappingName}"><c:out value=""></c:out></td>
										 </tr>
										</c:if>
									</c:if>
								</c:forEach>
								</c:if>
								<c:if test="${not empty arsPoCommandList}">
									<c:forEach items="${arsPoCommandList}" var="arsPoCommandObj">
								   	<c:if test="${fn:trim(arsPoCommandObj.poSection) eq sectionMap.key}">
									   	<tr id="${arsPoCommandObj.poId}" class='${arsPoCommandObj.searchLevelClassName}'>
									   		<td><input type="checkbox" name="normDictPoId" id="normDictPoId" class="${sectionMap.key}checkbox4"
									   		value="${arsPoCommandObj.poId}~cellLevel~${arsPoCommandObj.colName}"> </td>
											<td  align="left" title="${arsPoCommandObj.mappingName}"><c:out value="${arsPoCommandObj.poAsRepLabel}"></c:out> </td>
											<td align="left" title="${arsPoCommandObj.mappingName}"><c:out value="${arsPoCommandObj.poSubSection}"></c:out></td>
											<td align="left" title="${arsPoCommandObj.mappingName}"><c:out value="${arsPoCommandObj.nilLabel}"></c:out></td>
											<td align="left" title="${arsPoCommandObj.mappingName}"><c:out value="${arsPoCommandObj.headerLabel}"></c:out></td>
											<td align="left" title="${arsPoCommandObj.mappingName}"><c:out value="${arsPoCommandObj.tabelLabel}"></c:out></td>
										</tr>
									</c:if>
									</c:forEach>
									</c:if>
								</tbody>
							</table>
							</div>
							</div>
							</c:forEach>
							
       <div class="modal-footer" style="padding:19px 20px 0px 20px !important">
        	<div class="text-center">
	          <button type="button" onclick="submitNormTemplatePopUp()" class="btn btn-primary">Submit</button>
	          <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
          	</div>
        </div>
      </div>
    </div>
  </div>
  </div>
  </div>
  </div>
  </form>