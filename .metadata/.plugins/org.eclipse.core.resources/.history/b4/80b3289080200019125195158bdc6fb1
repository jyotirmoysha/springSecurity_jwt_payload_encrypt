<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
			<div class="content_wpr main-doc-width">
				<div class="DU-process-bar"> 
					<div class="process-steps process-1-steps-done"> <span class="done"> Authentication </span> </div>
					<div class="process-steps process-2-steps-done"> <span class="done"> File Upload </span> </div>
					<div class="process-steps process-3-steps-active"> <span class="active"> Confirmation </span> </div>
				</div>
				<div class="DU-content-wpr">
				<form  id="authinfoForm" method="POST" >
					<div class="DU-content-info-wpr">
						<h3 class="heading">Confirmation</h3>
						<div class="cnfrm-info">A case is created for the uploaded documents.
						<br/>Please click next to view it on the work queue page</div>
					</div>
					<div class="inpt-fld-wpr">
						<div class="cust_info_container">	
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td style="width:20%; font-weight:bold;">Customer Name: </td>
									<td style="width:80%"> <c:out value="${sessionScope.customerNamesession}" /> </span> </td>
								</tr>
								<tr>
									<td style="font-weight:bold;">Business Name: </td>
									<td><c:out value="${sessionScope.businessNamesession}" /></td>
								</tr>
							</table>
						</div>
						<br /><span class="txt-12"> Congratulations!</span> <br /> <br />
						<span class="txt-blck">Your given files have been successfully uploaded.</span>
					</div>
					<div class="clr"></div>
					<div class="btn-wpr">  <a href="workqueue.htm?tableIds=workQueue&userId=<c:out value='${user.userId}'/>&userGroupId=<c:out value='${user.userGroupId}'/>" class="button" >Next </a>  <!-- <a href="#" class="button" >Back </a> --></div>
					</form>
				</div>
				
				
			</div>
		</section>