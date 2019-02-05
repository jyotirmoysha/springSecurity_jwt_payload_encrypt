<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<html>
<head>
<title>Preview</title>
<script type="text/javascript">
	callHightCharts(); // call on load
	   function callHightCharts(){
			   var jsonStr = '${jsonChart}';
			   var obj = jQuery.parseJSON(jsonStr);
			   var jsonTableIdObj = '${tableIdObj}';
			   var tableIdObj = jQuery.parseJSON(jsonTableIdObj);
			   var chartAttribute = null;
			   var chartComponent = null;
			   for (var id in tableIdObj) {
			    if (tableIdObj.hasOwnProperty(id)) {
			     var chartAttributeId="chartAttribute_"+tableIdObj[id];
			     var chartComponentId="chartComponent_"+tableIdObj[id];
			     for (var key in obj) {
			      if (obj.hasOwnProperty(key)) {
	
			       if(key == chartAttributeId){
			        chartAttribute = obj[key];
			       }
			       if(key == chartComponentId){
			        chartComponent = obj[key];
			       }
	
			       if(chartAttribute!=null && chartComponent!=null){
			        var chartContainer = "uic_chart_container_"+tableIdObj[id];
			        var isAccordian = chartComponent.isAccordian;
	
			        if (isAccordian == 'Y')
			         $("#uic_custom_btn_right_"+tableIdObj[id]).show();
					 var chartType = chartComponent.chartType.toUpperCase();
			        if (chartType == 'PIE')
			         getHighchartsOptionsForPie(chartComponent, chartAttribute, chartContainer);
			        else if (chartType == 'GROUPEDBAR')
			         getHighchartsOptionsForGroupedBar(chartComponent,chartAttribute, chartContainer);
			        else if (chartType == 'STACKEDBAR')
			         getHighchartsOptionsForStackedBar(chartComponent,chartAttribute, chartContainer);
			        else if (chartType == 'BASICBAR')
			         getHighchartsOptionsForBasicBar(chartComponent,chartAttribute, chartContainer);
			        else if (chartType == 'LINE') 
			         getHighchartsOptionsForLine(chartComponent,chartAttribute, chartContainer);
			        else if (chartType == 'DONUTCHART') 
			         getHighchartsOptionsForDonutChart(chartComponent,chartAttribute, chartContainer);
			       }
			      }
			     }
			    }
			   }
	   }
	</script>
</head>
<body>
	<c:if test="${not empty tableObj}">
		<c:forEach items="${tableObj}" var="componentId">
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
			<div id="uic_chart_MainDiv_${componentId}" class="dis uicComponentMainDataDiv_${componentId}">
				<div id="uic_chart_container_${componentId}">
					<!-- Empty -->
				</div>
				<c:if test="${buttonLst ne null}">
					<div class="col-lg-12"
						style="text-align: center; padding-bottom: 10px; margin: 10px 0;" 
						id="uic_chartButtons_${componentId}">
						
						<c:forEach items="${buttonLst}" var="button"
							varStatus="buttonLoop">
							 <c:choose>
					        	<c:when test="${button.displayFlag eq false }">
									<c:set var="buttonStyle" value="display:none;" />
								</c:when>
								<c:otherwise>
									<c:set var="buttonStyle" value="" />
								</c:otherwise> 
							</c:choose> 
							<button type="${button.buttonType}"
								class="btn btn-primary UicBtnRightMargin ${button.buttonCSS}"
								id="uicButton_${button.uniqueButtonId}"
								style="${buttonStyle}" ${button.eventDataStr}>
								<c:out value="${button.buttonLabel}" />
							</button>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</c:forEach>
	</c:if>
</body>
</html>