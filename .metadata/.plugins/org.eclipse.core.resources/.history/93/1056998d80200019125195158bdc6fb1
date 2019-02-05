
   //set language Data 
	function getFileNames(language){
		    tableEdRulesEmpty();//empty table
			var  actionUrl = "getFileNamesByLanguage.htm";
			  var  processData="language="+language;
			  showLoading();
			  successData=function(data){
				  if(this.selectedIndex != 0){
				  $("#selfileName").removeAttr("disabled");
				  var fileNameObj = JSON.parse(data);
				  var fileNameArray =fileNameObj.fileList;
				  $('#selfileName').find('option').remove().end();
				  $('#selfileName') .append($('<option>', { value : '' }).text("Select"));
				  $.each(fileNameArray, function(i, val){
				  $('#selfileName').append($('<option>', { value : val }).text(val)); 
				  });
				  }
				  hideLoading();
		    }
		errorData = function(data) {
			 hideLoading();
			$.alert("Error in  FileNames");
		};
		callAjax(processData, successData, errorData, beforeSend, actionUrl,
				reqType, retDataType);
			
		}

	 //set TagNames Data 
	function calTagName(filename){
		tableEdRulesEmpty();
		$("#seltagName").empty();
		$('#seltagName') .append($('<option>', { value : '' }).text("Select"));
		$("#seltagName" ).prop("disabled", true );
        var  actionUrl = "getTagsByFileName.htm";
        var languageId=$('#selLanguage').val();
        var  processData="fileName="+filename+"&language="+languageId;
        showLoading();
	    successData = function(data) {
	    	try {
			if(this.selectedIndex != 0){
				var tagDetailsObj = JSON.parse(data);
				if(tagDetailsObj.isTagExists =='N')
					{
						$('#selectedTagId').val(tagDetailsObj.selectedTagId);
						$('#columnLengthId').val(tagDetailsObj.columnlength);
						  hideLoading();
						calPageNationExtraction();
					}
				else
					{
						$("#seltagName").removeAttr("disabled");
						$('#seltagName').find('option').remove().end();
						$('#seltagName') .append($('<option>', { value : '' }).text("Select"));
						$.each(tagDetailsObj.tagDetails , function( i, val ) {
						$('#seltagName').append($('<option>', { value : val.tagName,id : val.tagId, columnLength:val.columnCount }).text(val.tagName)); 
						}); 
						  hideLoading();
					}
			}	
		} catch (err) {
			console.log("Error Occured in TagNames" + err);
			  hideLoading();
		}
	}
	errorData = function(data) {
		$.alert("Problem occurred in TagNames");
	};
	callAjax(processData, successData, errorData, beforeSend, actionUrl,
			reqType, retDataType);
}
	
	//get PageNationData set To Table
	function calPageNationExtraction(){
		//var tagId=$("#seltagName option:selected").attr("id");
		var tagId =$('#selectedTagId').val();
		var columnLength = $('#columnLengthId').val(); 
		var pageNo=$("#pageNo").val();
	  	var searchText=$.trim($("#txtSearch").val());
		var dispalyRecords=$("#selRecords").val();
		var  actionUrl = "getRulesExtractionPagnation.htm";
		var  processData="tagId="+encodeURIComponent(tagId)+"&dispalyRecords="+encodeURIComponent(dispalyRecords)+"&pageNo="+encodeURIComponent(pageNo)+"&searchText="+encodeURIComponent(searchText);
		showLoading();
	    successData = function(data) {
		try {
		var metaData = JSON.parse(data);		
	   setDataToTable(metaData,columnLength);
	   paginationExtraction(metaData);
	   dispalyRecordsCountEr(metaData);
	   hideLoading();
		} catch (err) {
			console.log("Error Occured in paginationCode" + err);
			hideLoading();
		}
	}
	errorData = function(data) {
		$.alert("Problem occurred while getting the values in workQueue");
	};
	callAjax(processData, successData, errorData, beforeSend, actionUrl,
			reqType, retDataType);
		
	}
	
	
	function setDataToTable(metaData,columnLength){
	$('#extractionRulesId thead').empty();
	$('#extractionRulesId tbody').empty();
	var metaRowInfoCmd;
		var header='<th width="5%"><input type="checkbox" id="checkedAll" onclick="checkall();"/></th>'; 
		var i;
			var header='<th width="5%"><input type="checkbox" id="checkedAll" onclick="checkall();"/></th>';
			for(i=1;i<=columnLength;i++)
			{
				header = header+'<th>Value'+i+'</th>';
			} 
			$('#extractionRulesId thead').append(header); 
if(metaData.metaRowInfoData.length>0){
	for (var i = 0; i < metaData.metaRowInfoData.length; i++) {
		metaRowInfoCmd=metaData.metaRowInfoData[i];
		var inputs = '<tr  id="'+metaRowInfoCmd.metaDataId+'"  ondblclick="editRecord($(this))">';
		inputs += '<td align="center"><input name="delMeataId" class="checkSingle"  type="checkbox" /></td>';
	     var valuesData=metaRowInfoCmd.values; 
	    $.each(valuesData, function(index, columnValues) {
	    	 	inputs += '<td>'+columnValues+'</td>';
	    }); 
		$('#extractionRulesId tbody').append(inputs);
	}	
}else{
	$('#extractionRulesId thead').empty();
	$('#extractionRulesId tbody').append("<tr><td style='border:0px'>No Information Available</td></tr>");
}
	}

	   function recordlistData(){
		var records ='{"recordlist":["5","10","50"]}';
		var recordsObj = JSON.parse(records);
		var recordsArray =recordsObj.recordlist;
		$('#selRecords').find('option').remove().end();
		$.each(recordsArray, function(recordsdata, val){
		$('#selRecords').append($('<option>', { value : val }).text(val)); 
		});
		$('#selRecords').val('10');//default select records
		}

	function addMetaDataRow(){
    var columnLength = $("#columnLengthId").val();
	var addRow = "<td align='center'><input type='checkbox' class='checkSingle' name='delMeataId'/><input type='hidden' name='addRowId' value='addRow"+rowadd+"'/></td>";
	for(count=1;count<=columnLength;count++)
	{
	addRow = addRow+"<td><input type='text' name='addValue"+count+"' class='form-control'/></td>";
	}
	$('#extractionRulesId').prepend('<tr  class="addRowClass" id="addRow'+rowadd+'"></tr>');
	$('#addRow'+rowadd).html(addRow);
	rowadd++;
	}
	

	
	
	//Edit Rows set values
	function editRecord(selctedRow){
		if($(selctedRow).hasClass('updateRow'))
		{
		$(selctedRow).prev().show();
		$(selctedRow).remove();
		}
		else
		{
		inputs = '<tr id="clkRowid" class="updateRow" ondblclick="editRecord($(this))">';
		var selectedMetadatId = selctedRow.attr('id');
		inputs += '<td align="center"><input type="checkbox" class="checkSingle" name="updateMetadatId"/><input type="hidden" name="updateMetadatId" value="'+selectedMetadatId+'"/></td>'
		var count=0;
		$(selctedRow).each(function() {
		$.each(this.cells, function(){
		if(count>0)
		{
		var value = $(this).html();
		if(value==undefined)
		{
			value="";
		}
		inputs +=  '<td align="center"><input type="text" class="form-control" name="updValue'+count+'"  value="'+value+'"></td>';
		}
		count++;
		});
		});
		$(selctedRow).css("display", "none");
		$(selctedRow).after(inputs);
		}
		
		}
	
	//searchText 
	function searchRulesByText(){
	if (!$.trim($('#txtSearch').val())) {
	$.alert({
	title: 'Alert!',
	content: "Search Value can't be empty",
	});
	return false;
    }
	tableEdRulesEmpty();
	calPageNationExtraction();
	}
	
	//insert and update data by MetaDataIds
	function updateRulesExtraction(){
			var updateRecordsData = [];
			var newRecordData = [];
			var finalDataArray=[];
			$('#extractionRulesId .updateRow').each(function(){
			var tdCount=0;
			var key;
			var dataArray=[];
			$("td", this).each(function(){
			if(tdCount>0)
			{
				dataArray.push($(this).find("input[type=text],[type=hidden]").val());
			}
			else{
				key=$(this).find("input[type=text],[type=hidden]").val();
			}
			tdCount++;
			});
			updateRecordsData.push({
			metaDataId:key,
			values: dataArray
			});
			})

			$('#extractionRulesId .addRowClass').each(function(){
			var tdCount=0;
			var key;
			var dataArray=[];
			$("td", this).each(function(){
			if(tdCount>0)
			{
				dataArray.push($(this).find("input[type=text],[type=hidden]").val());
			}
			else{
				key=$(this).find("input[type=text],[type=hidden]").val();
			}
			tdCount++;
			});
			newRecordData.push({
			newMetaDataId:key,
			values: dataArray
			});
			})


			var language = $(selLanguage).find(":selected").val();
			var tagId = $('#selectedTagId').val();
			var metaRowInfo={};
			metaRowInfo["language"]=language;
			metaRowInfo["tagId"]=tagId;

			finalDataArray.push(
			{
			metaRowInfo:metaRowInfo,
			updateRecordsData:updateRecordsData,
			newRecordData:newRecordData
			}
			);
			console.log("finalDataArray  "+finalDataArray);
			if(finalDataArray.length>0){
			submitRulesForm(finalDataArray);
			}
			
	}
	
