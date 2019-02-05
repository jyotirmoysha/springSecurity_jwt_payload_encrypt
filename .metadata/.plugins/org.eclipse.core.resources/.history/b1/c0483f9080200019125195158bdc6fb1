 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/appCSS/user_audit_report.css?value=${applicationScope['version']}" type="text/css">
<script type="text/javascript" src="js/appjs/user_audit_report.js?value=${applicationScope['version']}"></script>


<div style="width: 100%; margin: 10px 0 10px 0; text-align: center;">

	<iframe name="upload_iframe" src="" style="display: none;">
		<jsp:include page="importError.jsp"></jsp:include>
	</iframe>

	<form name='userauditTrailForm' id="userauditTrailForm" action="downloadUserAuditReport.htm" method="POST" target="upload_iframe">
		<div class="title-bg">User Audit Trail</div>
		<table width="100%" cellspacing="0" cellpadding="5" border="0"
			class="manageuserTable newTable" bgcolor="#fff">
			<tbody>
				<tr>
					<td colspan="2" style="border: 0px" align="left"><p
							style="color: #939393">
							Enter the Start Date and End Date to get the audit report for a
							particular period. You can also generate the report on the basis
							of filing ID. <br />
							<br />Click on download button to get the excel copy of the
							report.
						</p></td>
				</tr>

				<tr>
					<td width="10%" align="left" valign="middle" style="border: 0px">Start
						Date:</td>
					<td align="left" valign="middle" style="border: 0px">
					<input
						type="text" name="startDate" id="startDate1"
						style="width: 30% !important; padding: 2px !important"
						readonly="readonly"> 
						<script type="text/javascript">
							$("#startDate1").datepicker();
						</script></td>
				</tr>

				<tr>
					<td width="10%" align="left" valign="middle" style="border: 0px">End
						Date:</td>
					<td align="left" valign="middle" style="border: 0px">
					<input
						type="text" name="endDate" id="endDate1"
						style="width: 30% !important; padding: 2px !important"
						readonly="readonly"> 
						<script type="text/javascript">
							$("#endDate1").datepicker();
						</script></td>
				</tr>

				<tr>
					<td width="10%" align="left" valign="middle" style="border: 0px">User Id:</td>
					<td align="left" valign="middle" style="border: 0px">
					<select
						tabindex="2" id="userId" name="userId"
						class="form-control singleChosenReport"
						style="width: 271px; !important">
							<option value="">All</option>
							<c:forEach items="${userList}" var="userObj" varStatus="status">
								<option value="${userObj.userId}">${userObj.login}</option>
							</c:forEach>
					</select>

					</td>
				</tr>

				<tr>
					<td style="border: 0px">&nbsp;</td>
					<td style="border: 0px" align="left">
						<button type="button" class="btn btn-primary"
							onClick="submitAuditTrailForm()"
							style="padding: 5px 10px !important; margin: 10px 0 15px 0; border-radius: 0px !important">Download</button>
						<input type="button" onclick="clearDates();" name="clear"
						id="clear" value="Clear" class=" btn btn-primary"
						style="padding: 5px 10px !important; margin: 10px 0 15px 0;">
					</td>

				</tr>
			</tbody>
		</table>
	</form>
</div>



