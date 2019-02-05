<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/commonCSS/custom-style.css?value=${applicationScope['version']}" type="text/css">
    <link rel="stylesheet" href="css/commonCSS/normalization-template-media-query.css" type="text/css">
	<link rel="stylesheet" href="js/jquery/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="css/darktooltip.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/bootstrap-select.css" type="text/css" media="all">
    <link rel="stylesheet" type="text/css" href="js/tostr/toastr.css"/>
	<link rel="stylesheet" type="text/css" href="js/choosen/chosen.css" />
	<link rel="stylesheet" type="text/css" href="css/appCSS/${applicationScope['cssType']}/normalization_template_${applicationScope['cssType']}.css?value=${applicationScope['version']}" />
	<link rel="stylesheet" type="text/css" href="js/jquery/smoothness/jquery-ui.custom.css" />
	
<!-- 	<script src="js/tostr/jquery.alerts.js" type="text/javascript"></script>
	<link href="js/tostr/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" /> -->

	<script src="js/jquery/smoothness/jquery-ui.js"></script>
    <script src="js/jquery.darktooltip.js"></script>
	<script src="js/jGrowl/jquery.jgrowl.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/choosen/chosen.jquery.js"></script>
    <script src="js/tostr/toastr.js"></script>
<link rel="stylesheet" href="css/jquery-confirm.min.css">
<script src="js/jquery-confirm.min.js" ></script>

