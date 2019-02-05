<link rel="stylesheet" href="css/appCSS/${applicationScope['cssType']}/rules_pdf_basedparser_${applicationScope['cssType']}.css?value=${applicationScope['version']}" type="text/css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
table-bordered tr td{padding:5px !important}
</style>
<script>
var dcId='';
	function itrEditRowClick(obj)
	{
		
		if($(obj).hasClass('updateRow'))
		{
			$(obj).prev().show();
			$(obj).remove();
		}else
		{
		
		dcId=$(obj).find("#dcIdTemp").text().trim();
		var pageNo = $(obj).find("#pageNo").text().trim();
		var type = $(obj).find("#type").text().trim();
		var templateID = $(obj).find("#templateID").text().trim();
		console.info("data="+templateID);
		var template_PageNo = $(obj).find("#template_PageNo").text().trim();
		var year = $(obj).find("#year").text().trim();
		var companyName = $(obj).find("#companyName").text().trim();
		console.info("company name="+companyName);
		var inputs = '<tr class="updateRow" ondblClick="itrEditRowClick($(this));" id="'+ dcId + '">';
		inputs += '<input type="hidden" name="dcId" id="dcId" value="'+dcId+'"/>';
		inputs +='<td><input type="checkbox" id="checkbox" class="checkbox" value="'+dcId+'"></td>';
		inputs += '<td><input type="text" name="pageNo" id="pageNo" autocomplete="off" value="'+pageNo+'"  class="wdt-96"/></td>';
		inputs += '<td>' + createPageTypeDropDown() + '</td>';
		inputs += '<td>' + createTemplateIDDropDown() + '</td>';
		inputs += '<td>' + createTemplatePageNoDropDown() + '</td>';
		inputs += '<td>' + createYearDropDown() + '</td>';
		inputs += '<td><input type="text" name="companyName" id="companyName" autocomplete="off" value="'+companyName+'" class="wdt-96"/></td>';
		inputs += '</tr>';
		$(obj).css("display", "none");
		$(obj).after(inputs);

		if (type != '' && type!='Select') {
		$("#type"+dcId).val(type);
		}else{
		$("#type"+dcId).val('');
		}
		if (templateID != '' && templateID!='Select' ) {
		$('#templateID'+dcId).val(templateID);
		}else{
		$('#templateID'+dcId).val('');
		}
		if (template_PageNo != '' && template_PageNo!='Select') {
		$('#template_PageNo'+dcId).val(template_PageNo);
		}else{
		$('#template_PageNo'+dcId).val('');
		}
		if (year != '' && year!='Select') {
		$('#year'+dcId).val(year);
		}else{
		$('#year'+dcId).val('');
		}
		}//end else
	}//end functon itrEditRowClick
	function createYearDropDown() {
		var selectDropDown = "";
		selectDropDown += '<select id="year'+dcId+'" name="year" class="form-control" style="padding:2px;">';
		selectDropDown += '<option value="">Select</option>';
		selectDropDown += '<option value="2011">2011</option>';
		selectDropDown += '<option value="2012">2012</option>';
		selectDropDown += '<option value="2013">2013</option>';
		selectDropDown += '<option value="2014">2014</option>';
		selectDropDown += '<option value="2015">2015</option>';
		selectDropDown += '<option value="2016">2016</option>';
		selectDropDown += '</select>';
		return selectDropDown;
	}
	function createTemplatePageNoDropDown() {
		var selectDropDown = "";
		selectDropDown += '<select id="template_PageNo'+dcId+'" name="template_PageNo" class="form-control" style="padding:2px;">';
		selectDropDown += '<option value="">Select</option>';
		selectDropDown += '<option value="0">0</option>';
		selectDropDown += '<option value="1">1</option>';
		selectDropDown += '<option value="2">2</option>';
		selectDropDown += '<option value="3">3</option>';
		selectDropDown += '<option value="4">4</option>';
		selectDropDown += '<option value="5">5</option>';
		selectDropDown += '</select>';
		return selectDropDown;
	}

	function createTemplateIDDropDown() {
		var selectDropDown = "";
		selectDropDown += '<select id="templateID'+ dcId + '" name="templateID" class="form-control" style="padding:2px;">';
		selectDropDown += '<option value="">Select</option>';
		selectDropDown += '<option value="1120">1120</option>';
		selectDropDown += '<option value="1120S">1120S</option>';
		selectDropDown += '<option value="1065">1065</option>';
		selectDropDown += '</select>';
		return selectDropDown;
	}
	function createPageTypeDropDown() {
		var selectDropDown = "";
		selectDropDown += '<select id="type'+dcId+'" name="type" class="form-control" style="padding:2px;">';
		selectDropDown += '<option value="">Select</option>';
		selectDropDown += '<option value="NA">NA</option>';
		selectDropDown += '<option value="ITR">ITR</option>';
		selectDropDown += '</select>';
		return selectDropDown;
	}

	function addITRRow()
	{
		var dcId='';
		//here we get last page number
		var pageNo=$("#ITRTable tr:last td:nth-child(3)").text();
		if(pageNo=='')
			{
				pageNo=$('table#ITRTable tr:last input[name=pageNo]').val();
			}
		if(pageNo!= undefined)
			{
			
			}
		else
			{
			pageNo=0;	
			}
		pageNo = parseInt(pageNo) + parseInt(1);

		var inputs = '<tr class="updateRow" id="">';
		inputs += '<input type="hidden" name="dcId" id="dcId" value="0"/>';
		inputs +='<td><input type="checkbox" id="checkbox" class="checkbox" value="'+dcId+'"></td>';
		inputs += '<td><input type="text" name="pageNo" id="pageNo" autocomplete="off" value="'+pageNo+'"  class="wdt-96"/></td>';
		inputs += '<td>' + createPageTypeDropDown() + '</td>';
		inputs += '<td>' + createTemplateIDDropDown() + '</td>';
		inputs += '<td>' + createTemplatePageNoDropDown() + '</td>';
		inputs += '<td>' + createYearDropDown() + '</td>';
		inputs += '<td><input type="text" name="companyName" id="companyName" autocomplete="off" value="" class="wdt-96"/></td>';
		inputs += '</tr>';
		$('#ITRTable tr:last').after(inputs);
		$('table#ITRTable tr:last td:first input').focus();
		
	}
