<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<table class="table newTable fancyTable datatable-new" id="myTable">
					<thead>
						<tr>
							<th width="1%" bgcolor="#6dbcbf">
							<!--  <input type="checkbox" name="headerPoIdCheckBox" id="headerPoIdCheckBox" value="" onclick="checkUncheckFilingIds();" > -->
						    </th>
							<th>Transaction ID</th>
							<th>Case ID</th>
							<th>Creation Date</th>
							<th>Company</th>
							<th>Stmt Period</th>
							<th>Stmt Month&Year</th>
							<th>Source</th>
							<th>Document Status</th>
							<th>Download Status</th>
							<th>Locked By</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="transactionIdTemp" scope="session" value="${0}"/>
						<c:forEach items="${workQueueList}" var="workQueueObj" varStatus="loop">
						<tr>
						  <c:choose>
						   <c:when test="${workQueueObj.transactionId ne transactionIdTemp}">
						   <td align="center"><input type="checkbox" id="transactionIdCheckBox" name="transactionIdCheckBox" value="${workQueueObj.transactionId}"/></td>
						   <td>${workQueueObj.transactionId}</td>
						   </c:when>
						   <c:otherwise>
						   <td></td>
						   <td></td>
						   </c:otherwise>
						   	</c:choose>
							<td>${workQueueObj.filingId}</td>
							<td>${workQueueObj.createDate}</td>
							<td>${workQueueObj.industryName}</td>
							<td>${workQueueObj.wqPeriod}</td>
							<td>${workQueueObj.wqMonthYear}</td>
							<td>${workQueueObj.wqParserDescription}</td>
							<td>${workQueueObj.wqStatus}</td>
							<c:choose>
						   <c:when test="${workQueueObj.transactionId ne transactionIdTemp}">
						   <c:choose>
						   <c:when test="${workQueueObj.downloadStatus eq 'Doc Creation Completed'}">
						   <td><a href="javascript:void(0)" onclick="downloadExcelAndXmlDocument(${workQueueObj.transactionId});">${workQueueObj.downloadStatus}</a></td>
						   </c:when>
						   <c:otherwise>
						   <td>${workQueueObj.downloadStatus}</td>
						   </c:otherwise>
						   </c:choose>
						   </c:when>
						   <c:otherwise>
						   <td></td>
						   </c:otherwise>
						   </c:choose>
							<td>${workQueueObj.lockedBy}</td>
							</tr>
						<c:set var="transactionIdTemp" scope="session" value="${workQueueObj.transactionId}"/>
						</c:forEach>
					</tbody>
				</table>
					