<script src="js/common.js?value=${applicationScope['version']}"></script>
	<script type="text/javascript" src="js/appjs/normalizationTemplate.js?value=${applicationScope['version']}"></script>
	<script>
	 function importExcelTemplate() {
		 $("#uploadErrors").html("");
	     $('#ImportModal').modal('show');
	  };

	 
	$(function() {
		 $('.msgIndustry').removeClass('msgBg');
		 $('.dropdwn').chosen({no_results_text: "<button class='btn btn-primary'>Add New Industry Type</button>"});
		 $('.chosen-container').on('click','button',function(){
			 var textVal=$(".chosen-search").find("input").val();
			 industryType(textVal);	
	   });
		 
		 $(".selectpicker").selectpicker();
		    $(".bootstrap-select").click(function () {
		         $(this).addClass("open");
		    });	 
	
	$('[data-toggle="tooltip"]').tooltip()
	$('#Incomestatement').on('change',function(){	
		var dropdownvalue = $('#Incomestatement').val();
		var tableid = $('.tablecontainer').find("table#"+dropdownvalue).attr("id");
		var selectedoption = $("#Incomestatement option:selected").text();
		if (tableid==null){
			var subSectionHtmlString="";
			if(dropdownvalue == 'IS' || dropdownvalue == 'BS' || dropdownvalue == 'CF'){
				var parametersDynamic='sectionName='+ encodeURIComponent(dropdownvalue);
				var url='getSubSectionList.htm';
				$.ajaxSetup({
					cache: true
				});
				$.ajax({
					type: "POST",  
					url: url,
					data:parametersDynamic,
					cache: true,
					dataType : "html",
					success: function(data)
					{	
						var responseObj = JSON.parse(data);
				 		var subSectonListCount =responseObj["subSectonListCount"];
				 		var jsonObj =responseObj["subSectonListStr"];
				 		var subSectonListArray= JSON.parse(jsonObj);
				 		subSectonListCount=parseInt(subSectonListCount);
				 		console.log("subSectonListCount "+subSectonListCount);
				 		if(subSectonListCount>0){
				 			subSectionHtmlString="<select name='subSectionDropDown' id='subSectionDropDown' style='font-size:11px; padding:2px 0 3px 0'>";
							//subSectionHtmlString=subSectionHtmlString+"<option value='' style='font-size:11px; padding:2px 0 3px 0'>Select</option>";
							var subSectioObj;
							for(var i=0;i<subSectonListArray.length;i++){
								subSectioObj=subSectonListArray[i];
								subSectionHtmlString=subSectionHtmlString+"<option value='"+subSectioObj.subSectionName+"' style='font-size:11px; padding:2px 0 3px 0'>"+subSectioObj.subSectionName+"</option>";
							}
							subSectionHtmlString=subSectionHtmlString+"</select>";
				 		}
				 		prepareTemplateTable(selectedoption,subSectionHtmlString,dropdownvalue);
				 		$(".subbtn").show();
						$('.removeTable').click(function(event) {  //on click 
					    	var tableidchk = $(this).val();
					        if(this.checked) { // check select status
					            $('#'+tableidchk).find(".addtable").each(function() { //loop through each checkbox
					                this.checked = true;  //select all checkboxes with class "checkbox1"               
					            });
					        }else{
					        	$('#'+tableidchk).find(".addtable").each(function() { //loop through each checkbox
					                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
					            });         
					        }
					    });
						$(".tb1 tbody tr:odd").css("background-color", "#f4f4f4");
						$(".tb1 tbody tr:even").css("background-color", "#ffffff");
							var value = 10;
						$(".tb1 tbody tr:visible td.norlable").each(function () {
							$(this).text(value);
							value = value +10;
							});
				 		
					},
					error: function(data){
						console.log("data error "+data);
					}
				 	
				});
			}else{
				prepareTemplateTable(selectedoption,subSectionHtmlString,dropdownvalue);
				
				$(".subbtn").show();
				$('.removeTable').click(function(event) {  //on click 
			    	var tableidchk = $(this).val();
			        if(this.checked) { // check select status
			            $('#'+tableidchk).find(".addtable").each(function() { //loop through each checkbox
			                this.checked = true;  //select all checkboxes with class "checkbox1"               
			            });
			        }else{
			        	$('#'+tableidchk).find(".addtable").each(function() { //loop through each checkbox
			                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
			            });         
			        }
			    });
				$(".tb1 tbody tr:odd").css("background-color", "#f4f4f4");
				$(".tb1 tbody tr:even").css("background-color", "#ffffff");
					var value = 10;
				$(".tb1 tbody tr:visible td.norlable").each(function () {
					$(this).text(value);
					value = value +10;
					});
			}
			
			
			
		}else{
			$.alert("Already added.");
		}
    });
	function prepareTemplateTable(selectedoption,subSectionHtmlString,dropdownvalue){
		var tbodyString="";
		//"<td align='center' valign='middle'><input type='text'  name ='subSectionDropDown' style='width:96%; padding:2px 0 2px 5px; font-size:11px' value=''/></td>"+
		var subsectionTdString="";
		var subsectionHeaderString="";
		if(subSectionHtmlString!=''){
			subsectionTdString=subsectionTdString+"<td align='center' valign='middle'>"+subSectionHtmlString+"</td>";
			subsectionHeaderString=subsectionHeaderString+"<td width='12%' class='tbl-head' valign='middle' ><strong>Sub Section</strong></td>";
		}
		for(var i=10;i<=100;i=i+10){
			tbodyString=tbodyString+"<tr>"+
			"<td><input type='checkbox' class='addtable'  value='"+selectedoption+"'/></td>"+
			"<td align='center' valign='middle' style='font-size:11px'>"+selectedoption+"</td>"+subsectionTdString+
			"<td align='center' class='norlable' style='font-size:11px'>"+i+"</td>"+
			"<td align='center' valign='middle'><input type='text'  name ='NormalizedLabel' style='width:96%; padding:2px 0 2px 5px; font-size:11px' onkeyup='spcharacters(this);'/></td>"+
			"<td align='center' valign='middle'>"+
			"<select name='derived' style='font-size:11px; padding:2px 0 3px 0' onchange='derivedToggle(this);'>"+
			"<option value='1' style='font-size:11px; padding:2px 0 3px 0'>Primary</option>"+
			"<option value='3' style='font-size:11px; padding:2px 0 3px 0'>Derived</option>"+
			"<option value='2' style='font-size:11px; padding:2px 0 3px 0'>Heading</option>"+
			"</select>"+
			"</td>"+
			"<td id='subtotal' align='center'></td>"+
			"<td>"+
			"<div style='width:100%;' class='ui-widget' style='font-size:11px'>"+
			"</div>"+
			"</td>"+
			"</tr>";
		}
		$(".tablecontainer").append("<table id='"+dropdownvalue+"' class='tb1 newtable table-bordered' cellspacing='1' cellpadding='5' border='0' bgcolor='#ebebeb' width='100%' style='margin-bottom:10px;'>"+
		"<thead>"+
		"<tr class='throw'>"+
		"<td width='2%' class='tbl-head'><input type='checkbox' class='removeTable' value='"+dropdownvalue+"' /></td>"+
		"<td width='18%' class='tbl-head' align='middle' valign='middle' ><strong>Financial Section</strong></td>"+subsectionHeaderString+
		"<td width='10%' nowrap='wrap' class='tbl-head' align='center' valign='middle' ><strong>Normalized Label ID</strong></td>"+
		"<td width='18%' class='tbl-head' align='center' valign='middle' ><strong>Normalized Label</strong></td>"+
		"<td width='10%' align='center' class='tbl-head' valign='middle' ><strong>Category</strong></td>"+
		"<td width='7%' nowrap='wrap' align='center' class='tbl-head' valign='middle' ><strong>Normalization QA Checks</strong></td>"+
		"<td width='22%' class='tbl-head' align='center' valign='middle'><strong>Derived Fields Formula</strong></td>"+
		"</tr>"+
		"</thead>"+
		"<tbody>"+tbodyString+"</tbody>"+
		"<tfoot>"+
		"<tr style='background:#fff;'>"+
		"<td colspan='8' align='right'>"+
		"<button class='btn btn-primary' style='margin:5px; width:80px; line-height:15px; padding:8px 0 9px 0px !important' onclick='submitform(this);' id='btn_complete'>Complete</button>"+
		"</td>"+
		"</tr>"+
		"</tfoot>"+
		"</table>");
	}
	
 /************** Delete Row Function *****************/	
	$(".btn_delete2").on("click",function(){
		var checkedcount = $(".addtable:checked").length;
		var checkrmvtbl = $('.removeTable:checked').length;
		
		
		if(checkrmvtbl > 0){
			$('.removeTable').each(function () {
				if (this.checked) {
					var tableid = $(this).closest("table").attr("id");	
				    $("#"+tableid).remove();
				}
			});
			
		}
		var tablecount = $('.tablecontainer').find("table").length;
		if(tablecount == 0){
			$('.subbtn').hide();
		}
		if (checkedcount > 0){
		$('.addtable').each(function () {
		   if (this.checked) {
		   var tableid = $(this).val();
		   $(this).closest("tr").hide();		   
		   
			var value = 10;
			$(".tb1 tbody tr:visible td.norlable").each(function () {
				$(this).text(value);
				value = value +10;
			});
		   $(this).attr('checked', false); // Unchecks it
		   $(".tb1 tbody tr:visible:odd").css("background-color", "#f4f4f4");
		   $(".tb1 tbody tr:visible:even").css("background-color", "#ffffff");
	   	   }
		 });
		}
		
		var value = 10;
		$(".tb1 tbody tr:visible td.norlable").each(function () {
			$(this).text(value);
			value = value +10;
		});
		
	   });
 
	 /************** undo Row Function *****************/	
	   
	   $(".btn_undo").on("click",function(){
		var numOfVisibleRows = $('.tb1 tr').filter(function() {
		  return $(this).css('display') == 'none';
		}).each(function () {
			$(this).css('display', 'table-row');
			
		});
		var value = 10;
		$(".tb1 tbody tr:visible td.norlable").each(function () {
			$(this).text(value);
			value = value +10;
		});
		$(".tb1 tbody tr:visible:odd").css("background-color", "#f4f4f4");
		$(".tb1 tbody tr:visible:even").css("background-color", "#ffffff");
	   });
	   
	   /************** Add Row Function *****************/ 
	   
	$(".btn_Add").on("click",function(){
		var checkedcount = $(".addtable:checked").length;
		var subSectionHtmlString="";
		var sectionName="";
		var dropDownVal="";
		var tableid;
		var parametersDynamic="";
		var url="";
		var responseObj;
 		var subSectonListCount;
 		var jsonObj;
 		var subSectonListArray;
 		var subSectioObj;
 		var $trObj;
 		var $trSubsection;
		if (checkedcount > 0){
			$('.addtable').each(function () {
			   if (this.checked) {
				   tableid = $(this).val();
				   $trObj =$(this);
				   console.log("tableid "+tableid);
				   subSectionHtmlString="";
					sectionName=tableid;
					dropDownVal="";
					if($.trim(sectionName) == 'Income Statement' || $.trim(sectionName) == 'Balance Sheet' || $.trim(sectionName) == 'Cash Flow Statement'){
						if($.trim(sectionName) == 'Income Statement'){
							dropDownVal="IS";
						}else if($.trim(sectionName) == 'Balance Sheet'){
							dropDownVal="BS";
						}else{
							dropDownVal="CF";
						}
						trSubsection=$trObj.closest("tr");
						subSectionHtmlString="<select name='subSectionDropDown' id='subSectionDropDown' style='font-size:11px; padding:2px 0 3px 0'>";
						//subSectionHtmlString=subSectionHtmlString+"<option value='' style='font-size:11px; padding:2px 0 3px 0'>Select</option>";
						$trObj.closest("tr").find("#subSectionDropDown option").each(function () {
							console.log($(this).val());
							subSectionHtmlString=subSectionHtmlString+"<option value='"+$(this).val()+"' style='font-size:11px; padding:2px 0 3px 0'>"+$(this).val()+"</option>";
						});
						subSectionHtmlString=subSectionHtmlString+"</select>";
						if(subSectionHtmlString!=""){
							prepareRowForTable($trObj,tableid,subSectionHtmlString);
						}
						
						
					}else{
						console.log($trObj);
						prepareRowForTable($trObj,tableid,subSectionHtmlString);						 	
					}
			   }
			});
		} else{
			$.alert("Please select");
			}
	   });
		
		});	
		
	function prepareRowForTable($this,tableid,subSectionHtmlString){
		console.log($this);
		var subSectionTdString="";
		if(subSectionHtmlString!=""){
			subSectionTdString=subSectionTdString+"<td align='center' valign='middle' class='odd'>"+subSectionHtmlString+"</td>";
		}
		$this.closest("tr").after("<tr>"+
				"<td><input class='addtable' type='checkbox' value='"+tableid+"' /></td>"+
				"<td align='center' valign='middle' style='font-size:11px'>"+tableid+"</td>"+subSectionTdString+
				"<td align='center' class='norlable' style='font-size:11px'>20</td>"+
				"<td align='center' valign='middle' class='odd'><input type='text' name ='NormalizedLabel'  style='width:96%; font-size:11px; padding:2px 0 2px 5px;' onkeyup='spcharacters(this);'/></td>"+
				"<td align='center' valign='middle' class='odd'>"+
				"<select name='derived' style='font-size:11px; padding:2px 0 3px 0'>"+
				"<option value='1' style='font-size:11px; padding:2px 0 3px 0'>Primary</option>"+
				"<option value='3' style='font-size:11px; padding:2px 0 3px 0'>Derived</option>"+
				"<option value='2' style='font-size:11px; padding:2px 0 3px 0'>Heading</option>"+
				"</select>"+
				"</td>"+
				"<td id='subtotal' align='center'></td>"+
				"<td class='odd'>"+
				"<div style='width:100%; font-size:11px' class='ui-widget'>"+
				"</div>"+
				"</td>"+
				"</tr>"); 
		
		var value = 10;
		$(".tb1 tbody tr:visible td.norlable").each(function () {
			$(this).text(value);
			value = value +10;
		});
		$this.attr('checked', false); // Unchecks it
		$('.removeTable').attr('checked', false); // Unchecks it
		$(".tb1 tbody tr:visible:odd").css("background-color", "#f4f4f4");
		$(".tb1 tbody tr:visible:even").css("background-color", "#ffffff");
	}
		
		function submitform(currentsub){
			var currenttable = $(currentsub).closest("table").attr("id");
			var j=20;
			$("#"+currenttable).find("select[name=derived]").each(function (i) {
			
				j++;
			i++;
			var htmltext = $(this).closest("tr").find(".ui-widget").html();
			var derivedvalue = $(this).val();
			if(htmltext=="" && derivedvalue==3){	
				
				$(this).closest("tr").find("#subtotal").append("<input type='checkbox' id='SubTotalCheckId' class='SubTotalCheck'  value='Sub Total'/>");
			$(this).closest("tr").find(".ui-widget").append("<div style='float:left; width:10%;'><img width='25' height='28' data-toggle='modal' class='imgbtns' data-target='#"+currenttable+"_"+j+"' onclick='showpopup(this, "+i+");' title='Formula' src='img/formula.png' style='cursor: pointer;'></div>"+
					"<div style='width:82%; float:right' class='formula-txtbox'><input class='tags'  id='"+currenttable+"signtext"+i+"' size='50' style='padding:5px 5px 8px 5px; width:97%; font:11px verdana, Geneva, sans-serif;'>"+
					"<input type='hidden' id='formula'>"+
					"</div>"+
					"<div class='modal fade' id='"+currenttable+"_"+j+"'>"+
					"  <div class='modal-dialog' style='width:35%;'>"+
					"   <div class='modal-content'>"+
					"    <div class='modal-header'>"+
					"     <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
					"    <h4 class='modal-title' style='color:#666;'>Derived Formula</h4>"+
					" </div>"+
					"<div class='modal-body'>"+
					" <table width='100%' class='table1' id='"+currenttable+"_1"+i+"' cellspacing='1' cellpadding='5' border='0' bgcolor='#ebebeb'>"+
					"<thead>"+
					"<tr>"+
					"<th bgcolor='#006995' style='color:#fff; font-size:11px; font-weight:bold; text-align:center; border-right:1px solid #fff;'>Normalized Label[ID]</th>"+
					"<th bgcolor='#006995' style='color:#fff; font-size:11px; font-weight:bold; text-align:center; border-right:1px solid #fff;'>Operator</th>"+
					"<th bgcolor='#006995' style='color:#fff; font-size:11px; font-weight:bold; text-align:center; border-right:1px solid #fff;'>Add</th>"+
					"<th bgcolor='#006995' style='color:#fff; font-size:11px; font-weight:bold; text-align:center; border-right:1px solid #fff;'>Delete</th>"+
					"</tr>"+
					"</thead>"+
					"<tr style='border-bottom:1px solid #fff'>"+
					"<td align='left' valign='middle' width='85%' style='border-right:1px solid #fff'>"+
					"<select class='popdropdown' style='font:11px verdana, Geneva, sans-serif; padding:3px 0 3px 0' id='number_"+i+"'>"+
					"</select>"+
					"</td>"+
					"<td align='left' valign='middle' width='5%' style='border-right:1px solid #fff'>"+
					"<select class='popupsign' style='font:11px verdana, Geneva, sans-serif; padding:3px 0 3px 0' id='sign"+i+"'>"+
					"<option value='' style='font:11px verdana, Geneva, sans-serif;'>Select</option>"+
					"<option value='+' style='font:11px verdana, Geneva, sans-serif;'>+</option>"+
					"<option value='-' style='font:11px verdana, Geneva, sans-serif;'>-</option>"+
					"<option value='/' style='font:11px verdana, Geneva, sans-serif;'>/</option>"+
					"<option value='*' style='font:11px verdana, Geneva, sans-serif;'>*</option>"+
					"</select>"+
					"</td>"+
					"<td align='center' valign='middle' width='5%' style='border-right:1px solid #fff'>"+
					"<img width='28' height='28' data-toggle='tooltip' class='imgbtns addButton' title='Add' src='images/add.png' style='cursor: pointer;'>"+
					"</td>"+
					"<td align='center' valign='middle' width='5%' style='border-right:1px solid #fff'>"+
					"<img width='28' height='28' data-toggle='tooltip' class='imgbtns btn_Delete delete' onclick='removpopuprow(this);' title='Delete' src='images/delete.png' style='cursor: pointer;'>"+
					"</td>"+
					"</tr>"+
					"</table>"+
					"</div>"+
					"<div class='modal-footer'>"+
					" <button type='button' class='btn btn-primary' onclick='savechanes("+i+", "+currenttable+","+j+");'>Save Changes</button>"+
					"</div>"+
					"</div>"+
					"</div>"+
					"</div>");	
			$(".tb1 tbody tr:visible:odd").css("background-color", "#f4f4f4");
			$(".tb1 tbody tr:visible:even").css("background-color", "#ffffff");			
					$("#"+currenttable+"_1"+i+"").on('click', '.addButton', function() {
					   var $tr = $(this).closest('tr');
					   var allTrs = $tr.closest('table').find('tr');
					   var lastTr = allTrs[allTrs.length-1];
					   var $clone = $(lastTr).clone();
					   $clone.find('td').each(function(){
					       var el = $(this).find(':first-child');
					       var id = el.attr('id') || null;
					       if(id) {
					           var i = id.substr(id.length-1);
					           var prefix = id.substr(0, (id.length-1));
					           el.attr('id', prefix+(+i+1));
					           el.attr('name', prefix+(+i+1));
					       }
					   });
			        $clone.find('input:text').val('');
			        $tr.closest('table').append($clone);
					$('[data-toggle="tooltip"]').tooltip()
					$('.tooltip').hide();
					});
						$("[data-toggle='tooltip']").tooltip()					
								}else{
						
							}
						});
						$("#"+currenttable).find("input[name=NormalizedLabel]").each(function () {
							if($(this).val()==""){
								$(this).closest("tr").remove();	
								var value = 10;
									$(".tb1 tbody tr:visible td.norlable").each(function () {
										$(this).text(value);
										value = value +10;
									});
							   $(".tb1 tbody tr:visible:odd").css("background-color", "#f4f4f4");
								$(".tb1 tbody tr:visible:even").css("background-color", "#ffffff");
							}
						});
					
			
		}
		
		function removpopuprow(selectedrow){
		var removerow = $(selectedrow).closest("tr");
		$(removerow).remove();
		
		}
		
		function showpopup(tablevalue, count){
			var tableid = $(tablevalue).closest("table").attr("id");
			$("#"+tableid).find('.popdropdown').html("");
			var dropdownNum = $("#"+tableid).find('.popdropdown');
			var inputval = $("#"+tableid+"signtext"+count).parent().find("#formula").val();
/* console.log("showpopup : "+inputval); */
			var userInputs = $.trim(inputval).split("^");userInputs.push("");
/* console.log("userInputs "+userInputs.join("-")); */
			var tableRow = null;
			var rowCount = 0;
		
			$("#"+tableid).find("input[name=NormalizedLabel]:visible").each(function (index, inputText) {
				var valueta = $(inputText).val();
				var Normalizedlbl = $(this).closest("tr").find(".norlable").text();	
				//$("#select option:last").after($('<option value="1">my option</option>'));
				$("#"+tableid).find('.popdropdown').append("<option value='"+$.trim(valueta)+" ["+Normalizedlbl+"]'>"+$.trim(valueta)+" ["+Normalizedlbl+"]</option>");
			});
			$("#"+tableid).find('.popdropdown').prepend("<option value=''>Select</option>");

			for(var i=0,j=userInputs.length; i<=j; i++) {

				tableRow = $("#"+tableid+"_1"+count+" > tbody").children("tr")[rowCount];				
				$("td:eq(0) > select:first-child", tableRow).val($.trim(userInputs[i]));
				$("td:eq(1) > select:first-child", tableRow).val($.trim(userInputs[i+1]));
				i++;
				rowCount++;
			}
		}
		
		function savechanes(count,currenttableid,j){	
	
		var finalVal ='';
		var cnt = 0;
		var trcount = $("#"+currenttableid.id+"_1"+count+" tr").length - 1;
	/* 	  for (var i = 0; i < trcount; i++) {
	      var nLabel=	$("#number_"+trcount).val();
           if(nLabel.trim()==""){
		    $.alert('Please select Normalization Label',"Alert");
		   return false;
	         }		
		 } */
		
		
		for (var i = 0; i < trcount; i++) {
			if($("#"+currenttableid.id+"_1"+count+" tr:eq("+i+")").find('.popupsign').val()==''){
				$.alert('Please select operation sign.');
				return false;
			}else{
				cnt++;
			}
		}
		
			if(cnt == trcount){
				var val1;
				var val2;
				var hiddenFormula = "";

				$("#"+currenttableid.id+"_1"+count).find('tbody tr:visible').each(function (i, el) {
			        var $tdfirst = $(this).find('.popdropdown');
			        var $tdthird = $(this).find('.popupsign');
			        val1 = $tdfirst.val();
			        val2 = $tdthird.val();
			        finalVal  = finalVal+" "+$.trim(val1)+" "+$.trim(val2);
			        hiddenFormula = hiddenFormula+"^"+$.trim(val1)+"^"+$.trim(val2);
				});

				finalVal = finalVal.substring(0,finalVal.length - 1);
				hiddenFormula = hiddenFormula.substring(1,hiddenFormula.length-1);

				if($("#"+currenttableid.id+"_1"+count+" tr").length==1){

					finalVal  = " "+val1;
					finalVal = finalVal.substring(0,finalVal.length - 0);
				}
              if(finalVal.trim()=="undefined"){
	             finalVal="";
               }
				$("#"+currenttableid.id+"signtext"+count).val(finalVal);
				$("#"+currenttableid.id+"signtext"+count).parent().find("#formula").val(hiddenFormula);
            /* console.log("hiddenFormula : "+hiddenFormula);		 */		
				$('#'+currenttableid.id+'_'+j).modal('hide');
			}
		}
		
