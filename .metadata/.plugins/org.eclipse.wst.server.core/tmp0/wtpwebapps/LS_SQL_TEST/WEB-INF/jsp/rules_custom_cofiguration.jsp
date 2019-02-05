<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<link rel="stylesheet" type="text/css" href="css/bootstrap-multiselect.css">
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
<script>
function updatePDFExtractionMetaData(propName,propValue)
{
if(propValue!='select')
{
showLoading();
var filingId=$("#filingId").val();
var processData= "propName="+encodeURIComponent(propName)+"&propValue="+encodeURIComponent(propValue)+"&fillingId="+filingId;
actionUrl = "update_custom_configuration.htm";
successData = function(data) {
	try {
		$.ajaxSetup({
			async : false
		});
		hideLoading();
		
	} catch (e) {
		hideLoading();
		$.alert("Error:" + e);
	}
}
	console.info("--------Value Validated-------");
	retDataType="html";
	callAjax(processData,successData,errorData,beforeSend,actionUrl,reqType,retDataType);
}//end propValue if
}
</script>
<div class="modal fade" id="custom_config" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document" style="width:73%; margin-top:100px !important">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Custom Configuration</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin:-9px 0 0 0 !important">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="min-height:290px">
		<form name="custome_config_form" id="custome_config_form">
<!-- Map<DropDownType,Map<"ISOrinetation",Map<"SlideBySlide",DropDownList>>> -->
 
		<c:forEach items="${dataMap}" var="dropDownTypeMap">
		<c:forEach items="${dropDownTypeMap.value}" var="propertyNameMap">
	
	  <c:choose>
  		<c:when test="${dropDownTypeMap.key=='SingleDropDown'}"><div class="col-md-3"></c:when>
	 	<c:when test="${dropDownTypeMap.key=='multiple'}"><div class="col-md-3 multipleDropdownClass"></c:when>
	  </c:choose>
		
		  <div class="form-group">
			<label for="formGroupExampleInput">${propertyNameMap.key}</label>
			<c:choose>
		<c:when test="${dropDownTypeMap.key == 'SingleDropDown'}">
		<select class="form-control" id="${propertyNameMap.key}" onchange="updatePDFExtractionMetaData('${propertyNameMap.key}',this.value)">
		</c:when>
		<c:when test="${dropDownTypeMap.key == 'multiple'}">
		<select class="form-control customSelected ${fn:replace(propertyNameMap.key,' ', '')}" id="${propertyNameMap.key}" multiple="multiple">
		</c:when>
		</c:choose>
		
			<c:forEach items="${propertyNameMap.value}" var="propertyValueMap">
			<c:set var="selectedValue" value="${propertyValueMap.key}"/>
			<c:set var="propertyValueList" value="${propertyValueMap.value}"/>
			<c:forEach items="${propertyValueList}" var="propertyValueObj">
			<c:choose>
			<c:when test="${fn:contains(selectedValue, propertyValueObj)}">
			<option selected="selected">${propertyValueObj}</option>
			</c:when>
			<c:otherwise>
			<option>${propertyValueObj}</option>
			</c:otherwise>
			</c:choose>
			
			</c:forEach>
		  </c:forEach>
			</select>
		  </div>
		</div>
		</c:forEach>
		
		</c:forEach>
		</form>
      </div>
    </div>
  </div>
</div>
		
<script>
var checkedArray=new Array();
var parentNodeId;
$('.customSelected').multiselect({ 
includeSelectAllOption: true,
enableFiltering:false,
enableCaseInsensitiveFiltering:false,
includeSelectAllOption: false,
buttonWidth: 211,
onDropdownHide: function(event) {
  //here save data in db
 console.info(checkedArray.length);
  if(checkedArray.length>0)
  {
  updatePDFExtractionMetaData(parentNodeId,checkedArray.toString());
  checkedArray=new Array() ;
  parentNodeId='';
  }
},
onChange: function(option, checked) {
	 
	  parentNodeId=$(option).parent().attr('id');
	  var className=parentNodeId.replace(/\s/g,'');
	  checkedArray = $('.'+className).val();
	  console.info("className="+checkedArray);

	 
	  
}

});
/**
 * Bolow function used for disable multiselecte checkboxes
 */
$(".multiselect-container>li>a>label>input[type=checkbox]").attr("disabled", true);
</script>
		