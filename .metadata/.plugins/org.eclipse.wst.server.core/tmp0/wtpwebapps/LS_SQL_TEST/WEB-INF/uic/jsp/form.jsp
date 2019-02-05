<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<html>
<head>
<title>Form</title>
<script type="text/javascript">
  function callEmbeddedComponent(embeddedComponentId, targetDivId, serviceURL){
	  $.ajax({
			method : "post",
			url : serviceURL,
			data : {
				formId : embeddedComponentId,
				tableIds : embeddedComponentId
			},
			error : function(error) {
				console.log("Error while calling component : "+embeddedComponentId +  error);
				//alert("Error while calling component : "+embeddedComponentId +  error);
				$.alert({
				    title: 'Confirm!',
				    content: "An error occurred while calling component : "+embeddedComponentId +  error,
				    confirmButtonClass: 'UicPrimaryBtn',
				    closeIcon: true,
				    columnClass: 'col-md-4 col-md-offset-4',
				});
			},
			success : function(data) {
				$('#'+targetDivId).html(data);
			}
		}); 
  }
  function sliderWithText(eleId){
	  $( "#sliderWithText_"+eleId).slider({
	      slide: function( event, ui ) {
	        $( "#"+eleId).val(ui.value );
	      }
	    });
	  	$( "#sliderWithText_"+eleId ).slider( "option", "value", Number($('#sliderWithTextVal_'+eleId).val()));
	  	$( "#sliderWithText_"+eleId ).slider( "option", "step", Number($('#sliderWithTextStep_'+eleId).val()));
	  	$( "#sliderWithText_"+eleId ).slider( "option", "min", Number($('#sliderWithTextMin_'+eleId).val()));
	  	$( "#sliderWithText_"+eleId ).slider( "option", "max", Number($('#sliderWithTextMax_'+eleId).val()));
  }
  function rangeSliderWithText(eleIdMin, eleIdMax){
	  $( "#rangeSliderWithText_"+eleIdMax).slider({
	      slide: function( event, ui ) {
	        $('#'+eleIdMin ).val(ui.values[ 0 ]);
	    	$('#'+eleIdMax ).val(ui.values[ 1 ]);	
	      }
	    });
	  	$( "#rangeSliderWithText_"+eleIdMax ).slider( "option", "range", true );
	  	$( "#rangeSliderWithText_"+eleIdMax ).slider( "option", "step", Number($('#rangeSliderWithTextStep_'+eleIdMax).val()) );
	  	$( "#rangeSliderWithText_"+eleIdMax ).slider( "option", "min", Number($('#rangeSliderWithTextMin_'+eleIdMax).val() ));
	  	$( "#rangeSliderWithText_"+eleIdMax ).slider( "option", "max", Number($('#rangeSliderWithTextMax_'+eleIdMax).val() ));
	  	$( "#rangeSliderWithText_"+eleIdMax ).slider( "values", 0, Number($('#rangeSliderWithTextValMin_'+eleIdMax).val()));
	  	$( "#rangeSliderWithText_"+eleIdMax ).slider( "values", 1, Number($('#rangeSliderWithTextValMax_'+eleIdMax).val()));
  }
  function rangeSliderWithDropDown(){
	  $( "#rangeSliderWithDropDown" ).slider({
	      slide: function( event, ui ) {
	    	  select[ 0 ].selectedIndex = ui.value - 1;
	      }
	    });
	    $( "#rangeSliderWithDropDown" ).slider( "option", "range", true );
	  	$( "#rangeSliderWithDropDown" ).slider( "option", "step", Number($('#rangeSliderWithTextStep').val()) );
	  	$( "#rangeSliderWithDropDown" ).slider( "option", "min", Number($('#rangeSliderWithTextMin').val() ));
	  	$( "#rangeSliderWithDropDown" ).slider( "option", "max", Number($('#rangeSliderWithTextMax').val() ));
	  	$( "#rangeSliderWithDropDown" ).slider( "values", 0, Number($('#rangeSliderWithTextValMin').val()));
	  	$( "#rangeSliderWithDropDown" ).slider( "values", 1, Number($('#rangeSliderWithTextValMax').val()));
  }
  $(document).ready(function() {
		if($('.AdminUITableLayout').length>0){ //Special handling for Admin UI. Calling post load css.
			applyPostLoadChanges("${form.id}");
		//add tab text
		var formText='';		
		if($('#FORM_CAPTION').attr('value')!=undefined ){
			formText=":"+$('#FORM_CAPTION').attr('value');
		}else if($('#COMPONENT_NAME').attr('value')!=undefined){
			formText=":"+$('#COMPONENT_NAME').attr('value');
		}
		var title = document.getElementsByTagName("title")[0].innerHTML;
		if(!title.indexOf(":")>=0){
			document.title = $('#bs-example-navbar-collapse-1 .active a').text()+formText;
		}
		//add fav icon
		var link = document.querySelector("link[rel*='icon']") || document.createElement('link');
	    link.type = 'image/x-icon';
	    link.rel = 'shortcut icon';
	    link.href = '${pageContext.request.contextPath}/css/uic/images/favicon.ico';
	    document.getElementsByTagName('head')[0].appendChild(link);
		}
  });
  </script>