/************** Derived Show and Hide Function *****************/
function derivedToggle(thisVal) {
	
	var widget = thisVal.value;
	if (widget == "3") {
		
		$(thisVal).closest("tr").find("#subtotal").show();
		$(thisVal).closest("tr").find(".ui-widget").show();
		 $(thisVal).closest("tr").find('input[class=tags]').val('');
	} else {
		$(thisVal).closest("tr").find("#subtotal").show();
		$(thisVal).closest("tr").find(".ui-widget").hide();
	     $(thisVal).closest("tr").find('input[class=tags]').val('undefined');
	}
}
		
/************** keyUp speacilal Characters "~]"  not allowed*****************/
		function spcharacters(thisVal) {
			var yourInput = thisVal.value;
			var re = /[[\~\]]/gi;
			var isSplChar = re.test(yourInput);
			if (isSplChar)
			{
				var no_spl_char = yourInput.replace(re, '');
				$(thisVal).val(no_spl_char);
			}
		}
		/************** onchange Industryval*****************/	
  function exisingType(){
	     $("#exportToExcel").removeAttr('disabled');
	     var test= $("#industryType option:selected").text();  
	     $("#msgIndustry").html("'"+test+"'"+" Template already exists, to create a new template please use a different name. Click on 'Export' button to view the existing template for " + test);
		 $('.msgIndustry').addClass('msgBg');
			/* toastr["error"]("Industry type already exists", "Industry type"); */
		}
	

