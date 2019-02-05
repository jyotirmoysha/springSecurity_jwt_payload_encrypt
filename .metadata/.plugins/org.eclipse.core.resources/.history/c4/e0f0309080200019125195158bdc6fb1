<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>

<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/style_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<link rel="stylesheet" type="text/css" href="js/jquery/smoothness/jquery-ui.custom.css" />
<script src="js/tableHeadFixer.js"></script>
<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
<script src="js/jquery.darktooltip.js"></script>
<script src="js/jquery/smoothness/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/normalization_view_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<link rel="stylesheet" type="text/css" href="css/commonCSS/normalization_view.css?value=${applicationScope['version']}" />
<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/media-query_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
<script src="js/appjs/normalization_view.js?value=${applicationScope['version']}"></script>	
<script type="text/javascript">var contextPath="${pageContext.request.contextPath}";</script>
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>
<style>
.pad-rt5{padding-right:5px;}
.accordion-toggle:after {
    font-family: 'Glyphicons Halflings';  
    content: "\e081";  
    float: left;
    color:#fff; 
    margin-top:-2px;         
}

.accordion-toggle.collapsed:after {
    content: "\e082"; 
    margin-top:-2px;  
}
.form-control{ height:32px !important; border-radius:3px !important; padding:2px 12px; font-size:13px;  font-family:open sans;}
#noteContent{top:88px !important;}
.txtBold td{font-weight: bold !important;}
.tblstyle td.sectionheadRatio{background:#3bc8e2; color: #fff !important; font-size: 14px !important;}
.custom-ft{font-size:14px; color:#fff}
 

/* #myTable tbody tr td:nth-of-type(4){border-right:1px solid #ff0000 !important} */
</style>
<c:if test='${isClientData eq true }'>
<script>
var position="${ClientDataHeadColCounter}";
$('#myTable thead tr th:nth-last-child('+position+')').css('border-left', '2px solid #f04b5d');
$('#myTable tbody tr td:nth-last-child('+position+')').css('border-left', '2px solid #f04b5d');
</script>
</c:if>	
<jsp:include page="common/appheader.jsp" >
			<jsp:param name="pageNo" value="7"/>   
	 		<jsp:param value="${fillingId}" name="caseId"/>
     	    <jsp:param value="${customerId}" name="customerId"/>
            <jsp:param value="${customerName}" name="customerName"/>
            <jsp:param value="${businessName}" name="bussinessName"/>
            <jsp:param value="${compIdOrCik}" name="compIdOrCik"/>
            <jsp:param value="${decryptedCompIdOrCik}" name="decryptedCompIdOrCik"/>
            <jsp:param value="${decryptedFillingId}" name="decryptedFillingId"/>
            <jsp:param value="${decryptedCustomerName}" name="decryptedCustomerName"/>
            <jsp:param value="${wqId}" name="wqId"/>    
           	 <jsp:param value="${encriptedWqEId}" name="encriptedWqEId" /> 
</jsp:include>
	
<div class="container-fluid mar-top57 rmDiv">
<div class="row">
            <input type="hidden" id="caseId" value="${fillingId}">
            <input type="hidden" id="wqId" value="${wqId}">
            <input type="hidden" id="customerId" value="${customerId}">
            <input type="hidden" name="userGroupName" id="userGroupName" value="${userGroupName}"/>
            <input type="hidden" id="downloadControllerName" value="${downloadControllerName}">
       <div id="PDFLoadingMsg" class="msg-pdf-load"></div>
		<div class="col-md-12"><h4 id="datahead" class="font16 mar-top8 mar-rt5">Normalized View</h4></div>
		<div class="col-md-12 mar-negi4">
			<div class="panel panel-default">
			<div class="panel-body custom-padding">
				<div class="row" style="margin-right:-18px !important">
				<div class="col-md-12">
					<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top6">Status</label></span>
					<span class="pull-left mar-rt5" style="padding:6px; color:#00aecf; font-weight:bold"> ${currentStatus}</span>
					<c:set var="filing_id" value="${fillingId}"/>
					 <span class="pull-right">
					 <span  id="tbl" class="pull-left btn-group btn-group-filter-main  mar-rt5">
						<button type="button" class="btn btn-primary dropdown-toggle btn-filter" data-toggle="dropdown">
						<span class="glyphicon glyphicon-filter" style="font-size:18px"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
						<li data-filter-field="name"><a href="javascript:void(0)"><label class="lbl-normal"><input type="checkbox" class="clsChkData" id="chkdata" checked="checked" value="" style="margin:0px 5px 0 0"  />Data Available</label></a></li>
						<li data-filter-field="price"><a href="javascript:void(0)"><label class="lbl-normal"><input type="checkbox" class="clsChkData" id="chkNodata"  checked="checked" value="" style="margin:0px 5px 0 0" />No Data Available</label></a></li>
						</ul>
					</span>
					<span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" onClick="submitCase('<c:out value="${wqId}"/>', '<c:out value="${fillingId}"/>', '<c:out value="${customerId}"/>', '<c:out value="${customerName}"/>');" value="Submit Case" /></span>
					  <c:if test="${xmlFlag eq 'Y'}">
					<span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" onClick="generateXMLDocument('xml', '<c:out value="${fillingId}"/>');" value="Generate XML" /></span>	    
					 </c:if>
					 <c:if test="${xbrlFlag eq 'Y'}">
						<span class="pull-left mar-rt5"><input type="button" class="btn btn-primary" onClick="generateXBRLDocument('<c:out value="${fillingId}"/>');" value="Generate XBRL" /></span>
					</c:if>	    
				 <span class="pull-left">
					<select id="exportdropdown" class="btn btn-default" onchange="normalizedViewExportToExcel('<c:out value="${wqId}"/>', '<c:out value="${fillingId}"/>', '<c:out value="${customerId}"/>', '<c:out value="${customerName}"/>', '<c:out value="${businessName}"/>', '<c:out value="${fileName}"/>', '<c:out value="${compIdOrCik}"/>','<c:out value="${column}"/>');">
					   <option value="">Select File Type</option>
				     <c:if test="${xmlFlag eq 'Y'}">
					   <option value="XML">XML</option>
					   </c:if>
					   <option value="Excel">Excel</option>
					    <c:if test="${csvFlag eq 'Y'}">
					   <option value="CSV">CSV</option>
					   </c:if>
					    <c:if test="${xbrlFlag eq 'Y'}">
					   <option value="XBRL">XBRL</option>
					   </c:if>
					 
					 </select>
					   </span>
				</span> 
				</div>
			</div>
			</div><!--- panel-body -->
			</div><!--- panel-default -->
			</div>
			<div class="mar-top-negi16">
				<div class="col-md-12">
							<div id="finStatement" class="financeTable" class="fin-tbl" style="margin-top:-10px">
	    	<table id="myTable" class="tblstyle datatable-new datatable-new" width="100%" cellspacing="0" cellpadding="5" border="0" style="margin:-5px 0 0 0">
	    		<c:choose>
	    			<c:when test="${ empty mapOfHeaders['Statement Date']}">
	    				<div style="border:2px solid #ccc; padding:4px">No data available.</div>
	    			</c:when>
	    			<c:otherwise>
	    			<thead>
	    				<c:forEach items="${mapOfHeaders}" var="entry">
	    					<tr>
							      	<c:choose>
	    							<c:when test="${column eq 'N'}">
	    					        	<th class="leftalign" colspan="0" style="z-index:1"> <c:out value="${entry.key}"/></th> 
	    							</c:when>
	    							<c:otherwise>
	    						    	<th class="leftalign" colspan="2" style="z-index:1"> <c:out value="${entry.key}"/></th> 
	    							</c:otherwise>
	    					        </c:choose>

							    <c:set var="listOfHeaders" value="${entry.value}"/>
							    <c:forEach items="${listOfHeaders}" var="headerValue">
							    <c:choose>
							    <c:when test="${entry.key eq 'Source Type'}">
							    <th style="z-index:1;"> <c:out value="${headerValue}"/></th>
							    </c:when>
							    <c:otherwise>
							    <th style="z-index:1"> <c:out value="${headerValue}"/></th>
							    </c:otherwise>
							    </c:choose> 		
							    </c:forEach>
							    
							</tr>
						</c:forEach>
						
						<c:set value="0" var="valueColCounter" scope = "session" />
						<c:if test="${not empty dataTableHeaders}">
								<tr>
								<c:forEach items="${dataTableHeaders}" var="dataTableHeaderVal">
									<c:choose>
										<c:when test="${dataTableHeaderVal eq 'Account Number'}">
											<c:if test="${column eq 'Y'}">
							                  	<th class="${column}" style="z-index:1" > <c:out value="${dataTableHeaderVal}"/></th>
							                 </c:if> 	
										</c:when>
										<c:when test="${dataTableHeaderVal eq 'Normalized Label'}">
											<th style="width:380px; z-index:1"> <c:out value="${dataTableHeaderVal}"/></th> 	
										</c:when>
										<c:otherwise>
										<th> <c:out value="${dataTableHeaderVal}"/></th> 	
										<c:set value="${valueColCounter+1}" var="valueColCounter" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</tr>
							</c:if>
						</thead>
				    	<tbody>
				    	<c:forEach items="${listOfNormalzedLabelsDetails}" var="NormalzedLabelsDetails" varStatus="status">
								<tr id="collapse${NormalzedLabelsDetails.key}TRId" class="header expand ${NormalzedLabelsDetails.key}" sectionNameTr="${NormalzedLabelsDetails.key}">
									<c:choose>
									<c:when test="${column eq 'N'}">
									<td class="sectionhead" colspan="0">
                                  <a style="color:#fff" data-toggle="collapse" class="toggleCustomClass" id="collapse${NormalzedLabelsDetails.key}Id" data-toggle="collapse" data-target="${NormalzedLabelsDetails.key}" href="#collapse${NormalzedLabelsDetails.key}" >
                                        <i class="fa fa-minus-circle custom-ft" style="padding:0 5px 0 0;"></i><c:out value="${sectionDisplayHeaderMap[NormalzedLabelsDetails.key]}"/>
									</a>
									</td>
									</c:when>
									<c:otherwise>
									<td class="sectionhead" colspan="0">
								  <a style="color:#fff" data-toggle="collapse" id="collapse${NormalzedLabelsDetails.key}Id" data-toggle="collapse" data-target="${NormalzedLabelsDetails.key}" href="#collapse${NormalzedLabelsDetails.key}">
                                        <i class="fa fa-minus-circle custom-ft" style="padding:0 5px 0 0;"></i><c:out value="${sectionDisplayHeaderMap[NormalzedLabelsDetails.key]}"/>
									</a>
									</td>
									</c:otherwise>
									</c:choose>
									
									
								</tr>
								
								<c:set var="listOfNormalisedLabelAndValues" value="${NormalzedLabelsDetails.value}"/>
								<c:forEach items="${listOfNormalisedLabelAndValues}" var="normLabel" varStatus="status">
									<c:set var="normLabelValues" value="${normLabel.list}"/>
									 <c:set var="manualRowClass" value="showData"/> 
									<c:choose>
									<c:when test="${normLabel.header eq 'A'}">
									<c:set var="manualRowClass" value="head-txt"/>
									</c:when>
									<c:otherwise>
									
						    		<c:set var="listContentCount" value="0"/>
						    		<c:forEach items="${normLabel.list}" var="normLabelValuesObj">
						    		<c:if test="${normLabelValuesObj != null && not empty normLabelValuesObj}">
						    		 <c:set var="listContentCount" value="${listContentCount + 1}" scope="page"/> 
						    		</c:if> 
						    		</c:forEach>
									<c:if test="${listContentCount eq 0}">
									<c:set var="manualRowClass" value="noData"/>
									</c:if>
								   </c:otherwise>
									</c:choose> 
									<tr class="panel-collapse in poRow collapse${NormalzedLabelsDetails.key}  ${manualRowClass}">
									<c:if test="${column eq 'Y'}">
									<td width="130px" class="${column}">${normLabel.accountId}</td>
									</c:if>
									
										<c:choose>
											<c:when test="${normLabel.header eq 'A'}">
												<td class="subheadtd boldHeader" title="${normLabel.accountDisplayLongDs}">${normLabel.labelHierarchy}<c:out value="${normLabel.label}"/></td>	
												<c:forEach items="${normLabelValues}" var="labelDetails" varStatus="status">
												<c:choose>
												
													<c:when test="${labelDetails.isRefPoId == 'Y'}">
													
														<c:choose>
															<c:when test="${labelDetails.isMultiRefPoId == 'Y'}">
															
																<c:choose>
																<c:when test="${labelDetails.isValueMatch == 'Y'}">
																	<td class="numbers valueMatch"><a href="javaScript:void('0');" onclick="openChildElements('${labelDetails.nivId}')">${labelDetails.value}</a></td>
																</c:when>
																<c:otherwise>
																	<td class="numbers valueNotMatch"><a href="javaScript:void('0');" onclick="openChildElements('${labelDetails.nivId}')">${labelDetails.value}</a></td>																
																</c:otherwise>
																</c:choose>

															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${labelDetails.clickbackExists == 'Y'}">
																	
																	<c:choose>
																	<c:when test="${labelDetails.isValueMatch == 'Y'}">
																		<td class="numbers valueMatch"><a href="#" onclick="showClickBack('${fillingId}','${labelDetails.poId}','${labelDetails.coordinates}')"> ${labelDetails.value}</a></td>
																	</c:when>
																	<c:otherwise>
																			<td class="numbers valueNotMatch"><a href="#" onclick="showClickBack('${fillingId}','${labelDetails.poId}','${labelDetails.coordinates}')"> ${labelDetails.value}</a></td>																	
																	</c:otherwise>
																	</c:choose>
																	

																	</c:when>
																	<c:otherwise>
																	<td class="numbers">
																	 <c:choose>
																	  <c:when test="${labelDetails.category eq 'Y'}">
																	 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${normLabel.templateId}','${normLabel.ni_item}','${labelDetails.arsId}','${fillingId}','${labelDetails.value}','<c:out value="${normLabel.label}"/>');"><c:out value="${labelDetails.value}" /> </a>
																	 </c:when>
																	 <c:otherwise>
																	 <c:out value="${labelDetails.value}" />
																	 </c:otherwise>
																	 </c:choose>
																	 </td>
																	</c:otherwise>
																</c:choose>
																
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
																	<td class="numbers">
																	 <c:choose>
																	  <c:when test="${labelDetails.category eq 'Y'}">
																	 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${normLabel.templateId}','${normLabel.ni_item}','${labelDetails.arsId}','${fillingId}','${labelDetails.value}','<c:out value="${normLabel.label}"/>');"><c:out value="${labelDetails.value}" /> </a>
																	 </c:when>
																	 <c:otherwise>
																	 <c:out value="${labelDetails.value}" />
																	 </c:otherwise>
																	 </c:choose>
																	 </td>

													</c:otherwise>
													</c:choose>
													
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:choose>
												<c:when test="${normLabel.displayFormat eq 'B'}">
												<td class="boldtd italicTextLable" title="${normLabel.accountDisplayLongDs}">${normLabel.labelHierarchy}<c:out value="${normLabel.label}"/></td>	
												<c:set var="normLabelValues" value="${normLabel.list}"/>
												<c:forEach items="${normLabelValues}" var="labelDetails" varStatus="status">
												<c:choose>
													<c:when test="${labelDetails.isRefPoId == 'Y'}">
														<c:choose>
															<c:when test="${labelDetails.isMultiRefPoId == 'Y'}">
															
																<c:choose>
																<c:when test="${labelDetails.isValueMatch == 'Y'}">
																	<td class="numbers valueMatch"><a href="javaScript:void('0');" onclick="openChildElements('${labelDetails.nivId}')"><c:out value="${labelDetails.value}" /></a></td>
																</c:when>
																<c:otherwise>
																	<td class="numbers valueNotMatch"><a href="javaScript:void('0');" onclick="openChildElements('${labelDetails.nivId}')"><c:out value="${labelDetails.value}" /></a></td>																
																</c:otherwise>
																</c:choose>

															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${labelDetails.clickbackExists == 'Y'}">
																	
																	<c:choose>
																	<c:when test="${labelDetails.isValueMatch == 'Y'}">
																		<td class="numbers valueMatch"><a href="#" onclick="showClickBack('${fillingId}','${labelDetails.poId}','${labelDetails.coordinates}')"> <c:out value="${labelDetails.value}" /></a></td>
																	</c:when>
																	<c:otherwise>
																			<td class="numbers valueNotMatch"><a href="#" onclick="showClickBack('${fillingId}','${labelDetails.poId}','${labelDetails.coordinates}')"> <c:out value="${labelDetails.value}" /></a></td>																	
																	</c:otherwise>
																	</c:choose>
																	

																	</c:when>
																	<c:otherwise>
																<td class="numbers">
																	 <c:choose>
																	  <c:when test="${labelDetails.category eq 'Y'}">
																	 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${normLabel.templateId}','${normLabel.ni_item}','${labelDetails.arsId}','${fillingId}','${labelDetails.value}',');"><c:out value="${labelDetails.value}" /> </a>
																	 </c:when>
																	 <c:otherwise>
																	 <c:out value="${labelDetails.value}" />
																	 </c:otherwise>
																	 </c:choose>
																	</td>

																	</c:otherwise>
																</c:choose>
																
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
																<td class="numbers">
																	 <c:choose>
																	  <c:when test="${labelDetails.category eq 'Y'}">
																	 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${normLabel.templateId}','${normLabel.ni_item}','${labelDetails.arsId}','${fillingId}','${labelDetails.value}','<c:out value="${normLabel.label}"/>');"><c:out value="${labelDetails.value}" /> </a>
																	 </c:when>
																	 <c:otherwise>
																	 <c:out value="${labelDetails.value}" />
																	 </c:otherwise>
																	 </c:choose>
																	</td>
													</c:otherwise>
													</c:choose>
													
												</c:forEach>
											</c:when>
													<c:otherwise>
												
												<c:set var="normLabelValues" value="${normLabel.list}"/>
												<c:choose>
													<c:when test="${fn:length(normLabelValues) gt 0}">
														<td title="${normLabel.accountDisplayLongDs}">${normLabel.labelHierarchy}${normLabel.label}</td>
														<c:forEach items="${normLabelValues}" var="labelDetails" varStatus="status">
															<c:choose>
																<c:when test="${labelDetails.isRefPoId == 'Y'}">
																	<c:choose>
																		<c:when test="${labelDetails.isMultiRefPoId == 'Y'}">
																			
																			<c:choose>
																			<c:when test="${labelDetails.isValueMatch == 'Y'}">
																				<td class="numbers valueMatch"><a href="javaScript:void('0');" onclick="openChildElements('${labelDetails.nivId}')"><c:out value="${labelDetails.value}" /></a></td>
																			</c:when>
																			<c:otherwise>
																				<td class="numbers valueNotMatch"><a href="javaScript:void('0');" onclick="openChildElements('${labelDetails.nivId}')"><c:out value="${labelDetails.value}" /></a></td>																			
																			</c:otherwise>
																			</c:choose>
																		
																		</c:when>
																		<c:otherwise>
																			<c:choose>
																				<c:when test="${labelDetails.clickbackExists == 'Y'}">
																				<c:choose>
																				<c:when test="${labelDetails.isValueMatch == 'Y'}">
																						<td class="numbers valueMatch"><a href="#" onclick="showClickBack('${fillingId}','${labelDetails.poId}','${labelDetails.coordinates}')"><c:out value="${labelDetails.value}" /></a></td>
																				</c:when>
																				<c:otherwise>
																						<td class="numbers valueNotMatch"><a href="#" onclick="showClickBack('${fillingId}','${labelDetails.poId}','${labelDetails.coordinates}')"><c:out value="${labelDetails.value}" /></a></td>													
																				</c:otherwise>
																				</c:choose>
																				</c:when>
																				<c:otherwise>
																<td class="numbers">
																	 <c:choose>
																	  <c:when test="${labelDetails.category eq 'Y'}">
																	 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${normLabel.templateId}','${normLabel.ni_item}','${labelDetails.arsId}','${fillingId}','${labelDetails.value}','<c:out value="${normLabel.label}"/>');"><c:out value="${labelDetails.value}" /> </a>
																	 </c:when>
																	 <c:otherwise>
																	 <c:out value="${labelDetails.value}" />
																	 </c:otherwise>
																	 </c:choose>
																	</td>
																				</c:otherwise>
																			</c:choose>
																			
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																<td class="numbers">
																	 <c:choose>
																	  <c:when test="${labelDetails.category eq 'Y'}">
																	 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${normLabel.templateId}','${normLabel.ni_item}','${labelDetails.arsId}','${fillingId}','${labelDetails.value}','<c:out value="${normLabel.label}"/>');"><c:out value="${labelDetails.value}" /> </a>
																	 </c:when>
																	 <c:otherwise>
																	 <c:out value="${labelDetails.value}" />
																	 </c:otherwise>
																	 </c:choose>
																	</td>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<td title="${normLabel.accountDisplayLongDs}">${normLabel.labelHierarchy}${normLabel.label}</td>
														<c:forEach items="${normLabelValues}" var="labelDetails" varStatus="status">
															<td class="numbers"><c:out value="${labelDetails.value}"/></td>
															<c:choose>
																<c:when test="${labelDetails.isRefPoId == 'Y'}">
																	<c:choose>
																		<c:when test="${labelDetails.isMultiRefPoId == 'Y'}">
																			
																			<c:choose>
																				<c:when test="${labelDetails.isValueMatch == 'Y'}">
																						<td class="numbers valueMatch"><a href="javaScript:void('0');" onclick="openChildElements('${labelDetails.nivId}')"><c:out value="${labelDetails.value}" /></a></td>
																				</c:when>
																				<c:otherwise>
																						<td class="numbers valueNotMatch"><a href="javaScript:void('0');" onclick="openChildElements('${labelDetails.nivId}')"><c:out value="${labelDetails.value}" /></a></td>													
																				</c:otherwise>
																				</c:choose>
																		</c:when>
																		<c:otherwise>
																			<c:choose>
																				<c:when test="${labelDetails.clickbackExists == 'Y'}">
																				<c:choose>
																				<c:when test="${labelDetails.isValueMatch == 'Y'}">
																						<td class="numbers valueMatch"><a href="#" onclick="showClickBack('${fillingId}','${labelDetails.poId}','${labelDetails.coordinates}')"><c:out value="${labelDetails.value}" /></a></td>
																				</c:when>
																				<c:otherwise>
																						<td class="numbers valueNotMatch"><a href="#" onclick="showClickBack('${fillingId}','${labelDetails.poId}','${labelDetails.coordinates}')"><c:out value="${labelDetails.value}" /></a></td>													
																				</c:otherwise>
																				</c:choose>
																					
																				</c:when>
																				<c:otherwise>
																				<td class="numbers">
																					 <c:choose>
																					  <c:when test="${labelDetails.category eq 'Y'}">
																					 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${normLabel.templateId}','${normLabel.ni_item}','${labelDetails.arsId}','${fillingId}','${labelDetails.value}','<c:out value="${normLabel.label}"/>');"><c:out value="${labelDetails.value}" /> </a>
																					 </c:when>
																					 <c:otherwise>
																					 <c:out value="${labelDetails.value}" />
																					 </c:otherwise>
																					 </c:choose>
																					</td>
																				</c:otherwise>
																			</c:choose>
																			
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td class="numbers">
																	 <c:choose>
																	  <c:when test="${labelDetails.category eq 'Y'}">
																	 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${normLabel.templateId}','${normLabel.ni_item}','${labelDetails.arsId}','${fillingId}','${labelDetails.value}','<c:out value="${normLabel.label}"/>');"><c:out value="${labelDetails.value}" /> </a>
																	 </c:when>
																	 <c:otherwise>
																	 <c:out value="${labelDetails.value}" />
																	 </c:otherwise>
																	 </c:choose>
																	</td>

																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</c:otherwise>	
												</c:choose>
											</c:otherwise>
										</c:choose>
									</tr>		
								</c:forEach>
				    	</c:forEach>
				    	<!-- **start Ratio Calcluation -->
				    	<c:if test="${not empty ratioCalcultaionMap}">
						<tr id="Rationcalc" class="header expand Ratio panel-collapse">
							<%-- <c:set var="ratioCalColspanCount" value="0"></c:set>
							<c:if test="${column eq 'Y'}">
								<c:set var="ratioCalColspanCount" value="2"></c:set>			
							</c:if>		 --%>
							<td class="sectionhead" colspan="0">
							<a style="color:#fff" class="pad-rt5" data-toggle="collapse" data-toggle="collapse" data-toggle="collapse" href="#">
                                        <i class="fa fa-minus-circle custom-ft" style="padding:0 5px 0 0"></i> Financial Ratios</a>
							</td>
							
							  <c:forEach begin="1" end="${valueColCounter}" varStatus="loop">
    							<td class="sectionhead">&nbsp;</td>
							 </c:forEach>
							</tr>	
					
					   </c:if>
						<c:forEach items="${ratioCalcultaionMap}" var="ratioCalcultaionMap">
						<c:set var="collapseSectionId" value="${fn:replace(ratioCalcultaionMap.key,' ', '')}" />
						<tr class="header expand hiddenRow">
						
							<td class="sectionheadRatio">
							 <a style="color:#fff" data-toggle="collapse" data-toggle="collapse" href="#collapse${collapseSectionId}" href="#collapse${NormalzedLabelsDetails.key}" style="padding:0 5px 0 0;">
                                <i class="fa fa-plus-circle custom-ft" style="padding:0 5px 0 0"></i>${ratioCalcultaionMap.key}
							</a>
							</td>
							<td class="${column} sectionheadRatio">&nbsp;</td>
							 <c:forEach begin="1" end="${valueColCounter}" varStatus="loop">
    							<td class="sectionheadRatio">&nbsp;</td>
							 </c:forEach>
						</tr>
						
						
				 <c:set var="ratioCalcultaionList" value="${ratioCalcultaionMap.value}"></c:set>
                  <c:forEach items="${ratioCalcultaionList}" var="ratioCalcultaionObj">
						<tr class="${collapseSectionId} panel-collapse RatioHidden" style="display: none;">
							<td class="${column}">${ratioCalcultaionObj.accountId}</td>
							<td><c:out value="${ratioCalcultaionObj.label}"/></td>
							<c:set var="ratioCalcultaionValuesList" value="${ratioCalcultaionObj.list}"/>
							<c:forEach items="${ratioCalcultaionValuesList}" var="ratioCalcultaionValues">
						  <td class="numbers" align="right">
						  <c:choose>
						  <c:when test="${ratioCalcultaionValues.category eq 'Y' && ratioCalcultaionValues.value ne '-' }">
						 <a href="#" data-toggle="modal"  onclick="showFormulaCalcPopUp('${ratioCalcultaionObj.templateId}','${ratioCalcultaionObj.ni_item}','${ratioCalcultaionValues.arsId}','${fillingId}','${ratioCalcultaionValues.value}','${ratioCalcultaionObj.label}');">
						 <c:out value="${ratioCalcultaionValues.value}" /> </a>
						 </c:when>
						 <c:otherwise>
						 <c:out value="${ratioCalcultaionValues.value}" />
						 </c:otherwise>
						 </c:choose>
						  </td>
						</c:forEach>
						</tr>
					</c:forEach>
				</c:forEach>
				<!-- **End Ratio Calcluation -->
				
						</tbody>
	    			</c:otherwise>
	    		</c:choose>
	    	</table>
	    	</div>
		<div id="data-div-1"></div>
				</div>
			</div>	
		</div><!-- row -->
	</div><!-- container-fluid -->	
 <footer>
	<div class="footer_wpr main-doc-width"> <jsp:include page="footer.jsp" ></jsp:include></div>
</footer> 
<script src="assets/js/docs.min.js"></script>
<div id="text-file-data"></div> 

 <c:set var="nonEnglishLabelFlag" value="${nonEnglishLabelFlag}"/>

<div id="modalRatio" class="modal fade" role="dialog" >
  <div class="modal-dialog modal-lg" style="margin-top:96px !important">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="margin-top:9px !important">&times;</button>
        <span class="col-md-2" style="color:#fff; font-size:14px;">Formula</span>
      </div>
      <div class="modal-body" style="padding:5px 20px 20px 20px" >
      	<div style="max-height:300px; overflow:hidden">
		 <div class="col-md-12" style="padding:5px; border:1px solid #ccc; background:#fafafa; margin:0 0 4px 0">
		 	<div  style="color:#444; font-size:11px; font-weight:bold;" id="FormulaSpanId"></div>
		 </div>
		 </div>
		 <div style="max-height:300px; overflow:auto">
		<table width="100%" border="0" cellspacing="1" cellpadding="5"  style="margin-top:-1px;" id="formulaChildPopUpTableId" class="tblstyle1 fancyTable tblstyle datatable-new">
		 <thead>
		 <tr>
			 <th width="85%" align="left" class="blue-th" id="poIndex"><strong>Normalized Label</strong></th>
			 <th width="15%" align="center" class="blue-th" id="asRepLabel"><strong>Values</strong></th>
		  </tr>
		  </thead>
		  <tbody>
		  </tbody>
		  </table>
		 </div> 
		 <div  style="overflow: hidden; margin-top:-10px; padding:0px;" id="parentNormLableNameDiv">
		 <table class="table table-bordered" id="parentNormLableTbl">
		 	<tr>
		 		<td style="font-weight:bold !important; width:85.2%" id="parentNormLableName"></td>
		 		<td align="right" style="font-weight:bold !important; padding:0 10px 0 0 !important" id="calctotalId"></td>
		 	</tr>
		 </table>
		 </div>  	
      </div>
    </div>
  </div>
</div>

<div id="normalizationchild" class="modal fade" role="dialog" >
  <div class="modal-dialog modal-lg" style="margin-top:34px !important">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Normalized Details</h4>
      </div>
      <div class="modal-body">
 <div style="max-height:300px; overflow:hidden">
<table width="100%" border="0" cellspacing="1" cellpadding="5"  style="margin-top:-1px; border-spacing:1px;" bgcolor="#ebebeb" id="normChildTable" class="tblstyle1 fancyTable tblstyle datatable-new">
 <thead>
 <tr class="throw">
 <c:choose>
 	<c:when test="${nonEnglishLabelFlag == 'Y'}">
 		 <th width="12%" align="center" class="blue-th" id="poIndex"><strong>PO Index</strong></th>
		 <th width="18%" align="center" class="blue-th" id="asRepLabel"><strong>As Reported Label</strong></th>
		 <th width="18%" align="center" class="blue-th" id="asRepLabel"><strong>Non English Label</strong></th>
		 <th width="16%" align="center" class="blue-th" id="section"><strong>Section</strong></th>
		 <th width="18%" align="center" class="blue-th" id="niLabel" style="display: none;"><strong>Normalized Label</strong></th>
		 <th width="18%" align="center" class="blue-th" id="niValue"><strong>Value</strong></th>
 	</c:when>
 	<c:otherwise>
 	 	<th width="12%" align="center" class="blue-th" id="poIndex"><strong>PO Index</strong></th>
    	<th width="22%" align="center" class="blue-th" id="asRepLabel"><strong>As Reported Label</strong></th>
    	<th width="22%" align="center" class="blue-th" id="section"><strong>Section</strong></th>
    	<th width="22%" align="center" class="blue-th" id="niLabel" style="display: none;"><strong>Normalized Label</strong></th>
    	<th width="22%" align="center" class="blue-th" id="niValue"><strong>Value</strong></th>
 	</c:otherwise>
 </c:choose>
   
  </tr>
  </thead>
  <tbody>
  </tbody>
  </table>
    	</div>    	
    	<div id="uploadErrors" style="height: 50PX;"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<div id="Newpopup_tbl" class="modal fade" style="margin-top:40px;">
    <div class="modal-dialog" style="width:60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">SubmitCase</h4>
            </div>
            <div class="modal-body">
            	<div style="height:210px; overflow:auto">
              	<table id="myTable_popup" class="tblstyle datatable-new" width="100%" cellspacing="0" cellpadding="5" border="0" style="margin:-5px 0 0 0">
	    		<c:choose>
	    			<c:when test="${ empty mapOfHeaders['Statement Date']}">
	    				<tr>
	    					<td>No data available.</td>
	    				</tr>
	    			</c:when>
	    			<c:otherwise>
	    			<thead>
							<tr>
								<th colspan="5" style="font-weight:bold !important; line-height:30px !important; font-size:10px !important">Risk Weighted Assets Group</th>
							</tr>
						<c:if test="${not empty dataTableHeaders}">
								<tr>
								<c:forEach items="${dataTableHeaders}" var="dataTableHeaderVal">
									<c:choose>
										<c:when test="${dataTableHeaderVal eq 'Account Id'}">
											<th> <c:out value="${dataTableHeaderVal}"/></th> 	
										</c:when>
										<c:when test="${dataTableHeaderVal eq 'Normalized Label'}">
											<th style="width:60%;"> <c:out value="${dataTableHeaderVal}"/></th> 	
										</c:when>
										<c:otherwise>
										<th> <c:out value="${dataTableHeaderVal}"/></th> 	
										</c:otherwise>
									</c:choose>
									 
								</c:forEach>
								</tr>
							</c:if>
						</thead>
				    	
				    	<tbody>
				    	<c:forEach items="${listOfNormalzedLabelsDetails}" var="NormalzedLabelsDetails" varStatus="status">			
								<c:set var="listOfNormalisedLabelAndValues" value="${NormalzedLabelsDetails.value}"/>
								<c:forEach items="${listOfNormalisedLabelAndValues}" var="normLabel" varStatus="status">
									<tr class="poRow ${NormalzedLabelsDetails.key}">
									</tr>		
								</c:forEach>
				    	</c:forEach>
				    	</tbody>
	    			</c:otherwise>
	    		</c:choose>
	    	</table>
	    	</div>
	    	
	    	<div style="height:150px; overflow:auto; margin-top:10px" >
	    	<table id="myTable_popup1" class="tblstyle datatable-new" width="100%" cellspacing="0" cellpadding="5" border="0" style="margin:-5px 0 0 0">
	    		<c:choose>
	    			<c:when test="${ empty mapOfHeaders['Statement Date']}">
	    				<tr>
	    					<td>No data available.</td>
	    				</tr>
	    			</c:when>
	    			<c:otherwise>
	    			<thead>
							<tr>
								<th colspan="5" style="font-weight:bold !important; line-height:30px !important; font-size:10px !important">Problem Loans Group</th>
							</tr>
						<c:if test="${not empty dataTableHeaders}">
								<tr>
								<c:forEach items="${dataTableHeaders}" var="dataTableHeaderVal">
									<c:choose>
										<c:when test="${dataTableHeaderVal eq 'Account Id'}">
											<th> <c:out value="${dataTableHeaderVal}"/></th> 	
										</c:when>
										<c:when test="${dataTableHeaderVal eq 'Normalized Label'}">
											<th style="width:60%;"> <c:out value="${dataTableHeaderVal}"/></th> 	
										</c:when>
										<c:otherwise>
										<th> <c:out value="${dataTableHeaderVal}"/></th> 	
										</c:otherwise>
									</c:choose>
									 
								</c:forEach>
								</tr>
							</c:if>
						</thead>
				    	
				    	<tbody>
				    	<c:forEach items="${listOfNormalzedLabelsDetails}" var="NormalzedLabelsDetails" varStatus="status">			
								<c:set var="listOfNormalisedLabelAndValues" value="${NormalzedLabelsDetails.value}"/>
								<c:forEach items="${listOfNormalisedLabelAndValues}" var="normLabel" varStatus="status">
									<tr class="poRow ${NormalzedLabelsDetails.key}">
									</tr>		
								</c:forEach>
				    	
				    	</c:forEach>
				    	</tbody>
	    			</c:otherwise>
	    		</c:choose>
	    	</table>
	    	
               </div>
            </div>
            <div class="modal-footer">
                <button type="button" onClick="submitCase('<c:out value="${wqId}"/>', '<c:out value="${fillingId}"/>', '<c:out value="${customerId}"/>', '<c:out value="${customerName}"/>');" class="btn btn-primary" data-dismiss="modal">Submit</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div id="loadinglayer"></div>
<!-- below highperlink is used for other than PDF document -->
<a id = "otherDocument" href="" style="display: none" target="_blank" ></a>
