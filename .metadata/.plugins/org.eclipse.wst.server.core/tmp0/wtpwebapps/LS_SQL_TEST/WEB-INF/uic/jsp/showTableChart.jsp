<%@ include file="/WEB-INF/uic/jsp/taglib.jsp"%>
<c:set var="graphPosition" value="${graphPosition}" />
<c:choose>
    <c:when test="${graphPosition=='left'}">
        <c:set var="containerStyle" value="width: 100%;" />
        <c:set var="graphStyle" value="float: left; width: ${graphRatio}%;" />
        <c:set var="tableStyle" value="float: right; width: ${tableRatio}%;" />
    </c:when>
    <c:when test="${graphPosition=='right'}">
        <c:set var="containerStyle" value="width: 100%;" />
        <c:set var="graphStyle" value="float: right; width: ${graphRatio}%;" />
        <c:set var="tableStyle" value="float: left; width:${tableRatio}%;" />
    </c:when>
    <c:when test="${graphPosition=='top'}">
        <c:set var="containerStyle" value="" />
        <c:set var="graphStyle" value="width: ${graphRatio}%;position: absolute;top: 0px;height:50%;" />
        <c:set var="tableStyle" value="width: ${tableRatio}%;position:absolute;bottom: -90px;height:50%" />
    </c:when>
    <c:otherwise>
        <c:set var="containerStyle" value="" />
        <c:set var="graphStyle" value="width: ${graphRatio}%;position: absolute;bottom: 0px;height:50%; margin-bottom: -190px;" />
        <c:set var="tableStyle" value="width: ${tableRatio}%;position:absolute;top: 0px;height:50%" />
    </c:otherwise>
</c:choose>
<div style="${containerStyle};" class="row-fluid">
    <div style="${tableStyle}"  class="col-lg-6">
        <jsp:include page="tableContainer.jsp">
            <jsp:param value="${tableObj}" name="tableId" />
        </jsp:include>
    </div>
    <div style="${graphStyle};background:white; height: auto;" class="col-lg-6">
        <jsp:include page="highCharts.jsp" />
    </div>
</div>