/************** submit Template *****************/
		function savetableid() {
			var isEmpty = false;
			var checkFarmula = false;
			var industryTypeVal = $("#industryType option:selected").text();
			var fsTd1 = [];
			var nldTd2 = [];
			var nlTd3 = [];
			var derived4 = [];
			var formula5 = [];
			var subTotalArray =[];
			var subTotalCheck="";
			var subSectionArray=[];
			var subSection="";
			var $tds="";
			var $tdthird="";
			var $tdfourth="";
			var $tdfive="";
			var subSectionIsEmpty=false;
			$(".tablecontainer").find("table").each(
					function() {
						$(this).find('tbody tr:visible').each(
								function(i, el) {
									$tds = $(this).find('td');
									$tdthird = $(this).find('input[name=NormalizedLabel]');
									$tdfourth = $(this).find('select[name=derived]');
									 $tdfive = $(this).find('input[class=tags]');
									subSection = $(this).find('select[name=subSectionDropDown]').val();
									console.log("subSection "+subSection);
									if( $(this).find(
										'input[class=SubTotalCheck]').is(':checked')){
										subTotalArray.push("checked");
									}else{
										subTotalArray.push("unchecked");
										
									}
									
									fs1 = $tds.eq(1).text();
									if(subSection!=undefined && subSection!="undefined" && subSection!=""){
										nld2 = $tds.eq(3).text();
									}else{
										subSection="-";
										nld2 = $tds.eq(2).text();
									}
									
									nl3 = $tdthird.val();
									catagery = $tdfourth.val();
									formula = $tdfive.val();
									if ((nl3.trim()) == "undefined"
											|| (nl3.trim()) == "") {
										isEmpty = true;
										return false;
									}
									
									if ((catagery.trim() == 3) && (formula.trim() == "" || formula .trim() == "undefined")) {
										// $.alert("nld2"+nld2);
										checkFarmula = true;
										
										return false;
									} else {
										fsTd1.push(fs1);
										nldTd2.push(nld2);
										nlTd3.push(nl3);
										derived4.push(catagery);
										formula5.push("+"+formula);
										subSectionArray.push(subSection);
									}
								});
					});
			if (isEmpty) {
				fsTd1 = [];
				nldTd2 = [];
				nlTd3 = [];
				derived4 = [];
				formula5 = [];
				subTotalArray =[];
				subSectionArray=[];
				$.alert("Normalized Label should not be empty");
				toastr["error"]("Normalized Label should not be empty",
						"Industry type");
				return false;
			}
			if (checkFarmula) {
				
				fsTd1 = [];
				nldTd2 = [];
				nlTd3 = [];
				derived4 = [];
				formula5 = [];
				subTotalArray =[];
				subSectionArray=[];
				$.alert("  Formula should not be empty for Label ID:  " + "'"
						+ nld2 + "'");
				toastr["error"]("Formula should not be empty for Label ID: "
						+ "'" + nld2 + "'", "Industry Type");
				return false;
			} else {
				if ((fsTd1.length == 0) && (nldTd2.length == 0)
						&& (nlTd3.length == 0) ) {
					$.alert("No rows added", "Alert");
					toastr["error"]("No rows added", "Industry Type");
					return false;
				} else {
					insertData(fsTd1, nldTd2, nlTd3, derived4, formula5,industryTypeVal,subTotalArray,subSectionArray);
				}

			}

		}
	</script>