//update and new inserted Records
	function submitRulesForm(finalDataArray){
		 showLoading();

		 var myJsonString = JSON.stringify(finalDataArray); 
			$.ajaxSetup({
				cache: true
			});
		 $.ajax(
		            {
		                type: "POST",
		                url:   "update_extractionRules.htm",
		                data: myJsonString,
		                contentType: "application/json; charset=utf-8",
		                dataType : "html",
		                cache: true,
		                success: function (data)
		                {		                	
		            		$('.updateRow').remove();
		                	var fileNameObj = JSON.parse(data);
		  				    var updateRecordsData =fileNameObj.updateRecordsData;
		  				    var newRecordData =fileNameObj.newRecordData;
		  				  
		                	if(newRecordData.length > 0){
		                		tableEdRulesEmpty();
		                		calPageNationExtraction();
		                		//New data
			            	/*	$.each(newRecordData, function(index, data) {
			            		var inputs = '<tr id="'+data.metaDataId+'" ondblclick="editRecord($(this))">';
			            		inputs += '<td align="center"><input type="checkbox" name="chkrow"/></td>';
			            		$(data.values).each(function(index,value){
			            		inputs += '<td class="limit" title="'+value+'">'+value+'</td>';
			            		});
			            		inputs += '</tr>';

			            		$('#'+data.newMetaDataId).after(inputs);
			            		$('#'+data.newMetaDataId).remove();
			            		});*/
		                	}else{
		                		 //updatedData
			            		$.each(updateRecordsData, function(index, data) {
			            			var inputs = '<td align="center"><input type="checkbox" name="chkrow"/></td>';
			            			var dataValues=data.values;
			                		$(dataValues).each(function(index, val){	
			                		inputs += '<td class="limit" title="'+dataValues[index]+'">'+dataValues[index]+'</td>';
			                		});
			                		$('#'+data.metaDataId).empty();
			                		$('#'+data.metaDataId).html(inputs);
			                		$('#'+data.metaDataId).show();
			                		});
			            	
		                	}
		            		 hideLoading();	
		                },
		                error: function (data, status, er) {
		                	 hideLoading();
		                    $.alert("error: " + data + " status: " + status + " er:" + er);
		                }
		            });
}
	
	
	function deleteRulesExtraction(checkBoxName){	
		var checkElements = document.getElementsByName(checkBoxName);
		var meadaIds = [];
		if(checkCheckboxChecked(checkBoxName))
		{
		 for(var i=0; checkElements[i]; ++i)
		 {
			    if(checkElements[i].checked)
			       {
				  var $this = $(checkElements[i]);
				   //code strat  for delete parent child records deleting....
				   var trId = $this.parents('tr').attr('id'); 
				   var trCls = $this.parents('tr').attr('class'); 
					if(trCls!='' && trCls=='addRowClass'){
						$this.parents('tr').remove();
					}
				    if(trId!='' && /^[0-9]+$/.test(trId)){
					meadaIds.push(trId); 
				   }
			       }
		  }
		 
		 if(meadaIds.length>0){
			 $.confirm({
				    title: 'Confirm!',
				    content: 'Are you sure you want to delete the below selected records?',
				    buttons: {
				        confirm: function () {
							 $(".addRowClass").remove();
							deleteByMetaDataIds(meadaIds);
				        },
				        cancel: function () {
				        }
				    }
				});
			 
		 }
		}
		else
		{
			$.alert({
			    title: 'Alert!',
			    content: 'Select Row!',
			});
		 }
		
	}
	function checkCheckboxChecked(checkBoxName)
	{
		var len = $("[name='"+checkBoxName+"']:checked").length;
		if(len>0)
		return true;
		else 
		return false;
	}

	function deleteByMetaDataIds(meadaIds){
	var totalPageCount=	$("#totalPageCount").val();
	var dispalyRecords=$("#selRecords").val();
	var pageNo=$("#pageNo").val();
	var delMetaDataIds=[];
	if(meadaIds.length>0){
		showLoading();
	delMetaDataIds.push({deleteMetaDataIds :meadaIds})
	//cal delete  Ajax
	var jsonDeleteString = JSON.stringify(delMetaDataIds); 
	$.ajaxSetup({
		cache: true
	});
			$.ajax( {
	                type: "POST",
	                url:   "deleteByMetaDataIds.htm",
	                data: jsonDeleteString,
	                contentType: "application/json; charset=utf-8",
	                dataType : "html",
	                cache: true,
	                success: function (data)
	                {
	                	if(pageNo >0 && dispalyRecords > 0){
	                		$("#pageNo").val(pageNo);	
	                		calPageNationExtraction();
	                	} 
	                	hideLoading();	
	                },
	                error: function (data, status, er) {
	                    $.alert("error: " + data + " status: " + status + " er:" + er);
	                }
	            });

	}else{
		$.alert('Select Row');
	}
	}

	// set default boot page and pageNation
	function bootPageExtraction(){
		var maxVisibleVal=$("#maxVisible").val();
		$('.pageationER').bootpag({
    			total : 0,
    			page : 1,
    			maxVisible : maxVisibleVal,
    			 leaps : true,
    	          firstLastUse : true,
    	          wrapClass : 'pagination',
    	          activeClass : 'active',
    	          disabledClass : 'disabled',
    	          nextClass : 'next',
    	          prevClass : 'prev',
    	          lastClass : 'last',
    	          firstClass : 'first'
        }).on("page", function(event, num) {
        	$("#pageNo").val(num);
			calPageNationExtraction();
    	});     
	}
	
	
	function paginationExtraction(meataData) {	    
		var totalPages=meataData.totalRecordsCount;
		var totalRecords=meataData.totalRecords;
		var page=meataData.page; 
		var dispalyRecords=meataData.dispalyRecords;
		$("#pageNo").val(page);
		$("#totalPageCount").val(totalPages);
		var maxVisibleVal=$("#maxVisible").val();
		$('.pageationER').empty();
		 if(totalRecords>1){
				$(".btn-wrapper").css("display", "block");
				$(".bs-docs-example").css("display", "block");
				$("#txtSearch").removeAttr("disabled");
				$("#btnSearch").removeAttr("disabled");
				$("#btnRefresh").removeAttr("disabled");
				$("#btnReset").removeAttr("disabled");
		}
		if(totalPages > 0 &&  (dispalyRecords < totalRecords)){		
			$('.pageationER').bootpag({
						total : totalPages,
						page : page,
						maxVisible : maxVisibleVal,
						leaps : true,
						 firstLastUse : true,
				          wrapClass : 'pagination',
				          activeClass : 'active',
				          disabledClass : 'disabled',
				          nextClass : 'next',
				          prevClass : 'prev',
				          lastClass : 'last',
				          firstClass : 'first'
					})			
		}
		if(totalRecords!=0 && totalRecords > 10){
			$("#displayRecordsErDiv").css("display", "block");
		}else{
			$("#displayRecordsErDiv").css("display", "none");
		}	
		}
	
	function checkall(){
		  $("#checkedAll").change(function(){
		    if(this.checked){
		      $(".checkSingle").each(function(){
		        this.checked=true;
		      })              
		    }else{
		      $(".checkSingle").each(function(){
		        this.checked=false;
		      })              
		    }
		  });

		  $(".checkSingle").click(function () {
		    if ($(this).is(":checked")){
		      var isAllChecked = 0;
		      $(".checkSingle").each(function(){
		        if(!this.checked)
		           isAllChecked = 1;
		      })              
		      if(isAllChecked == 0){ $("#checkedAll").prop("checked", true); }     
		    }else {
		      $("#checkedAll").prop("checked", false);
		    }
		  });
		  
		  }
	
		function refreshEdRules(){
		$("#txtSearch").val('');
		var selectedTagId=$("#selectedTagId").val();
		var columnLengthId=$("#columnLengthId").val();
		var selfileName=$("#selfileName").val();
		if(selectedTagId== 0 || columnLengthId== 0){
			$.alert("Please select tagname!");	
			return false;
		}	
		if(selfileName== ''){
			$.alert("Please select filename!");		
			return false;
		}	
		calPageNationExtraction();
		}
	
	 //Empty Table  
	function tableEdRulesEmpty(){
		$('#extractionRulesId thead').empty();
		$('#extractionRulesId tbody').empty();
		$('.pageationER').empty();
		$("#pageInfoEr").text('');
		$("#pageNo").val(1);
		$('#selRecords').val('10');//default select records
		$(".bs-docs-example").css("display", "none");
	}
	
	function resetEdRules(){
		tableEdRulesEmpty();
		$('#selfileName').find('option').remove();
		$('#selfileName') .append($('<option>', { value : '' }).text("Select"));
		$("#selfileName" ).prop("disabled", true );
		$('#seltagName').find('option').remove();
		$('#seltagName') .append($('<option>', { value : '' }).text("Select"));
		$("#seltagName" ).prop("disabled", true );
		$("#txtSearch" ).prop("disabled", true );
		$("#txtSearch").val('');
		$("#selLanguage").val('');
		$("#btnSearch").attr("disabled", true );
		$("#btnRefresh").attr("disabled", true );
		$("#btnReset").attr("disabled", true );
		$(".btn-wrapper").css("display", "none");
		}
	
	function dispalyRecordsCountEr(meataData){
		var totalRecords=meataData.totalRecords;
		var currentPageNo=meataData.page; 
		var dispalyRecordsCount=meataData.dispalyRecords; 
		if(currentPageNo>0){
			currentPageNo--;
		}
		if(totalRecords > 0 && dispalyRecordsCount > 0 && currentPageNo >=0){
					 var startNum=(currentPageNo*dispalyRecordsCount)+1;
					 var endNum= (currentPageNo*dispalyRecordsCount)+dispalyRecordsCount;
					 if(totalRecords >= endNum){
							$('#pageInfoEr').html("Displaying <b>"+startNum+"</b> to <b>"+endNum +"</b> of "+totalRecords+" records"); 
						}else{
							$('#pageInfoEr').html("Displaying <b>"+startNum+"</b> to <b>"+totalRecords +"</b> of "+totalRecords+" records"); 
						}
				  }	
		
	}
	function resetFieldsOnLanguage(){
		$('#selfileName').find('option').remove();
		$('#selfileName') .append($('<option>', { value : '' }).text("Select"));
		$("#selfileName" ).prop("disabled", true );
		$('#seltagName').find('option').remove();
		$('#seltagName') .append($('<option>', { value : '' }).text("Select"));
		$("#seltagName" ).prop("disabled", true );
		$("#txtSearch" ).prop("disabled", true );
		$("#txtSearch").val('');
		tableEdRulesEmpty();
		}
	
	function resetFieldsOnFileName(){
		$('#seltagName').find('option').remove();
		$('#seltagName') .append($('<option>', { value : '' }).text("Select"));
		$("#seltagName" ).prop("disabled", true );
		$("#txtSearch").val('');
		$("#txtSearch" ).prop("disabled", true );
		tableEdRulesEmpty();
		}
	
	