</script>
<c:if test="${not empty flag}">
<c:choose>
<c:when test="${flag}">
	<script>
	$.alert("ITR Rules Added Successfully");
	</script>
	
</c:when>
 <c:otherwise>
<script>
$.alert("ITR Rules Added Failed");
</script>				       
</c:otherwise>
</c:choose>
 </c:if>
 
            
                <div style="margin-bottom:10px; height:350px; overflow:auto">
           		  <table width="100%" border="0" cellspacing="1" cellpadding="5"  style=""  bgcolor="#ebebeb" class="tblstyle newTable table-bordered" id="ITRTable">
                    <thead>
                    <tr class="throw1">
                     <th width="1%" bgcolor="#6dbcbf" class="chkbox">
                     </th>
                      <th width="5%" align="left" ><strong>Page No</strong></th>
                      <th width="10%" align="center" ><strong>Type</strong></th>
                      <th width="10%" align="center" ><strong>Template ID</strong></th>
                      <th width="10%" align="center" ><strong>Template Page No</strong></th>
                      <th width="10%"  align="center" ><strong>Year</strong></th>
                      <th width="50%" align="center" ><strong>Company Name</strong></th>
                    </tr>
                    </thead>
                      <input type="hidden" name='filingId' id='filingId' value="${caseId} "/>
                     <c:set var="cssTrClassname" value="even"/>
                      
                      <tbody>
                     <c:forEach items="${documentList}" var="documentList">  
                   
                    <tr class="${cssTrClassname}" ondblClick="itrEditRowClick($(this));">
                     <td><input type="checkbox" id="checkbox" class="checkbox" value="${documentList.dcId}"></td>
                     <td style="display: none;" id="dcIdTemp">${documentList.dcId}</td>
                     <td id="pageNo"><c:out value="${documentList.pageNo}"/></td>
                     <td id="type"><c:out value="${documentList.type}"/></td>
                     <td id="templateID"><c:out value="${documentList.templateID}"/></td>
                     <td id="template_PageNo"><c:out value="${documentList.template_PageNo}"/></td>
                     <td id="year"><c:out value="${documentList.year}"/></td>
                     <td id="companyName"><c:out value="${documentList.companyName}"/></td>
                    </tr>
                   <c:choose>  
        	
        	<c:when test="${cssTrClassname=='even'}">  
             <c:set var="cssTrClassname" value="odd"/>
             </c:when>  
             <c:otherwise>  
             <c:set var="cssTrClassname" value="even"/>
             </c:otherwise>  
    		</c:choose>  
         
           </c:forEach>
           </tbody>
                    
                  </table>
                  
                </div>
               
                
   <script type="text/javascript">
 	$("#ITRTable").tableHeadFixer(); 
 </script>
                