<style>
body{overflow:hidden !important}
.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default{color: #fff; background-color:transparent !important; border-color: transparent !important;}
</style>
<!--  open modal window statred  -->
<div id="ImportModal" class="modal fade" role="dialog" style="padding-top:100px !important;">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Import Normalization Template</h4>
      </div>
      <div class="modal-body">
       <div>
	       <table style="width: 100%;">
		       <tr>
		       <td width="50%"><input type="file" name="importNormalizationTemp" id="importNormalizationTemp" style="color:#000000 !important; width:100%" ></td>
		       <td align="center"><a href="javascript:void(0)" onclick="setLocationHref('downloadNormalizationTemplate.htm?templateType=normLabel')"> Normalization_Template.xls</a></td>
		       </tr>
	       </table>
   		</div>    
    	
    	<div id="uploadErrors" style="height: 50PX;"></div>
      </div>
      <div class="modal-footer">
      	<button class="btn btn-primary" style="margin-bottom:0px; width:80px; line-height:15px; padding:5px 0 10px 0px" onclick="uploadNormTemplate(this);" id='btn_upload'>Upload</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!--  open modal window Ended  -->

<div class="container-fluid mar-top80 rmDiv">
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading text-center">Normalization Template</div>
				<div class="panel-body lt-panel">
					<div class="account">
						<p>Please enter the Template Name</p>
						<p>Verify the Template availability</p>
						<p>Select the financial section from the dropdown</p>
						<p>Insert the Normalized Labels</p>
						<p>Select the category for the inserted normalized labels</p>
						<p>If the category selected is 'Derived', user can insert the required derived formula</p>
						<p>Submit template once the required financial sections are defined</p>
					</div>
				</div>
			</div>
		</div><!--- col-md-3 -->
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body custom-padding" style="padding:4px;">
						<div class="row">
							<div class="col-md-12">
								<span class="pull-left mar-lt10 mar-rt5"><label class="pad-top6">Template Name</label></span>
								<span class="pull-left mar-rt5">
									<select  class="dropdwn" data-placeholder="Add Normalization Template" onchange="exisingType();" style="padding:4px; margin:0 0 0 5px; font-size:11px;" id="industryType">
								       <c:if test="${not empty nilIndustryList}">
								         <option value="0"></option>
								         <c:forEach items="${nilIndustryList}" var="industryLabel">
								     	 <option value="${industryLabel.key}">${industryLabel.value}</option>
								     	</c:forEach>
								 	    </c:if>
								 	     <c:if test="${empty nilIndustryList}">
								         <option value="0">Not Available</option>
								 	     </c:if> 
									 </select>
								</span>
								
								
								
								
								<span id="msgIndustry" class="msgIndustry pull-left mar-lt10 mar-rt5"></span>
								
								<span class="pull-left mar-rt5 income-statement">
									<select class="form-control" id="Incomestatement" disabled="disabled">
					                	<option value="Select" style="display:none;" selected disabled>Financial Section</option>
					                     <c:forEach var="entry" items="${sectionMap}">
					                     	<option value="<c:out value='${entry.key}'/>" ><c:out value="${entry.value}"/></option>
					                   </c:forEach>
					                </select>
								</span>
								<span class="pull-right">
									<a href="JavaScript:void('0');" data-toggle="tooltip" data-placement="top" title="Export Existing Normalization Template"   id="exportToExcel" onclick="generateExacel();" ><i class="glyphicon glyphicon-export custom-font pad5 cus-cls mar-rt5"></i></a>
									<a href="JavaScript:void('0');" data-toggle="tooltip" data-placement="top"  title="Import Normalization Template"  id=""><i class="glyphicon glyphicon-import custom-font pad5 cus-cls mar-rt5" onclick="importExcelTemplate()"></i></a>
									<a href="JavaScript:void('0');" class="btn_Add" data-toggle="tooltip" data-placement="top"  title="Add"><i class="fa fa-plus custom-font pad5 cus-cls mar-rt5"></i></a>
									<a href="JavaScript:void('0');" onclick="calRefresh();" data-toggle="tooltip" data-placement="top"  title="Refresh"><i class="fa fa-refresh custom-font pad5 cus-cls mar-rt5"></i></a>
									<a href="JavaScript:void('0');" class="btn_delete2" data-toggle="tooltip" data-placement="top" title="Remove" data-original-title="Delete"><i class="fa fa-trash custom-font pad5 cus-cls mar-rt5"></i></a>
									<a href="JavaScript:void('0');" data-toggle="tooltip" data-placement="top" class="btn_undo" title="Undo Delete"><i class="fa fa-undo custom-font pad5 cus-cls"></i></a>
								</span>
							</div>
						</div><!-- row -->
					</div><!-- panel-body -->	
				</div><!--- panel-default -->
				<div class="clearfix"></div>
							<div class="tablecontainer" style="height:400px; overflow:auto"></div> <div class="subbtn" style="display:none; text-align:center; margin-top:10px"><button class="btn btn-danger btn-tmp" onclick="savetableid();">Submit Template</button></div>
			</div>
			</div><!-- row -->
		</div><!-- col-md-9 -->	
	</div><!-- row -->
</div><!-- container-fluid -->	
 <footer style="position:fixed; bottom:0px;">
	<div class="footer_wpr main-doc-width"><jsp:include page="footer.jsp" ></jsp:include></div>
</footer> 
<!-- <script src="js/bootstrap.min.js"></script> -->
<!--  <script src="assets/js/docs.min.js"></script> -->