</head>
<body>
<div class="adminLoading"></div>
<div class="uic_scuess hideFlashDiv" id='statusMessage_${form.id}'></div>
<div class="" id="contentDiv_${form.formId}">
	<c:if test="${not empty form }">
		<form <c:if test="${form.multipart eq true}">enctype="multipart/form-data"</c:if>  id="${form.id}" name="${form.name}"  method="${form.method}" action="${form.action.action}">			
			  <!--new added  -->
			  <c:set value="${form.formCaption}" var="componentCaption"/>
			  <c:set value="${form.formId}" var="componentId"/>
			  <c:if test="${not empty componentCaption.caption or componentCaption.accordianFlag}">
				 <div class="uicComponentHdrPanel uicComponentHdrPanel_${componentId}">
					<div class="UicTblCaptionH2 ${componentCaption.captionCssClass}">
						<span class="uicToggelHdrText_${componentId} uicComponentHdrSpan_${componentId}">
							 <c:out value="${componentCaption.caption}"/>
						</span>
						<c:if test="${componentCaption.isEditableCaption eq 'Y'}">
						    <span class="componentHdrText uicToggelHdrText_${componentId}" style="display:none;">
								<input id="uicComponentHdrText_${componentId}" type="text" value="<c:out value='${componentCaption.caption}'/>">
							</span>
							<span class="glyphicon glyphicon-pencil uicToggelHdrText_${componentId}" ondblclick="toggleComponentCaption('<c:out value="${componentId}"/>');"></span>
							<span class="glyphicon glyphicon-repeat uicToggelHdrText_${componentId}" style="display:none;" onclick="resetComponentCaption('<c:out value="${componentId}"/>');"></span>
							<span class="glyphicon glyphicon-floppy-disk uicToggelHdrText_${componentId}" style="display:none;" 
								onclick="updateComponentCaption('<c:out value="${componentCaption.captionKey}"/>', '<c:out value="${componentId}"/>');"></span>
						</c:if>
						
						<c:if test="${componentCaption.accordianFlag}">
							<span>
								<a id="uicComponentAccordian_${componentId}" class="pull-right glyphicon glyphicon-chevron-up" onclick="expandOrCollapseComponent(this, '<c:out value="${componentId}"/>');"></a>
							</span>
						</c:if>
					</div>
				 </div>
			 </c:if>
			 <!--new added  -->
		<div class="uicComponentMainDataDiv_${componentId}">
			<input type="hidden" name="formId" id="formId" value="${form.formId}" />
			<input type="hidden" value='${errorMap}' id="errorMap"
				name="errorMap" /> <input type="hidden" value='${dataMap}'
				id="dataMap" name="dataMap" />
			<c:forEach items="${form.formGroupList}" var="formGroupRowList"
				varStatus="loop1">
			
					<c:forEach items="${formGroupRowList}" var="formGroup"
						varStatus="loopRowList">
						<div class="formAccordian">
							<div class="uic_whitebg row" style="${formGroup.inlineStyle}">
							  <c:if test="${not empty formGroup.caption or formGroup.visibility}">
								<div style="${formGroup.captionInlineStyle}"
									class="${formGroup.captionCssClass} col-lg-10 uic_headerblock UicTblCaptionH2 UicHeaderSet">
									<c:choose>
										<c:when test="${not empty formGroup.caption and formGroup.isEditableGroupCaption eq 'Y'}">
											<span dir="ltr" class="tLine editableCaptionNew" nowrap
												ondblclick="editCaption(this, '${formGroup.groupCaptionKey}')"><c:out
													value="${formGroup.caption}" /> </span>
										</c:when>
										<c:otherwise>
											<span>
												<c:out value="${formGroup.caption}" />
											</span>
										</c:otherwise>
									</c:choose>
									<c:if test="${formGroup.visibility eq 'Y'}">
										<div class="removespace col-lg-1 pull-right text-right">
											<a id="uicAccordianIdformGroup_${formGroup.uniqueGroupId}"
												class="glyphicon glyphicon-chevron-up"
												href="javascript:formGroupAccordian('uicAccordianIdformGroup_${formGroup.uniqueGroupId}','${formGroup.uniqueGroupId}','formAccordianActionButtons')"></a>
										</div>
									</c:if>
								</div>
								</c:if>	
								<div class="col-lg-12 jumbotron padding15 ${formGroup.cssClass}"
									id="groupID_${formGroup.uniqueGroupId}">
									<c:forEach items="${formGroup.formRowList}" var="formRow"
										varStatus="loop2">
										<div class="row bottom10 ${formGroup.visibility}"
											id="groupData_${loop2.index}">
											<c:forEach items="${formRow.elementslist}" var="element"
												varStatus="loop3">
												<input type="hidden"
													name="DummyValue##${element.htmlElement.htmlElementsId}"
													value="${element.htmlElement.htmlElementsValueDup}~${element.htmlElement.htmlElementsValue}" />
												<c:choose>
												<c:when
														test="${ element.htmlElement.htmlElementsType eq ('slider') && element.htmlElement.isRangeInput eq ('Y')}">

														<input type="hidden"
															name="DummyValue##${element.htmlElement.htmlElementsIdMin}"
															value="${element.htmlElement.htmlElementsValueDupMin}~${element.htmlElement.htmlElementsValueMin}" />
														<input type="hidden"
															name="DummyValue##${element.htmlElement.htmlElementsIdMax}"
															value="${element.htmlElement.htmlElementsValueDupMax}~${element.htmlElement.htmlElementsValueMax}" />
														<div id="FlashElmnt_${element.htmlElement.htmlElementsIdMin}"
															class="col-lg-6 bottom10 ${ element.htmlElement.flashElementHide} x  ${ element.htmlElement.elementInLineCssMin}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label for="inputEmail3"><c:out
																		value="${element.label.labelValue}" />  <c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClassMin, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<div class="row">
																<div class="col-lg-6">
																<input size="13"
																class="setSliderMinVal caps form-control${ element.htmlElement.validationCSSClassMin} x ${ element.htmlElement.cellConditionalCssMin} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																id="${element.htmlElement.htmlElementsIdMin}"
																type="text" ${element.htmlElement.eventAction}
																name="${element.htmlElement.htmlElementsNameMin}"
																style="${ element.htmlElement.inlineStyleMin}"
																value="${element.htmlElement.htmlElementsValueMin}"
																placeholder="${element.htmlElement.placeholderMin}"
																title="${element.htmlElement.tooltipMin}" readonly="readonly"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if> />
															</div>
																<div class="col-lg-6">
																<input size="13"
																class="setSliderMaxVal caps form-control ${ element.htmlElement.validationCSSClassMax} x ${ element.htmlElement.cellConditionalCssMax}"
																id="${element.htmlElement.htmlElementsIdMax}"
																type="text" ${element.htmlElement.eventAction}
																name="${element.htmlElement.htmlElementsNameMax}"
																style="${ element.htmlElement.inlineStyleMax}"
																value="${element.htmlElement.htmlElementsValueMax}"
																placeholder="${element.htmlElement.placeholderMax}"
																title="${element.htmlElement.tooltipMax}" readonly="readonly"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if> />
															</div>
															</div>
															<input type="hidden" id="rangeSliderWithTextMax_${element.htmlElement.htmlElementsIdMax}" value="${element.htmlElement.sliderMax}">
															<input type="hidden" id="rangeSliderWithTextMin_${element.htmlElement.htmlElementsIdMax}" value="${element.htmlElement.sliderMin}">
															<input type="hidden" id="rangeSliderWithTextStep_${element.htmlElement.htmlElementsIdMax}" value="${element.htmlElement.sliderStep}">
															<input type="hidden" id="rangeSliderWithTextValMin_${element.htmlElement.htmlElementsIdMax}" value="${element.htmlElement.htmlElementsValueMin}">
															<input type="hidden" id="rangeSliderWithTextValMax_${element.htmlElement.htmlElementsIdMax}" value="${element.htmlElement.htmlElementsValueMax}">
															<div class="row-fluid">
																<div id="rangeSliderWithText_${element.htmlElement.htmlElementsIdMax}" class="slider col-lg-12"></div>
															</div>
															<script type="text/javascript">rangeSliderWithText('${element.htmlElement.htmlElementsIdMin}', '${element.htmlElement.htmlElementsIdMax}');</script>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsIdMin}'>${element.htmlElement.errorMessaage}</div>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsIdMax}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
													</c:when>
												<c:when
														test="${ element.htmlElement.htmlElementsType eq ('text') && element.htmlElement.isRangeInput eq ('Y')}">
														<input type="hidden"
															name="DummyValue##${element.htmlElement.htmlElementsIdMin}"
															value="${element.htmlElement.htmlElementsValueDupMin}~${element.htmlElement.htmlElementsValueMin}" />
														<input type="hidden"
															name="DummyValue##${element.htmlElement.htmlElementsIdMax}"
															value="${element.htmlElement.htmlElementsValueDupMax}~${element.htmlElement.htmlElementsValueMax}" />
														<div id="FlashElmnt_${element.htmlElement.htmlElementsIdMin}"
															class="col-lg-6 bottom10 ${ element.htmlElement.flashElementHide} x  ${ element.htmlElement.elementInLineCssMin}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label for="inputEmail3"><c:out
																		value="${element.label.labelValue}" />  <c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClassMin, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<div class="row">
																	<div class="col-lg-6">
																	<input size="13"
																	class="caps form-control ${ element.htmlElement.validationCSSClassMin} x  ${ element.htmlElement.cellConditionalCssMin} numeric_${form.id} x  ${form.name}_${element.htmlElement.htmlElementsId}"
																	id="${element.htmlElement.htmlElementsIdMin}"
																	type="${ element.htmlElement.htmlElementsTypeMax}" ${element.htmlElement.eventAction}
																	name="${element.htmlElement.htmlElementsNameMin}"
																	style="${ element.htmlElement.inlineStyleMin}"
																	value="${element.htmlElement.htmlElementsValueMin}"
																	placeholder="${element.htmlElement.placeholderMin}"
																	title="${element.htmlElement.tooltipMin}"
																	<c:if test="${not empty element.htmlElement.flashElement}">
																	onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																</c:if> />
																	</div>
																	<div class="col-lg-6">
																	<input size="13"
																	class="caps form-control ${ element.htmlElement.validationCSSClassMax} x  ${ element.htmlElement.cellConditionalCssMax} numeric_${form.id} x  ${form.name}_${element.htmlElement.htmlElementsId}"
																	id="${element.htmlElement.htmlElementsIdMax}"
																	type="${ element.htmlElement.htmlElementsTypeMax}" ${element.htmlElement.eventAction}
																	name="${element.htmlElement.htmlElementsNameMax}"
																	style="${ element.htmlElement.inlineStyleMax}"
																	value="${element.htmlElement.htmlElementsValueMax}"
																	placeholder="${element.htmlElement.placeholderMax}"
																	title="${element.htmlElement.tooltipMax}" 
																	<c:if test="${not empty element.htmlElement.flashElement}">
																	onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																</c:if> />
																	</div>
																</div>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsIdMin}'>${element.htmlElement.errorMessaage}</div>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsIdMax}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('dropdown') && element.htmlElement.isRangeInput eq ('Y')}">
														<input type="hidden"
															name="DummyValue##${element.htmlElement.htmlElementsIdMin}"
															value="${element.htmlElement.htmlElementsValueDupMin}~${element.htmlElement.htmlElementsValueMin}" />
														<input type="hidden"
															name="DummyValue##${element.htmlElement.htmlElementsIdMax}"
															value="${element.htmlElement.htmlElementsValueDupMax}~${element.htmlElement.htmlElementsValueMax}" />
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide} x  ${ element.htmlElement.elementInLineCssMin}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClassMin, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-3">
																<select style="${ element.htmlElement.inlineStyleMin }" ${element.htmlElement.eventAction}
																id="${element.htmlElement.htmlElementsIdMin}"
																class="slct ${ element.htmlElement.validationCSSClassMin} form-control  ${ element.htmlElement.cellConditionalCssMin} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																name="${element.htmlElement.htmlElementsNameMin}"
																title="${element.htmlElement.tooltipMin}"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																</c:if>>
																	<option value="">SELECT</option>
																	<c:forEach var="dropDownItem"
																		items="${element.htmlElement.dropdownItemsListMin}">
																		<option
																			value='<c:out value="${dropDownItem.value}"/>'
																			<c:if test="${dropDownItem.value eq element.htmlElement.htmlElementsValueMin}">SELECTED</c:if>>
																			<c:out value="${ dropDownItem.label }" />
																		</option>
																	</c:forEach>
															</select>
															</span>
															 <span
																class="${ element.htmlElement.labelPosition} col-lg-3">
																<select style="${ element.htmlElement.inlineStyleMax }" ${element.htmlElement.eventAction}
																id="${element.htmlElement.htmlElementsId}"
																class="slct ${ element.htmlElement.validationCSSClassMax} form-control bottom10 ${ element.htmlElement.cellConditionalCssMax} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																name="${element.htmlElement.htmlElementsNameMax}"
																title="${element.htmlElement.tooltipMax}"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																</c:if>>
																	<option value="">SELECT</option>
																	<c:forEach var="dropDownItem"
																		items="${element.htmlElement.dropdownItemsListMax}">
																		<option
																			value='<c:out value="${dropDownItem.value}"/>'
																			<c:if test="${dropDownItem.value eq element.htmlElement.htmlElementsValueMax}">SELECTED</c:if>>
																			<c:out value="${ dropDownItem.label }" />
																		</option>
																	</c:forEach>
															</select>
															<div id="rangeSliderWithDropDown" class="slider"></div>
																<div class="UicErrorMsg  row"
																	id='errorMessage_${element.htmlElement.htmlElementsIdMin}'>${element.htmlElement.errorMessaage}</div>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsIdMax}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
													</c:when>
												<c:when
														test="${element.htmlElement.htmlElementsType eq ('slider')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 bottom10 ${ element.htmlElement.flashElementHide} x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label for="inputEmail3"><c:out
																		value="${element.label.labelValue}" />  <c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<input 
																class="text setSliderVal form-control caps ${ element.htmlElement.validationCSSClass}  x  ${ element.htmlElement.cellConditionalCss} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																id="${element.htmlElement.htmlElementsId}"
																type="text" ${element.htmlElement.eventAction}
																name="${element.htmlElement.htmlElementsName}"
																style="${ element.htmlElement.inlineStyle}"
																value="${element.htmlElement.htmlElementsValue}"
																placeholder="${element.htmlElement.placeholder}"
																title="${element.htmlElement.tooltip}" readonly="readonly" onfocusout="syncSliderValue(this)"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if> />
															<div id="sliderWithText_${element.htmlElement.htmlElementsId}" class="slider"></div>
															<script type="text/javascript">sliderWithText('${element.htmlElement.htmlElementsId}');</script>
															<input type="hidden" id="sliderWithTextMax_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.sliderMax}">
															<input type="hidden" id="sliderWithTextMin_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.sliderMin}">
															<input type="hidden" id="sliderWithTextStep_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.sliderStep}">
															<input type="hidden" id="sliderWithTextVal_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.htmlElementsValue}">
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
													</c:when>
													<c:when
														test="${(element.htmlElement.htmlElementsType eq 'date' or element.htmlElement.htmlElementsType eq 'datetime') && element.htmlElement.isRangeInput eq ('Y')}">
														<c:choose>
															<c:when test="${element.htmlElement.htmlElementsType eq 'datetime' }">
																<c:set var="dateTimePickerType" value="uicDateTimePicker" />
															</c:when>
															<c:otherwise>
																<c:set var="dateTimePickerType" value="uicDatePicker" />
															</c:otherwise>
														</c:choose>
														<input type="hidden"
															name="DummyValue##${element.htmlElement.htmlElementsIdMin}"
															value="${element.htmlElement.htmlElementsValueDupMin}~${element.htmlElement.htmlElementsValueMin}" />
														<input type="hidden"
															name="DummyValue##${element.htmlElement.htmlElementsIdMax}"
															value="${element.htmlElement.htmlElementsValueDupMax}~${element.htmlElement.htmlElementsValueMax}" />
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6 ">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClassMin, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-3 ">
																<input type="text" ${element.htmlElement.eventAction} readonly="readonly"
																name="${element.htmlElement.htmlElementsNameMin}"
																class="${dateTimePickerType} validate[ ] text-input datepicker form-control ${element.htmlElement.validationCSSClass}  ${ element.htmlElement.cellConditionalCssMin} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																style="${ element.htmlElement.inlineStyleMin}"
																value="${element.htmlElement.htmlElementsValueMin}"
																id="${element.htmlElement.htmlElementsIdMin}"
																placeholder="${element.htmlElement.placeholderMin}"
																title="${element.htmlElement.tooltipMin}"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if> />
															<input type="hidden" id="dateFormat_${element.htmlElement.htmlElementsIdMin}" value="${element.htmlElement.datePattern}"/>
															</span>
															<span
																class="${ element.htmlElement.labelPosition} col-lg-3 ">
																<input type="text" ${element.htmlElement.eventAction} readonly="readonly"
																name="${element.htmlElement.htmlElementsNameMax}"
																class="${dateTimePickerType} validate[ ] text-input datepicker form-control ${ element.htmlElement.cellConditionalCssMax} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																style="${ element.htmlElement.inlineStyleMax}"
																value="${element.htmlElement.htmlElementsValueMax}"
																id="${element.htmlElement.htmlElementsIdMax}"
																placeholder="${element.htmlElement.placeholderMax}"
																title="${element.htmlElement.tooltipMax}"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if> />
															<input type="hidden" id="dateFormat_${element.htmlElement.htmlElementsIdMax}" value="${element.htmlElement.datePattern}"/>
															
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsIdMin}'>${element.htmlElement.errorMessaage}</div>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsIdMax}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('text')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 bottom10 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label for="inputEmail3"><c:out
																		value="${element.label.labelValue}" />  <c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <div
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<input ${element.htmlElement.eventAction}
																class="txt form-control caps ${ element.htmlElement.validationCSSClass}  x  ${ element.htmlElement.cellConditionalCss} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																id="${element.htmlElement.htmlElementsId}"
																type="${element.htmlElement.htmlElementsType}"
																name="${element.htmlElement.htmlElementsName}"
																style="${ element.htmlElement.inlineStyle}"
																value="${element.htmlElement.htmlElementsValue}"
																placeholder="${element.htmlElement.placeholder}"
																title="${element.htmlElement.tooltip}"
																<c:if test="${not empty element.htmlElement.queryName}">
															onKeyUp="callAutoComplete('${element.htmlElement.queryName}','${element.htmlElement.htmlElementsId}','${form.formId}')"
															</c:if>
																<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if> />
																<c:choose>
																	<c:when test="${element.htmlElement.guideME ne ('N')}">
																		<span class="input-group-btn UicAppendHint">
																			<button class="btn btn-default UicAppnedBtn"
																				data-toggle="modal" data-target="#myModal"
																				type="button"
																				onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																				<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																				<span class="glyphicon glyphicon-question-sign"
																					aria-hidden="true"></span>
																			</button> </span>
																	</c:when>
																</c:choose>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</div>
														</div>
															<input type="hidden" id="MIN_${element.htmlElement.htmlElementsId}"  value="${element.htmlElement.minLength}"/>
															<input type="hidden" id="MAX_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.maxLength}"/>
															<input type="hidden" id="REGEX_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.validationRegex}"/>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('hidden')}">
														<input type="${element.htmlElement.htmlElementsType}"
															name="${element.htmlElement.htmlElementsName}"
															value="${element.htmlElement.htmlElementsValue}"
															id="${element.htmlElement.htmlElementsId}" />
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		data-toggle="modal" data-target="#myModal"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button> </span>
															</c:when>
														</c:choose>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq 'date' or element.htmlElement.htmlElementsType eq 'datetime' }">
														<c:choose>
															<c:when test="${element.htmlElement.htmlElementsType eq 'datetime' }">
																<c:set var="dateTimePickerType" value="uicDateTimePicker" />
															</c:when>
															<c:otherwise>
																<c:set var="dateTimePickerType" value="uicDatePicker" />
															</c:otherwise>
														</c:choose>
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6 ">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6 ">
																<input type="text" ${element.htmlElement.eventAction}
																name="${element.htmlElement.htmlElementsName}"
																class="${dateTimePickerType} validate[ ] text-input datepicker form-control ${element.htmlElement.validationCSSClass}  x  ${element.htmlElement.cellConditionalCss} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																style="${ element.htmlElement.inlineStyle}"
																value="${element.htmlElement.htmlElementsValue}"
																id="${element.htmlElement.htmlElementsId}"
																placeholder="${element.htmlElement.placeholder}"
																title="${element.htmlElement.tooltip}"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if> />
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															
															<input type="hidden" id="dateFormat_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.datePattern}"/>
															</span>
														</div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		data-toggle="modal" data-target="#myModal"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button> </span>
															</c:when>
														</c:choose>
														<input type="hidden" class="regex" id="REGEX_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.validationRegex}"/>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('readonly')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
															</label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="uicReadonlyText" id="LBL${element.htmlElement.htmlElementsId}">${element.htmlElement.htmlElementsValue}</label>
																<input type="hidden"
																name="${element.htmlElement.htmlElementsName}"
																value="${element.htmlElement.htmlElementsValue}"
																id="${element.htmlElement.htmlElementsId}"/>
															</span>
														</div>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('file')}">
														<input type="hidden"
															name="${element.htmlElement.htmlElementsName}"
															id="${element.htmlElement.htmlElementsId}"
															value="${element.htmlElement.filePath }">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
																	<c:if
																		test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																		<sup class="uic_customsup">(*)</sup>
																	</c:if>
															</label>
															</span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<input ${element.htmlElement.eventAction}
																type="${element.htmlElement.htmlElementsType}"
																name="${element.htmlElement.htmlElementsName}data"
																class="txt uic_arrangeset ${ element.htmlElement.validationCSSClass }  x  ${ element.htmlElement.cellConditionalCss} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																style="${ element.htmlElement.inlineStyle}"
																value="${element.htmlElement.htmlElementsValue}"
																placeholder="${element.htmlElement.placeholder}"
																title="${element.htmlElement.tooltip}" multiple
																<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if> />
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
														<div class="help-block with-errors"></div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button>
																</span>
															</c:when>
														</c:choose>
														<input type="hidden" class="regex"
															id="REGEX_${element.htmlElement.htmlElementsId}"
															value="${element.htmlElement.validationRegex}" />
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('label')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
															</label>
															</span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="uicReadonlyText ${element.htmlElement.cellConditionalCss}">${element.htmlElement.htmlElementsValue}</label>
																<input type="hidden" name="${element.htmlElement.htmlElementsName}"
																value="${element.htmlElement.htmlElementsValue}" id="${element.htmlElement.htmlElementsId}">
															</span>
														</div>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('textarea')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<textarea ${element.htmlElement.eventAction}
																	name="${element.htmlElement.htmlElementsName}"
																	id="${element.htmlElement.htmlElementsId}"
																	class="${ element.htmlElement.validationCSSClass } form-control ${ element.htmlElement.cellConditionalCss}
																	 ${form.name}_${element.htmlElement.htmlElementsId}"
																	rows="3" style="${ element.htmlElement.inlineStyle}"
																	placeholder="${element.htmlElement.placeholder}"
																	title="${element.htmlElement.tooltip}"
																	<c:if test="${not empty element.htmlElement.flashElement}">
																onfocusout="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if>>${element.htmlElement.htmlElementsValue}</textarea>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button> </span>
															</c:when>
														</c:choose>
														<input type="hidden" class="regex" id="REGEX_${element.htmlElement.htmlElementsId}" value="${element.htmlElement.validationRegex}"/>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('radio') || element.htmlElement.htmlElementsType eq ('radiovertical')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if></label> </span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
															
																<div class="uic_arrangeset">
																	<c:forEach var="dropDownItem"
																		items="${element.htmlElement.dropdownItemsList}">
																		<c:choose>
																			<c:when
																				test="${ fn:containsIgnoreCase(dropDownItem.value, element.htmlElement.htmlElementsValue) }">
																				<div class="col-lg-6">
																					<div class="radio">
																			          <label>
																			            <input ${element.htmlElement.eventAction} 
																			            type="radio" id="${element.htmlElement.htmlElementsId}"
																			            name="${element.htmlElement.htmlElementsName}"
																						class="radiomargin ${ element.htmlElement.validationCSSClass }  x  ${ element.htmlElement.elementLabelPosition} 
																						${form.name}_${element.htmlElement.htmlElementsId}"
																						style="${ element.htmlElement.inlineStyle }"
																						value="${dropDownItem.value}"
																						placeholder="${element.htmlElement.placeholder}"
																						title="${element.htmlElement.tooltip}"
																						checked="checked"
																						<c:if test="${not empty element.htmlElement.flashElement}">
																				onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																			</c:if>>
																					<span class="cr"><i class="UicAlignOkIcon glyphicon glyphicon-record"></i></span>
																			        <span class="${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.cellConditionalCss}">${dropDownItem.label}</span>
																			          </label>
																			        </div>
																				</div>
																			</c:when>
																			<c:otherwise>
																				<div class="col-lg-6">
																					<div class="radio">
																		          <label>
																		            <input ${element.htmlElement.eventAction} type="radio"
																						id="${element.htmlElement.htmlElementsId}"
																						name="${element.htmlElement.htmlElementsName}"
																						class="${ element.htmlElement.validationCSSClass }  x  ${ element.htmlElement.elementLabelPosition} 
																						${form.name}_${element.htmlElement.htmlElementsId}"
																						style="${ element.htmlElement.inlineStyle }"
																						value="${dropDownItem.value}"
																						<c:if test="${not empty element.htmlElement.flashElement}">
																				onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																					</c:if>>
																		            <span class="cr"><i class="UicAlignOkIcon glyphicon glyphicon-record"></i></span>
																		            <span class="${ element.htmlElement.elementLabelPosition}">${dropDownItem.label}</span>
																		          </label>
																		        </div>
																				</div>
																			</c:otherwise>
																		</c:choose>
																		<c:if
																			test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																			<sup class="uic_customsup">(*)</sup>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button> </span>
															</c:when>
														</c:choose>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('radiohorizontal')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<div class="uic_arrangeset">
																	<c:forEach var="dropDownItem"
																		items="${element.htmlElement.dropdownItemsList}">
																		<c:choose>
																			<c:when
																				test="${ fn:containsIgnoreCase(dropDownItem.value, element.htmlElement.htmlElementsValue) }">
																						<div class="radio">
																			          <label>
																			          <input type="radio" ${element.htmlElement.eventAction}
																						id="${element.htmlElement.htmlElementsId}"
																						name="${element.htmlElement.htmlElementsName}"
																						class="radiomargin  ${ element.htmlElement.validationCSSClass }  x  ${ element.htmlElement.elementLabelPosition} 
																						${form.name}_${element.htmlElement.htmlElementsId}"
																						style="${ element.htmlElement.inlineStyle }"
																						value='<c:out value="${dropDownItem.value}"/>'
																						placeholder="${element.htmlElement.placeholder}"
																						title="${element.htmlElement.tooltip}"
																						checked="checked"
																						<c:if test="${not empty element.htmlElement.flashElement}">
																				onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																			</c:if> />
																			 
																					<span class="cr"><i class="UicAlignOkIcon glyphicon glyphicon-record"></i></span>
																			        <span class="${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.cellConditionalCss}">${dropDownItem.label}</span>
																			          </label>
																			        </div>
																			
																			</c:when>
																			<c:otherwise>
																				<input type="radio" ${element.htmlElement.eventAction}
																					id="${element.htmlElement.htmlElementsId}"
																					name="${element.htmlElement.htmlElementsName}"
																					class="${ element.htmlElement.validationCSSClass }  x  ${form.name}_${element.htmlElement.htmlElementsId}"
																					style="${ element.htmlElement.inlineStyle }"
																					value='<c:out value="${dropDownItem.value}"/>'
																					<c:if test="${not empty element.htmlElement.flashElement}">
																				onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																			</c:if> />
																				<label><span
																					class="${ element.htmlElement.elementLabelPosition}">${dropDownItem.label}</span>
																				</label>
																				<br />
																			</c:otherwise>

																		</c:choose>
																		<c:if
																			test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																			<sup class="uic_customsup">(*)</sup>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="UicErrorMsg" id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button> </span>
															</c:when>
														</c:choose>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('checkbox') || element.htmlElement.htmlElementsType eq ('checkboxhorizontal')}">
														<input type="hidden" value=""
															name="${element.htmlElement.htmlElementsName}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label>${element.label.labelValue} 
																	<c:if
																		test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																		<sup class="uic_customsup">(*)</sup>
																	</c:if>
															</label>
															</span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<div class="uic_arrangeset row">
																	<c:forEach var="dropDownItem"
																		items="${element.htmlElement.dropdownItemsList}">
																		<input type="hidden" value="false"
																			name="${element.htmlElement.htmlElementsName}.${dropDownItem.value}">
																		<c:choose>
																			<c:when
																				test="${ fn:containsIgnoreCase(element.htmlElement.htmlElementsValue, dropDownItem.value) }">
																				<div class="col-lg-6">
																					<div class="checkbox">
																						<label> <input
																							${element.htmlElement.eventAction}
																							type="checkbox"
																							id="${element.htmlElement.htmlElementsId}"
																							name="${element.htmlElement.htmlElementsName}"
																							class="chkbox ${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.validationCSSClass } 
																						${form.name}_${element.htmlElement.htmlElementsId}"
																							style="${ element.htmlElement.inlineStyle }"
																							value="${dropDownItem.value}" checked="checked"
																							<c:if test="${not empty element.htmlElement.flashElement}"> onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																					</c:if> />
																							<span class="cr"><i
																								class="UicAlignOkIcon glyphicon glyphicon-ok"></i></span>
																							<span
																							class="${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.cellConditionalCss}">${dropDownItem.label}</span>
																						</label>
																					</div>
																				</div>
																			</c:when>
																			<c:otherwise>
																				<div class="col-lg-6">

																					<div class="checkbox">
																						<label> <input
																							${element.htmlElement.eventAction}
																							type="checkbox"
																							id="${element.htmlElement.htmlElementsId}"
																							name="${element.htmlElement.htmlElementsName}"
																							class="chkbox ${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.validationCSSClass } 
																							${form.name}_${element.htmlElement.htmlElementsId}"
																							style="${ element.htmlElement.inlineStyle }"
																							value="${dropDownItem.value}"
																							placeholder="${element.htmlElement.placeholder}"
																							title="${element.htmlElement.tooltip}"
																							<c:if test="${not empty element.htmlElement.flashElement}">
																							onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																			</c:if>>
																							<span class="cr"><i
																								class="UicAlignOkIcon glyphicon glyphicon-ok" title="${element.htmlElement.tooltip}"></i></span>
																						</label>
																					</div>
																					<label> <span
																						class="${ element.htmlElement.elementLabelPosition}">${dropDownItem.label}</span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																</div>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button>
																</span>
															</c:when>
														</c:choose>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('checkboxvertical')}">
														<input type="hidden" value=""
															name="${element.htmlElement.htmlElementsName}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if></label> 
																</span> 
																<span class="${ element.htmlElement.labelPosition} col-lg-6">
																<div class="uic_arrangeset ${ element.htmlElement.elementInLineCss}">
																	<c:forEach var="dropDownItem"
																		items="${element.htmlElement.dropdownItemsList}">
																		<input type="hidden" value="false"
																			name="${element.htmlElement.htmlElementsName}.${dropDownItem.value}">
																		<c:choose>
																			<c:when
																				test="${ fn:containsIgnoreCase(element.htmlElement.htmlElementsValue, dropDownItem.value) }">
																				<div class="checkbox">
																					<label>
																					<input type="checkbox" ${element.htmlElement.eventAction}
																						id="${element.htmlElement.htmlElementsId}"
																						name="${element.htmlElement.htmlElementsName}"
																						class="chkbox ${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.validationCSSClass } 
																						${form.name}_${element.htmlElement.htmlElementsId}"
																						style="${ element.htmlElement.inlineStyle }"
																						value="${dropDownItem.value}" checked="checked"
																						<c:if test="${not empty element.htmlElement.flashElement}">
																				onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																			</c:if> />
																					<span class="cr"><i class="UicAlignOkIcon glyphicon glyphicon-ok"></i></span>
																					<span class="${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.cellConditionalCss}">${dropDownItem.label}</span>
																					</label>
																				</div>
																			</c:when>
																			<c:otherwise>
																					<div class="checkbox">
																		          <label>
																		            <input type="checkbox" ${element.htmlElement.eventAction}
																						id="${element.htmlElement.htmlElementsId}"
																						name="${element.htmlElement.htmlElementsName}"
																						class="chkbox ${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.validationCSSClass } 
																						${form.name}_${element.htmlElement.htmlElementsId}"
																						style="${ element.htmlElement.inlineStyle }"
																						value="${dropDownItem.value}"
																						placeholder="${element.htmlElement.placeholder}"
																						title="${element.htmlElement.tooltip}"
																						<c:if test="${not empty element.htmlElement.flashElement}">
																				onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
																			</c:if> />
																		            <span class="cr"><i class="UicAlignOkIcon glyphicon glyphicon-ok"></i></span>
																		            <span class="${ element.htmlElement.elementLabelPosition}  x  ${ element.htmlElement.cellConditionalCss}">${dropDownItem.label}</span>
																		          </label>
																		        </div>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																</div>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button> </span>
															</c:when>
														</c:choose>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('dropdown')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<select style="${ element.htmlElement.inlineStyle }" ${element.htmlElement.eventAction}
																id="${element.htmlElement.htmlElementsId}"
																class="slct ${ element.htmlElement.validationCSSClass} form-control bottom10 ${ element.htmlElement.cellConditionalCss} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																name="${element.htmlElement.htmlElementsName}"
																title="${element.htmlElement.tooltip}"
																<c:if test="${not empty element.htmlElement.flashElement}">
																onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if>>
																	<option value="">SELECT</option>
																	<c:forEach var="dropDownItem"
																		items="${element.htmlElement.dropdownItemsList}">
																		<option
																			value='<c:out value="${ dropDownItem.value }" />'
																			<c:if test="${dropDownItem.value eq element.htmlElement.htmlElementsValue}">SELECTED</c:if>>
																			<c:out value="${ dropDownItem.label }" />
																		</option>
																	</c:forEach>
															</select>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">

																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		data-toggle="modal" data-target="#myModal"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button> </span>
																<!-- 	<a> <span class="input-group-addon"> </span> </a> -->
															</c:when>
														</c:choose>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('multidropdown') or element.htmlElement.htmlElementsType eq ('multiselect')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<input type="hidden" value="" 
																name="${element.htmlElement.htmlElementsName}">
															<span class="${ element.htmlElement.labelPosition} col-lg-6">
																<label class="control-label">${element.label.labelValue}
																<c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label></span> <span class="${ element.htmlElement.labelPosition} col-lg-6">
																<select multiple="multiple" 
																style="${ element.htmlElement.inlineStyle }"
																id="${element.htmlElement.htmlElementsId}"
																class="UicMultiSelected slct multiselect ${ element.htmlElement.validationCSSClass} form-control bottom10 ${ element.htmlElement.cellConditionalCss} 
																${form.name}_${element.htmlElement.htmlElementsId}"
																name="${element.htmlElement.htmlElementsName}"
																title="${element.htmlElement.tooltip}"
																${element.htmlElement.eventAction}
																<c:if test="${not empty element.htmlElement.flashElement}">
																onchange="callflashElementDispaly(this, '${element.htmlElement.flashElement}', '<c:out value="${element.htmlElement.flashElementCondition}"/>' );"
															</c:if>>
																	<!-- <option value="">SELECT</option> -->
																	<c:forEach var="dropDownItem"
																		items="${element.htmlElement.dropdownItemsList}">
																		<c:choose>
																			<c:when
																				test="${ fn:containsIgnoreCase(element.htmlElement.htmlElementsValue, dropDownItem.value) }">
																				<option value='<c:out value="${ dropDownItem.value }" />'
																					selected="selected">
																					<c:out value="${ dropDownItem.label }" />
																				</option>
																			</c:when>
																			<c:otherwise>
																				<option value='<c:out value="${dropDownItem.value}"/>' > 
																					<c:out value="${ dropDownItem.label }" />
																				</option>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
															</select>
																<div class="UicErrorMsg"
																	id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
															</span>
														</div>
														<c:choose>
															<c:when test="${element.htmlElement.guideME ne ('N')}">
																<span class="input-group-btn UicAppendHint">
																	<button class="btn btn-default UicAppnedBtn"
																		data-toggle="modal" data-target="#myModal"
																		type="button"
																		onclick="callGuideMeMessage('${element.htmlElement.guideMEMessage}');">
																		<!-- <img src="css/uic/images/guideMe3.jpg"
																			class="uic_guidemsg" /> -->
																	</button> </span>
															</c:when>
														</c:choose>
													</c:when>

													<c:when
														test="${element.htmlElement.htmlElementsType eq ('color')}">
														<div class="col-lg-6">
														<div
															class="${ element.htmlElement.labelPosition} col-lg-6">
															<label for="inputEmail3"><c:out
																	value="${element.label.labelValue}" /> </label>
														</div>
														
														<div
															class="${ element.htmlElement.labelPosition} col-lg-6">
															<section id="typeahead">
														<div class="input-group UicColorPicker colorpicker-component">
													    <input ${element.htmlElement.eventAction} type="text" class="form-control ${ element.htmlElement.validationCSSClass}  x  ${form.name}_${element.htmlElement.htmlElementsId}"
													    id="${element.htmlElement.htmlElementsId}" name="${element.htmlElement.htmlElementsName}"
																	style="${ element.htmlElement.inlineStyle}"
																	value="${element.htmlElement.htmlElementsValue}"
																	placeholder="${element.htmlElement.placeholder}"
																	title="${element.htmlElement.tooltip}" />
													    <span class="input-group-addon"><i></i></span>
														</div>
															</section>
															</div>
															</div>
													</c:when>
													<c:when
														test="${element.htmlElement.htmlElementsType eq ('captcha')}">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="col-lg-6 bottom10 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}">
															<span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																<label for="inputEmail3"><c:out
																		value="${element.label.labelValue}" /> <c:if
																	test="${ fn:containsIgnoreCase(element.htmlElement.validationCSSClass, 'required')}">
																	<sup class="uic_customsup">(*)</sup>
																</c:if> </label> </span> <span
																class="${ element.htmlElement.labelPosition} col-lg-6">
																 <div style="float:left;">
																	 <input ${element.htmlElement.eventAction}
																	class="text form-control caps ${ element.htmlElement.validationCSSClass}  x  ${ element.htmlElement.cellConditionalCss}  x  ${form.name}_${element.htmlElement.htmlElementsId}"
																	id="${element.htmlElement.htmlElementsId}"
																	type="text"
																	name="${element.htmlElement.htmlElementsName}"
																	style="${ element.htmlElement.inlineStyle}"
																	value="${element.htmlElement.htmlElementsValue}"
																	placeholder="${element.htmlElement.placeholder}"
																	title="${element.htmlElement.tooltip}"
																	/>
		          		 										 <div style="float:left; width:90%"><img class="captcha" src="<c:url value='./simpleCaptcha.png' />" /></div>
		            												<div style="float:left; padding:14px 0 0 0; width:10%"><a href="javascript:void('0');" class="captcha-reload" onclick="reloadCaptcha();">
		 				    										 <img src="css/uic/images/refresh.png" alt="Reload-Capcha" /></a>
					 											  </div>
						                                        </div>
																
																<div class="UicErrorMsg" id='errorMessage_${element.htmlElement.htmlElementsId}'>${element.htmlElement.errorMessaage}</div>
																</div>
															</span>
														</div>
													</c:when>
													<c:when
														test="${(element.htmlElement.htmlElementsType) eq ('submit') }">
														<button type="button" ${element.htmlElement.eventAction}
															name="${element.htmlElement.htmlElementsName}"
															class="btn btn-primary ${ element.htmlElement.cellConditionalCss}  x  ${form.name}_${element.htmlElement.htmlElementsId}"
															value="${element.htmlElement.htmlElementsValue}"
															title="${element.htmlElement.tooltip}"
															onclick="saveFormComponent('${form.id}');">${element.htmlElement.htmlElementsValue}</button>
													</c:when>
													<c:when
														test="${(element.htmlElement.htmlElementsType) eq ('button') }">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="form-group col-lg-6 bottom10 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}  x  ${ element.htmlElement.cellConditionalCss}">
														<button ${element.htmlElement.eventAction} type="button"
															name="${element.htmlElement.htmlElementsName}"
															class="btn btn-primary" style="${ element.htmlElement.elementInLineCss}  x  ${form.name}_${element.htmlElement.htmlElementsId}"
															value="${element.htmlElement.htmlElementsValue}"
															title="${element.htmlElement.tooltip}">${element.htmlElement.htmlElementsValue}</button>
														</div>
													</c:when>
													<c:when
														test="${(element.htmlElement.htmlElementsType) eq ('image') }">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="form-group col-lg-6 bottom10 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}  x  ${ element.htmlElement.cellConditionalCss} 
															${form.name}_${element.htmlElement.htmlElementsId}">
															<img alt="" ${element.htmlElement.eventAction}
																 src="${element.htmlElement.htmlElementsValue}"
																 title="${element.htmlElement.tooltip}">
														</div>
													</c:when>
													<c:when
														test="${(element.htmlElement.htmlElementsType) eq ('jsp') }">
														<div id="FlashElmnt_${element.htmlElement.htmlElementsId}"
															class="form-group col-lg-6 bottom10 ${ element.htmlElement.flashElementHide}  x  ${ element.htmlElement.elementInLineCss}  x  ${ element.htmlElement.cellConditionalCss}">
															<%@include file="testInc.jsp" %>
														</div>
													</c:when>
													<c:when
														test="${ (element.htmlElement.htmlElementsType) eq ('table') || (element.htmlElement.htmlElementsType) eq ('form') || (element.htmlElement.htmlElementsType) eq ('graph') }">
														<div id="embedded_${element.htmlElement.htmlElementsId}" class="${ element.htmlElement.elementInLineCss}  x  ${ element.htmlElement.cellConditionalCss}">
															<script type="text/javascript">callEmbeddedComponent('${element.htmlElement.embeddedComponentId}', 'embedded_${element.htmlElement.htmlElementsId}', '${element.htmlElement.seriveURL}');</script>
														</div>
													</c:when>
												</c:choose>
											</c:forEach>
										</div>
									</c:forEach>
								</div>
					</c:forEach>
			</c:forEach>
			<div class="formAccordianActionButtons text-center col-lg-12" style="margin: 10px 0">
				 <input type="hidden" id="formSubmitType_${form.id}" name="formSubmitType_${form.id}" value="${form.action.formSubmitType}">
				 <input type="hidden" id="embeddedAction_${form.formId}" value="${form.embeddedAction}"> 
				 <input type="hidden" id="embeddedTableCompIds_${form.formId}" value="${form.embeddedTableCompIds}"> 
				 <input type="hidden" id="buttonAction" name="buttonAction" value='${buttonAction}'>
				 <input type="hidden" id="actionType_${form.id}" name="actionType_${form.id}" value="${form.action.actionType}">
				 <input type="hidden" id="form_id" value="${form.id}" />
				 
			    <c:if test="${isPreviousFromId eq 'true'}">
			      <button type="button" name="previous" id="previous" class="btn btn-primary UicBtnRightMargin" value="${previousFromId}" onclick="previousFormComponent('${form.id}');">${previousButtonLabel}</button>
			    </c:if>
			    <c:if test="${not empty  addRecordLabel}">
			      <button type="button" name="addRecordLabel" id="addRecordLabel" class="btn btn-primary UicBtnRightMargin"  value="${sameFormId}" onclick="addFormComponent('${form.id}');">${addRecordLabel}</button>
			    </c:if>
			    <c:if test="${nextFromId eq 'true'}">
			      <button type="button" name="next" class="btn btn-primary UicBtnRightMargin" id="next" value="next" onclick="nextFormComponent('${form.id}');">${nextButtonLabel}</button>
			    </c:if>
			    <c:if test="${not empty submitLabel}">
			      <button type="button" name="Submit" class="btn btn-primary UicBtnRightMargin" value="Submit" id = "formSubmit_${form.id}" onclick="saveFormComponent('${form.id}');">${submitLabel}</button>
			    </c:if>
			    <c:if test="${not empty resetValLabel}">
			      <button type="button" name="resetButton" class="btn btn-primary" value="Reset" onclick="resetForm('${form.id}');">${resetValLabel}</button>
			    </c:if>
			    
			    <c:if test="${ form.buttonLst ne null}">
			        <c:forEach items="${form.buttonLst }" var="button" varStatus="buttonLoop">
				        <c:choose>
				        	<c:when test="${button.displayFlag eq false }">
								<c:set var="buttonStyle" value="display:none;" />
							</c:when>
							<c:otherwise>
								<c:set var="buttonStyle" value="" />
							</c:otherwise> 
						</c:choose> 
				        <button type="${button.buttonType}" class="btn btn-primary UicBtnRightMargin ${button.buttonCSS}" id="uicButton_${button.uniqueButtonId}" 
				        style="${buttonStyle}" ${button.eventDataStr}>
				        	<c:out value="${button.buttonLabel}"/>
				        </button>
			        </c:forEach>
		        </c:if>
			</div>
		</form>
	</c:if>
	<div id="container" style="display: none" onclick="unloadPopupBox()"><!-- Main Page --></div>
</div>
 </div>
 </div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div id="popup_box">
						<div id="message"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		</div>
				
<!-- Vasudev Add -->
<script type="text/javascript">
	initializeDateTimePicker();	 
	window.groups_eg_g = $('.UicMultiSelected').SumoSelect({/* selectAll:true, search:true, searchText:'Enter here.' */});
	
	try{
		initializeDateTimePicker("${form.id}", "Form");
	}catch(err){
		console.log("initializeDateTimePicker not loaded in uic Form component");
	}
</script>		
<style>
.bootstrap-multiselect + div {
    padding-left: 0px !important;
    padding-right: 0px !important;
}
.bootstrap-multiselect + div button b {
    position: absolute;
    right: 6px;
    top: 12px;
}
.bootstrap-multiselect + div button {
	text-align: left !important;
}
</style>
</body>
</html>