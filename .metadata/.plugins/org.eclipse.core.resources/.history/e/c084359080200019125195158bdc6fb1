 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>

	   //This function used for check and uncheck checkboxes
		   $('#ISMastercheckbox').click(function(event) {  //on click
			    if(this.checked) { // check select status
		            $('.IScheckbox4').each(function() { //loop through each checkbox
		                this.checked = true;  //select all checkboxes with class "checkbox1"              
		            });
		        }else{
		            $('.IScheckbox4').each(function() { //loop through each checkbox
		                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
		            });        
		        }
		    });
	   
		 //This function used for check and uncheck checkboxes
		   $('#BSMastercheckbox').click(function(event) {  //on click
			    if(this.checked) { // check select status
		            $('.BScheckbox4').each(function() { //loop through each checkbox
		                this.checked = true;  //select all checkboxes with class "checkbox1"              
		            });
		        }else{
		            $('.BScheckbox4').each(function() { //loop through each checkbox
		                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
		            });        
		        }
		    });
		   
		 //This function used for check and uncheck checkboxes
		   $('#CFMastercheckbox').click(function(event) {  //on click
			    if(this.checked) { // check select status
		            $('.CFcheckbox4').each(function() { //loop through each checkbox
		                this.checked = true;  //select all checkboxes with class "checkbox1"              
		            });
		        }else{
		            $('.CFcheckbox4').each(function() { //loop through each checkbox
		                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
		            });        
		        }
		    });
		 
		 //This function used for check and uncheck checkboxes
		   $('#OPEXMastercheckbox').click(function(event) {  //on click
			    if(this.checked) { // check select status
		            $('.OPEXcheckbox4').each(function() { //loop through each checkbox
		                this.checked = true;  //select all checkboxes with class "checkbox1"              
		            });
		        }else{
		            $('.OPEXcheckbox4').each(function() { //loop through each checkbox
		                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
		            });        
		        }
		    });

function addTableSet(jQtable){
	
	var tableId=jQtable.attr('id');

	var parserName='<c:out value="${parserName}"/>'; 

	
	var tableTag='';
	
	if(tableId=='ISTable'){
  		tableTag='IS';
  	}else if(tableId=='BSTable'){
  		tableTag='BS';
  	}else if(tableId=='CFTable'){
  		tableTag='CF';
  	}else if(tableId=='OPEXTable'){
  		tableTag='OPEX';
  	}
  		

  	
  	
	jQtable.each(function(){
	    var $table = $(this);
  	var j = 'even';
  	 var tds='';
 	var rowCount;
  	for(i=1;i<=7;i++){

  		
     rowCount=i;
     tds += '<tr class='+j+'>';
         tds += '<td><input type="hidden" name="etrbc_Id" id="'+tableTag+'etrbc_Id'+rowCount+'" value= "0"/>'
         		+'<input type="hidden" name="tableType" id="'+tableTag+'tableType'+rowCount+'" value= "'+tableTag+'"/>'
         		+'<input type="checkbox" name="checkbox4" id="checkbox4" class="'+tableTag+'checkbox4"></td>'
         		+'<input type="text" name="tableType" id="'+tableTag+'tableType'+rowCount+'" value= "'+tableTag+'"/>'
         		+'<td class="even">'
         		+'<select name="tag" id="'+tableTag+'Tags'+rowCount+'" style="color:#000000; padding:2px;">';
         	
         		
         		if(parserName!='SEC Public Co' && parserName!='Enhanced Public Parser'){
         		tds +='<option value="Algorithm">Algorithm</option>';
         		if(rowCount==1){
         		tds +='<option value="ID" selected>ID</option>';
         		}else{
         			tds +='<option value="ID">ID</option>';	
         		}
         		tds +='<option value="Instance">Instance</option>';
         		if(rowCount==2){
          		tds +='<option value="Begin" selected >Begin</option>';
         		}else{
         		tds +='<option value="Begin">Begin</option>';	
         		}	
          		
          		if(rowCount==3 ||rowCount==4 || rowCount==5 || rowCount==6){
          			tds +='<option value="Progress" selected>Progress</option>';	
             	}else{
             		tds +='<option value="Progress">Progress</option>';
             	}
          		if(rowCount==7){
          		tds +='<option value="End" selected>End</option>';
          		}else{
          		tds +='<option value="End">End</option>';
          		}
          		
          		tds +='</select></td>'
         		+'<td class="even"><input type="text" name="xvalue" id="'+tableTag+'xvalue'+rowCount+'" style="width:96%" ></td>'
         		+'<td class="even">'
         		+'<select name="inclusive" id="'+tableTag+'inclusive'+rowCount+'" style="color:#000000; padding:2px;">'
         		
         		+'<option value="N">N</option>';
         		if(rowCount==2 || rowCount==7){
         		tds +='<option value="Y" selected>Y</option>';
         		}else{
         		tds +='<option value="Y" >Y</option>';
         		}
         		
         		tds +='</select></td>'
         		+'<td class="even">'
         		+'<select name="action" id="'+tableTag+'action'+rowCount+'" style="color:#000000; padding:2px;">'
         		+'<option value="NA" selected="selected">NA</option>'
         		+'<option value="Exit">Exit</option>'
         		+'<option value="Continue">Continue</option>'
         		+'<option value="TooFar">TooFar</option>'
         		+'</select>'
         		+'</td>'
         
         		+'<td class="even">'
         		+'<select name="srchType" id="'+tableTag+'srchType'+rowCount+'" style="color:#000000; padding:2px;">'
         		+'<option value="NA" selected="selected">NA</option>'
         		+'<option value="Contains">Contains</option>'
         		+'<option value="StartsWith" selected>StartsWith</option>'
         		+'<option value="EndsWith">EndsWith</option>'
         		+'<option value="Equals">Equals</option>'
         		+'</select></td>'
         		+'<input type="hidden" name="deleteFlag" id="deleteFlag" value="no">';
         		}else{
         			
         			if(rowCount==1){
         			tds+='<option value="Algorithm" selected>Algorithm</option>';
         			}else{
         			tds+='<option value="Algorithm">Algorithm</option>';
         			}
             		if(rowCount==2){
             		tds +='<option value="TableIdentifier" selected>TableIdentifier</option>';
             		}else{
             		tds +='<option value="TableIdentifier">TableIdentifier</option>';	
             		}
             		if(rowCount==3){
             		tds +='<option value="Instance" selected>Instance</option>';
             		}else{
             		tds +='<option value="Instance">Instance</option>';	
             		}
             		
             		if(rowCount==4){
              		tds +='<option value="BEGIN" selected >BEGIN</option>';
             		}else{
             		tds +='<option value="BEGIN">BEGIN</option>';	
             		}	
              		
              		if(rowCount==5 ||rowCount==6 ){
              			tds +='<option value="PROGRESS" selected>PROGRESS</option>';	
                 	}else{
                 		tds +='<option value="PROGRESS">PROGRESS</option>';
                 	}
              		if(rowCount==7){
              		tds +='<option value="END" selected>END</option>';
              		}else{
              		tds +='<option value="END">END</option>';
              		}
              		
              		tds +='</select></td>'
             		+'<td class="even"><input type="text" name="xvalue" id="'+tableTag+'xvalue'+rowCount+'" style="width:96%" ></td>'
             		+'<td class="even">'
             		+'<select name="inclusive" id="'+tableTag+'inclusive'+rowCount+'" style="color:#000000; padding:2px;">'
             		
             		+'<option value="N">N</option>';
             		if(rowCount==2 || rowCount==7){
             		tds +='<option value="Y" selected>Y</option>';
             		}else{
             		tds +='<option value="Y" >Y</option>';
             		}
             		

             		
             		tds +='</select></td>'
             		+'<td class="even">'
             		+'<select name="action" id="'+tableTag+'action'+rowCount+'" style="color:#000000; padding:2px;">'
             		+'<option value="NA" selected="selected">NA</option>'
             		+'<option value="EXIT">EXIT</option>'
             		+'<option value="CONTINUE">CONTINUE</option>'
             		+'<option value="TOOFAR">TOOFAR</option>'
             		+'</select>'
             		+'</td>'
             		+'<td class="even">'
             		+'<select name="srchType" id="'+tableTag+'srchType'+rowCount+'" style="color:#000000; padding:2px;">'
             		+'<option value="NA" selected="selected">NA</option>'
             		+'<option value="CONTAINS">CONTAINS</option>'
             		+'<option value="STARTSWITH" selected>STARTSWITH</option>'
             		+'<option value="ENDSWITH">ENDSWITH</option>'
             		+'<option value="EQUALS">EQUALS</option>'
             		+'</select></td>'
             		+'<input type="hidden" name="deleteFlag" id="deleteFlag" value="no">';
         			
         		}

         tds += '</tr>';
         if(j=='even'){
        
        	 j='odd';
         }else{
        	 j='even';
         }
  	}
  	
  	
  	
    if($('tbody', this).length > 0){
        $('tbody', this).append(tds);
    }else {
        $(this).append(tds);
    }
	});
	 
	 document.getElementById(tableTag+'SetButton').style.display="none";
	
}
function addTableRow(jQtable){

	
	var cName = $(jQtable).find('tr:last').attr('class');
		//here get table id name
  	var tableId=jQtable.attr('id');
  	var rowCount=$('#'+tableId+' tr').length;
 
  	var tableTag='';
  	var selectedTagName='';

  	if(tableId=='ISTable'){
  		tableTag='IS';
  		selectedTagName = $('#ISTags option:selected').text();
  	}else if(tableId=='BSTable'){
  		tableTag='BS';
  		selectedTagName = $('#BSTags option:selected').text();
  	}else if(tableId=='CFTable'){
  		tableTag='CF';
  		selectedTagName = $('#CFTags option:selected').text();
  	}else if(tableId=='OPEXTable'){
  		tableTag='OPEX';
  		selectedTagName = $('#OPEXTags option:selected').text();
  	}
  	
  	
  	var parserName='<c:out value="${parserName}"/>'; 
  	jQtable.each(function(){
    var $table = $(this);
	// Number of td's in the last table row
  //n=n+1;
   if (cName == 'even'){
   	var j = 'odd';
   }
   else{
	 var j = 'even';   
	}


    var tds = '<tr class='+j+'>';
    //for(var i = 0; i < n; i++){
    
        tds += '<td><input type="hidden" name="etrbc_Id" id="'+tableTag+'etrbc_Id'+rowCount+'" value= "0"/>'
        		+'<input type="hidden" name="tableType" id="'+tableTag+'tableType'+rowCount+'" value= "'+tableTag+'"/>'
        		+'<input type="checkbox" name="checkbox4" id="checkbox4" class="'+tableTag+'checkbox4"></td>'
        		+'<input type="text" name="tableType" id="'+tableTag+'tableType'+rowCount+'" value= "'+tableTag+'"/>'
        		+'<td class="even">'
        		+'<select name="tag" id="'+tableTag+'Tags'+rowCount+'" style="color:#000000; padding:2px;">';
         
        		if(parserName!='SEC Public Co' && parserName!='Enhanced Public Parser'){
        		tds +='<option value="Algorithm">Algorithm</option>'
        		+'<option value="ID">ID</option>'
        		+'<option value="Instance">Instance</option>'
         		+'<option value="Begin">Begin</option>'
         		+'<option value="Progress">Progress</option>'
         		+'<option value="End">End</option>'
         		
        		+'</select></td>'
        		+'<td class="even"><input type="text" name="xvalue" id="'+tableTag+'xvalue'+rowCount+'" style="width:96%" ></td>'
        		+'<td class="even">'
        		+'<select name="inclusive" id="'+tableTag+'inclusive'+rowCount+'" style="color:#000000; padding:2px;">'
        		+'<option value="N">N</option><option value="Y">Y</option>'
        		+'</select></td>'
        		+'<td class="even">'
        		+'<select name="action" id="'+tableTag+'action'+rowCount+'" style="color:#000000; padding:2px;">'
        		+'<option value="NA" selected="selected">NA</option>'
        		+'<option value="Exit">Exit</option>'
        		+'<option value="Continue">Continue</option>'
        		+'<option value="TooFar">TooFar</option>'
        		+'</select>'
        		+'</td>'
        
        		+'<td class="even">'
        		+'<select name="srchType" id="'+tableTag+'srchType'+rowCount+'" style="color:#000000; padding:2px;">'
        		+'<option value="NA" selected="selected">NA</option>'
        		+'<option value="Contains">Contains</option>'
        		+'<option value="StartsWith" selected>StartsWith</option>'
        		+'<option value="EndsWith">EndsWith</option>'
        		+'<option value="Equals">Equals</option>'
        		+'</select></td>';
        	}else{
        		tds +='<option value="Algorithm">Algorithm</option>'
        		+'<option value="TableIdentifier">TableIdentifier</option>'
        		+'<option value="Instance">Instance</option>'
         		+'<option value="BEGIN">BEGIN</option>'
         		+'<option value="PROGRESS">PROGRESS</option>'
         		+'<option value="END">END</option>'
         		
        		+'</select></td>'
        		+'<td class="even"><input type="text" name="xvalue" id="'+tableTag+'xvalue'+rowCount+'" style="width:96%" ></td>'
        		+'<td class="even">'
        		+'<select name="inclusive" id="'+tableTag+'inclusive'+rowCount+'" style="color:#000000; padding:2px;">'
        		+'<option value="N">N</option><option value="Y">Y</option>'
        		+'</select></td>'
        		+'<td class="even">'
        		+'<select name="action" id="'+tableTag+'action'+rowCount+'" style="color:#000000; padding:2px;">'
        		+'<option value="NA" selected="selected">NA</option>'
        		+'<option value="EXIT">EXIT</option>'
        		+'<option value="CONTINUE">CONTINUE</option>'
        		+'<option value="TOOFAR">TOOFAR</option>'
        		+'</select>'
        		+'</td>'
        
        		+'<td class="even">'
        		+'<select name="srchType" id="'+tableTag+'srchType'+rowCount+'" style="color:#000000; padding:2px;">'
        		+'<option value="NA" selected="selected">NA</option>'
        		+'<option value="CONTAINS">CONTAINS</option>'
        		+'<option value="STARTSWITH" selected>STARTSWITH</option>'
        		+'<option value="ENDSWITH">ENDSWITH</option>'
        		+'<option value="EQUALS">EQUALS</option>'
        		+'</select></td>';
        	}
         		
        	tds +='<input type="hidden" name="deleteFlag" id="deleteFlag" value="no">';
   // }
    tds += '</tr>';
    
    //Add new row under selected checkbox.
    
    var checkElements = document.getElementsByName('checkbox4');
  	
    //if not seleted any checkbox then row added after last bydefault
    if(checkCheckboxChecked()){
    	var v=1;
    	//This row object
		var checkedrow;
		for(var i=0; checkElements[i]; i++)
		{
			  if(checkElements[i].checked)
			  {
				   console.info("row added:"+i);
				   checkedrow = $(checkElements[i]);
				   checkedrow.parents('tr').after(tds);
				   checkedrow.attr('checked', false);
			  }
		}
  	}else{
    
    if($('tbody', this).length > 0){
        $('tbody', this).append(tds);
    }else {
        $(this).append(tds);
    }
 }  
    $('#'+tableTag+'Tags'+rowCount+'').val(selectedTagName);
    
    if(selectedTagName=='Algorithm'){
    	  $('#'+tableTag+'xvalue'+rowCount+'').val("B");
    }
});
}

/************** Check CheckBox checked or Not *****************/
function checkCheckboxChecked()
{
	var len = $("[name='checkbox4']:checked").length;
	console.info("row len=:"+len);
	if(len)
	return true;
	else 
	return false;
}


/************** Delete Row from table*****************/
  function deleteRow()
  {
	var checkElements = document.getElementsByName('checkbox4');
	if(checkCheckboxChecked())
	{
	 for(var i=0; checkElements[i]; ++i)
	 {
		  if(checkElements[i].checked)
		  {
			   var $this = $(checkElements[i]);
			   $this.addClass('deleteRow');
			   $this.parents('tr').css("display", "none");
			 $(checkElements[i]).closest('tr').find('input[name="deleteFlag"]').attr('value','yes');
			 $this.attr('checked', false);
			 $('#ISMastercheckbox').attr('checked', false); // UnChecks it
			 $('#BSMastercheckbox').attr('checked', false); // UnChecks it
			 $('#CFMastercheckbox').attr('checked', false); // UnChecks it
			 $('#OpexMastercheckbox').attr('checked', false); // UnChecks it
			
		  }
	  }
	}
	else
	{
		$.alert('Select Row');
	}
  }
  

$(function(){
	
	$(".col_icon_down").click(function(){
		$(this).parent().parent().next().toggle();
		$(this).toggleClass("col_icon_up");
	});
	
});

</script>
<style>
.newtable tr td{color:#333 !important}
 input{color:#333 !important}
 select{color:#333 !important; padding:4px}
</style>
 
 <c:if test="${not empty rulFlag}">
<c:choose>
<c:when test="${rulFlag}">
	
	<c:if test="${deleteCount gt 0}">
	<script>
    /* alert('${deleteCount}' +" Row Deleted"); */
    </script>
	</c:if>
	
	<script>
	/* alert("Extraction Rules Updated Successfully"); */
	</script>
	
</c:when>
 <c:otherwise>
<script>
	/* alert("Extraction Rules Added Failed"); */
</script>				       
</c:otherwise>
</c:choose>

 </c:if>
 
<table width="100%" border="0" cellspacing="0" style="margin-bottom:5px;" class="newtable">
  <tr>
    <td align="left" valign="middle" class="td-bg" style="padding:0px 0px 0px 10px; line-height:26px;">
    	<b>Custom Configuration</b>
    	<a href="JavaScript:void('0');" class="col_icon_down"></a>
    </td>
    </tr>
  <tr style="display:none;">
    <td bgcolor="#ebebeb" style="border:1px solid #cccccc;"><table width="100%" border="0" cellspacing="15" cellpadding="0" style="border-collapse: separate; border-spacing:10px;">
      <tr>
      
      <td>IS Orientation<br>
         
             
          <c:set  var="ISOrientationCount" value="0"/>    		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             	
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='IS Orientation')}">
          			   <c:set var="ISOrientationCount" value="${ISOrientationCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'SideBySide' ? 'selected' : ''}>SideBySide</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'OneBelowAnother' ? 'selected' : ''}>OneBelowAnother</option>
          		
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${ISOrientationCount eq 0}">
          			    <option>SideBySide</option>
          			    <option>OneBelowAnother</option>
          			    
          			     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
               <option>SideBySide</option>
               <option>OneBelowAnother</option>
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="7"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="IS Orientation" />
          </td>
          
          <td>Statement Merge<br>
         
             
          <c:set  var="StatementMergeCount" value="0"/>    		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             	
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Statement Merge')}">
          			   <c:set var="StatementMergeCount" value="${StatementMergeCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          		
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${StatementMergeCount eq 0}">
          			    <option>Yes</option>
          			    <option>No</option>
          			    
          			     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
               <option>Yes</option>
               <option>No</option>
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="7"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="Statement Merge" />
          </td>
          
          
          
          <td>Use Standard Tags Logic<br>
         
             
          <c:set  var="UseStandardTagsCount" value="0"/>    		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             	
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Use Standard Tags Logic')}">
          			   <c:set var="UseStandardTagsCount" value="${StatementMergeCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          		
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${UseStandardTagsCount eq 0}">
					    <option>No</option>
          			    <option>Yes</option>
          			   
          			    
          			     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
                <option>No</option>
               <option>Yes</option>
              
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="7"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="Use Standard Tags Logic" />
          </td>
          
          
          
          
          
          
          
          
          
          
        
        <td>Extraction Scope<br>
        <select id="propertyValue2" name="propertyValue" style="width:96%">
        <c:set  var="ExtractionScopeCount" value="0"/>
          <c:choose>
  		 <c:when test="${!empty extractor_runproperties_list}">
       	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
       	  <c:if test="${(extractor_runproperties_list.erp_propertyValue=='IS')  || (extractor_runproperties_list.erp_propertyValue=='BS') || (extractor_runproperties_list.erp_propertyValue=='CF')
       	 ||(extractor_runproperties_list.erp_propertyValue=='IS,BS,CF,SE,SUPPL') || (extractor_runproperties_list.erp_propertyValue=='IS,BS,CF,OPEX') || (extractor_runproperties_list.erp_propertyValue=='OPEX')
       	 || (extractor_runproperties_list.erp_propertyValue=='IS,BS') || (extractor_runproperties_list.erp_propertyValue=='IS,CF') || (extractor_runproperties_list.erp_propertyValue=='BS,CF')
       	 || (extractor_runproperties_list.erp_propertyValue=='SUPPL')}">
       
         <c:set var="ExtractionScopeCount" value="${ExtractionScopeCount + 1}" />
         <option ${extractor_runproperties_list.erp_propertyValue == 'IS,BS,CF,SE,SUPPL' ? 'selected' : ''}>IS,BS,CF,SE,SUPPL</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'IS,BS,CF,OPEX' ? 'selected' : ''}>IS,BS,CF,OPEX</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'IS,BS' ? 'selected' : ''}>IS,BS</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'IS,CF' ? 'selected' : ''}>IS,CF</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'BS,CF' ? 'selected' : ''}>BS,CF</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'IS' ? 'selected' : ''}>IS</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'BS' ? 'selected' : ''}>BS</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'CF' ? 'selected' : ''}>CF</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'OPEX' ? 'selected' : ''}>OPEX</option>
         <option ${extractor_runproperties_list.erp_propertyValue == 'SUPPL' ? 'selected' : ''}>SUPPL</option>
         
         </c:if>
         </c:forEach>
          <c:if test="${ExtractionScopeCount eq 0}">
          <option selected="selected">IS,BS,CF,SE,SUPPL</option>
          <option>IS,BS,CF,OPEX</option>
          <option>IS,BS</option>
          <option>IS,CF</option>
          <option>BS,CF</option>
          <option>IS</option>
          <option>BS</option>
          <option>CF</option>
          <option>OPEX</option>
          <option>SUPPL</option>
           <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
          </c:if>
         
         </c:when>
   		 <c:otherwise>
   		  <option selected="selected">IS,BS,CF,SE,SUPPL</option>
   		  <option>IS,BS,CF,OPEX</option>
          <option>IS,BS</option>
          <option>IS,CF</option>
          <option>BS,CF</option>
          <option>IS</option>
          <option>BS</option>
          <option>CF</option>
          <option>OPEX</option>
          <option>SUPPL</option>
         </c:otherwise>
         </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue2" value="2"/>
          <input type="hidden" name="propertyName" id="propertyName2" value="Extraction Scope" />
          </td>
          
          
          <td>Extract Breakups<br>
          <select id="propertyValue4" name="propertyValue" style="width:96%">
          <c:set  var="ExtractBreakupsCount" value="0"/>    	
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Extract Breakups')}">
          			 <c:set var="ExtractBreakupsCount" value="${ExtractBreakupsCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
             		 </c:if>
              		</c:forEach>
          <c:if test="${ExtractBreakupsCount eq 0}">
          <option>Yes</option>
           <option>No</option>
           <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
          </c:if>
              		
              </c:when>
               <c:otherwise>
               <option>Yes</option>
               <option>No</option>
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue4" value="4"/>
          <input type="hidden" name="propertyName" id="propertyName4" value="Extract Breakups" />
          </td>
          
          <td>IS Breakups<br>
          <select id="propertyValue4" name="propertyValue" style="width:96%">
          <c:set  var="ISBreakupsCount" value="0"/>    	
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='IS Breakups')}">
          			 <c:set var="ISBreakupsCount" value="${ISBreakupsCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
             		 </c:if>
              		</c:forEach>
              		 <c:if test="${ISBreakupsCount eq 0}">
          				<option>Yes</option>
           				<option>No</option>
           				<input type="hidden" name="erp_Id" id="erp_Id" value="0" />
  					</c:if>
              </c:when>
               <c:otherwise>
               <option>Yes</option>
               <option>No</option>
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue4" value="4"/>
          <input type="hidden" name="propertyName" id="propertyName4" value="IS Breakups" />
          </td>
          
          <td>BS Breakups<br>
          <select id="propertyValue4" name="propertyValue" style="width:96%">
          <c:set  var="BSBreakupsCount" value="0"/>    	
 
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='BS Breakups')}">
          			 <c:set var="BSBreakupsCount" value="${BSBreakupsCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
             		 </c:if>
              		</c:forEach>
              		 <c:if test="${BSBreakupsCount eq 0}">
          			<option>Yes</option>
           			<option>No</option>
           			<input type="hidden" name="erp_Id" id="erp_Id" value="0" />
  					</c:if>
              </c:when>
               <c:otherwise>
               <option>Yes</option>
               <option>No</option>
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue4" value="4"/>
          <input type="hidden" name="propertyName" id="propertyName4" value="BS Breakups" />
          </td>
          
          <td>CAG Feature<br>
          <select id="propertyValue4" name="propertyValue" style="width:96%">
          <c:set  var="CAGFeatureCount" value="0"/>    	
 
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='CAG Feature')}">
          			 <c:set var="CAGFeatureCount" value="${CAGFeatureCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Y' ? 'selected' : ''}>Y</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'N' ? 'selected' : ''}>N</option>
             		 </c:if>
              		</c:forEach>
              		 <c:if test="${CAGFeatureCount eq 0}">
          			<option>Y</option>
           			<option>N</option>
           			<input type="hidden" name="erp_Id" id="erp_Id" value="0" />
  					</c:if>
              </c:when>
               <c:otherwise>
               <option>Y</option>
               <option>N</option>
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue4" value="4"/>
          <input type="hidden" name="propertyName" id="propertyName4" value="CAG Feature" />
          </td>
          
          
          
          
          
          <td>Standalone<br>
          
              <select id="propertyValue1" name="propertyValue" style="width:96%">
              <c:set  var="StandaloneCount" value="0"/>    	
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Standalone')}">
          			 <c:set var="StandaloneCount" value="${StandaloneCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
             		 </c:if>
              		</c:forEach>
              		 <c:if test="${StandaloneCount eq 0}">
          			<option>Yes</option>
           			<option>No</option>
           			<input type="hidden" name="erp_Id" id="erp_Id" value="0" />
  					</c:if>
              </c:when>
               <c:otherwise>
               <option>Yes</option>
               <option selected="selected">No</option>
               </c:otherwise>
              </c:choose>
              </select>
           <input type="hidden" name="orderValue" id="orderValue1" value="1" />
           <input type="hidden" name="propertyName" id="propertyName1" value="Standalone" />
        
         
		 <c:choose>
  			    <c:when test="${!empty extractor_runproperties_list}">
       				<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
           			<input type="hidden" name="erp_Id" id="erp_Id" value="${extractor_runproperties_list.erpId}" />
           			</c:forEach>
   			   </c:when>
   		 <c:otherwise>
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
            <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
  	  </c:otherwise>
	</c:choose>
         
        
       
          </td>
          
        <td>Generate Log<br>
          <select id="propertyValue3" name="propertyValue" style="width:96%">
           <c:set  var="GenerateLogCount" value="0"/>    
               <c:choose>
              
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Generate Log')}">
          			 <c:set var="GenerateLogCount" value="${GenerateLogCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Off' ? 'selected' : ''}>Off</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'On' ? 'selected' : ''}>On</option>
             		 </c:if>
              		</c:forEach>
              		 <c:if test="${GenerateLogCount eq 0}">
          			<option>Off</option>
           			<option>On</option>
           			<input type="hidden" name="erp_Id" id="erp_Id" value="0" />
  					</c:if>
              </c:when>
               <c:otherwise>
               <option>Off</option>
               <option>On</option>
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="3"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="Generate Log" />
          </td>
          
        
          
        
          
      </tr>
      
      <tr>
      
          <td>Use Stored Logic<br>
          <select id="propertyValue4" name="propertyValue" style="width:96%">
          <c:set  var="UseStoredLogicCount" value="0"/>    
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Use Stored Logic')}">
          			 <c:set var="UseStoredLogicCount" value="${UseStoredLogicCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
             			<option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
             		 </c:if>
              		</c:forEach>
              		 <c:if test="${UseStoredLogicCount eq 0}">
          			<option>Yes</option>
           			<option>No</option>
           			<input type="hidden" name="erp_Id" id="erp_Id" value="0" />
  					</c:if>
              </c:when>
               <c:otherwise>
               <option>Yes</option>
               <option>No</option>
               </c:otherwise>
              </c:choose>
         </select>
          
          
          
          
          <input type="hidden" name="orderValue" id="orderValue4" value="4"/>
            <input type="hidden" name="propertyName" id="propertyName4" value="Use Stored Logic" />
          </td>
          <td>Calculate Statistics<br>
         
             	<c:set  var="CalculateStatisticsCount" value="0"/>    
              		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Calculate Statistics')}">
          			 <c:set var="CalculateStatisticsCount" value="${CalculateStatisticsCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			 
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${CalculateStatisticsCount eq 0}">
					  <option>No</option>
          			  <option>Yes</option>
             		  
          			     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
               <option>No</option>
               <option>Yes</option>
              
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="8"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="Calculate Statistics" />
          </td>
          
          <td>BS Use Company Name First<br>
         
             	<c:set  var="BSUseCompanyNameFirstCount" value="0"/>    	
              		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='BS Use Company Name First')}">
          			 <c:set var="BSUseCompanyNameFirstCount" value="${BSUseCompanyNameFirstCount + 1}" />
          			 <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          			 <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${BSUseCompanyNameFirstCount eq 0}">
					   <option>No</option>
          			   <option>Yes</option>
             		     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
               <option>No</option>
               <option>Yes</option>
               
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="9"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="BS Use Company Name First" />
          </td>
          
          
           <td>IS Use Company Name First<br>
         
             <c:set  var="ISUseCompanyNameFirstCount" value="0"/>    	
              		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='IS Use Company Name First')}">
          			 <c:set var="ISUseCompanyNameFirstCount" value="${ISUseCompanyNameFirstCount + 1}" />
          			 <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          			 <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${ISUseCompanyNameFirstCount eq 0}">
					   <option>No</option>
          			   <option>Yes</option>
             		     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
               <option>No</option>
               <option>Yes</option>
               
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="10"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="IS Use Company Name First" />
          </td>
          
          
           <td>CF Use Company Name First<br>
         
             <c:set  var="CFUseCompanyNameFirstCount" value="0"/>    
              		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='CF Use Company Name First')}">
          			 <c:set var="CFUseCompanyNameFirstCount" value="${CFUseCompanyNameFirstCount + 1}" />
          			 <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          			 <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${CFUseCompanyNameFirstCount eq 0}">
					   <option>No</option>
          			   <option>Yes</option>
             		     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
               <option>No</option>
               <option>Yes</option>
               
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="11"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="CF Use Company Name First" />
          </td>
          
          
          
          <td>Examine All BS Items For Breakup<br>
         
             	<c:set  var="ExamineAllBSItemsForBreakupCount" value="0"/>   
              		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Examine All BS Items For Breakup')}">
          			 <c:set var="ExamineAllBSItemsForBreakupCount" value="${ExamineAllBSItemsForBreakupCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${ExamineAllBSItemsForBreakupCount eq 0}">
          			   <option>Yes</option>
             		   <option>No</option>
          			     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
               <option>Yes</option>
               <option>No</option>
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="12"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="Examine All BS Items For Breakup" />
          </td>
          
          
          <td>Examine All IS Items For Breakup<br>
         
             	<c:set  var="ExamineAllISItemsForBreakupCount" value="0"/>    	
              		
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Examine All IS Items For Breakup')}">
          			  
						<c:set var="ExamineAllISItemsForBreakupCount" value="${ExamineAllISItemsForBreakupCount + 1}" />
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          			 </c:if>
              		</c:forEach>
              		
					 <c:if test="${ExamineAllISItemsForBreakupCount eq 0}">
          			   <option>Yes</option>
             		   <option>No</option>
          			     <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
              
               <c:otherwise>
               <option>Yes</option>
               <option>No</option>
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="13"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="Examine All IS Items For Breakup" />
          </td>
          
          <td>Override Business Logic<br>
         <c:set  var="OverrideBusinessLogicCount" value="0"/>    
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Override Business Logic')}">
          			 <c:set var="OverrideBusinessLogicCount" value="${OverrideBusinessLogicCount + 1}" />
          			   <option ${extractor_runproperties_list.erp_propertyValue == 'No' ? 'selected' : ''}>No</option>
          			    <option ${extractor_runproperties_list.erp_propertyValue == 'Yes' ? 'selected' : ''}>Yes</option>
          			  
          			 </c:if>
              		</c:forEach>
              		 <c:if test="${OverrideBusinessLogicCount eq 0}">
              		  <option>No</option>
          			   <option>Yes</option>
             		  <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              		
              </c:when>
              
               <c:otherwise>
               <option>No</option>
               <option>Yes</option>
               
               
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="14"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="Override Business Logic" />
          </td>
          
          <td>Sub Section Mapping<br>
         <c:set  var="SubSectionMappingCount" value="0"/>    
          <select id="propertyValue3" name="propertyValue" style="width:96%">
               <c:choose>
                <c:when test="${!empty extractor_runproperties_list}">
             
                	<c:forEach items="${extractor_runproperties_list}" var="extractor_runproperties_list">   
          			 
          			 <c:if test="${(extractor_runproperties_list.erp_propertyName=='Sub-Section Mapping')}">
          			 <c:set var="SubSectionMappingCount" value="${SubSectionMappingCount + 1}" />
          			   <option ${extractor_runproperties_list.erp_propertyValue == 'IS,BS,CF' ? 'selected' : ''}>IS,BS,CF</option>
          			 </c:if>
              		</c:forEach>
              		 <c:if test="${SubSectionMappingCount eq 0}">
              		  <option>IS,BS,CF</option>
             		  <input type="hidden" name="erp_Id" id="erp_Id" value="0" />
             		 </c:if>
              </c:when>
               <c:otherwise>
               <option>IS,BS,CF</option>
               </c:otherwise>
              </c:choose>
         </select>
          <input type="hidden" name="orderValue" id="orderValue3" value="14"/>
          <input type="hidden" name="propertyName" id="propertyName3" value="Sub-Section Mapping" />
          </td>
          
          </tr>
      
      
      
    </table></td>
    </tr>
</table>

<div style="margin-bottom:10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10" class="newtable" style="border-collapse: separate; border:1px solid #ccc;">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>IS Identification</strong></td>
    <td width="40%" align="right" valign="middle" bgcolor="#fff">
    <select name="ISTags" id="ISTags" style="color:#000000; padding:8px 8px 7px 8px; font-size:13px;">
    <c:choose>
    <c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co') || fn:toLowerCase(parserName)==fn:toLowerCase('Enhanced Public Parser')}">
    <option value="Algorithm">Algorithm</option>
    <option value="TableIdentifier">TableIdentifier</option>
    <option value="Instance">Instance</option>
    <option value="BEGIN">BEGIN</option>
	<option value="PROGRESS">PROGRESS</option>
	<option value="END">END</option>

</c:when>
    <c:otherwise>
    <option value="Algorithm">Algorithm</option>
    <option value="ID">ID</option>
    <option value="Instance">Instance</option>
    <option value="Begin">Begin</option>
	<option value="Progress">Progress</option>
	<option value="End">End</option>
 </c:otherwise>
	</c:choose>
  
    
    </select> 
    <a href="Javascript:void('0');" class="btn btn-sm btn-info" style="padding:3px 10px; margin-top:-5px;" onClick="addTableRow($('#ISTable'));">Add a New Tag</a>
    <a href="Javascript:void('0');" class="btn btn-sm btn-info" style="padding:3px 10px; margin-top:-5px;" onClick="addTableSet($('#ISTable'));" id="ISSetButton">New Tag Set</a>
    </td>
    
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5"  style="border-collapse: separate;  border-spacing:1px;" bgcolor="#ebebeb" id="ISTable" name="ISTable">
  <tr class="throw row-bg">
    <td width="2%" ><input type="checkbox" name="ISMastercheckbox" id="ISMastercheckbox"></td>
    <td width="20%" ><strong>Name</strong></td>
    <td width="28%" align="left"><strong>Value</strong></td>
    <td width="21%" align="left"><strong>Form Inclusive / Exclusive</strong></td>
    <td width="14%" align="left"><strong>Action</strong></td>
    <td width="15%" align="left"><strong>Search Type</strong></td>
  </tr>
  
  <c:set var="cssTrClassname1" value="even"/>


     	<c:set  var="ISRowCount" value="0"/>
     	<!-- Here etrbc_cid,etrbc_cik,etrbc_industry,etrbc_language are same for every row for that filing id -->
     	<c:set  var="etrbc_cid" value=""/>
     	<c:set  var="etrbc_cik" value=""/>
     	<c:set  var="etrbc_industry" value=""/>
     	<c:set  var="etrbc_lagnuage" value=""/>
    
     	
     	<c:set  var="ISRowCount" value="0"/>
  <c:forEach items="${extractor_rule_list}" var="extractor_rule_list">  
 
  <c:set  var="etrbc_cid" value="${extractor_rule_list.etrbc_cID}"/>
  <c:set  var="etrbc_cik" value="${extractor_rule_list.etrbc_cIK}"/>
  <c:set  var="etrbc_industry" value="${extractor_rule_list.etrbc_industry}"/>
  <c:set  var="etrbc_lagnuage" value="${extractor_rule_list.etrbc_language}"/>
   
  <c:if test="${extractor_rule_list.etrbc_tableType=='IS'}">
	<c:set var="ISRowCount" value="${ISRowCount + 1}" scope="page"/>
  <tr class='${cssTrClassname1}'>
  <td>
<%--   <input type="hidden" name="id" id="id" value= "${extractor_rule_list.id}"/>
 --%>
   <input type="hidden" name="etrbc_Id" id="etrbc_Id" value= "${extractor_rule_list.etrbc_Id}"/>
  <input type="hidden" name="tableType" id="'+tableTag+'tableType'+rowCount+'" value= "${extractor_rule_list.etrbc_tableType}"/>
 
  
  <input type="checkbox" name="checkbox4" id="checkbox4" class="IScheckbox4">
  </td>
 	 <td class="even">
	
	
	 <select id="ISTags1" style="color:#000000; padding:2px;" name="tag">
	 <c:choose>
    	<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co') || fn:toLowerCase(parserName)==fn:toLowerCase('Enhanced Public Parser')}">
        <option value="Algorithm" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Algorithm') ? 'selected' : ''}>Algorithm</option>
		<option value="TableIdentifier" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('TableIdentifier') ? 'selected' : ''}>TableIdentifier</option>
	 	<option value="Instance" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) ==fn:toLowerCase('Instance') ? 'selected' : ''}>Instance</option>
	 	<option value="BEGIN" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('BEGIN') ? 'selected' : ''} >BEGIN</option>
		<option value="PROGRESS" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('PROGRESS') ? 'selected' : ''}>PROGRESS</option>
		<option value="END" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('END') ? 'selected' : ''}>END</option>
    	</c:when>
    <c:otherwise>
        <option value="Algorithm" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Algorithm') ? 'selected' : ''}>Algorithm</option>
		<option value="ID" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('ID') ? 'selected' : ''}>ID</option>
	 	<option value="Instance" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) ==fn:toLowerCase('Instance') ? 'selected' : ''}>Instance</option>
	 	<option value="Begin" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Begin') ? 'selected' : ''} >Begin</option>
		<option value="Progress" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Progress') ? 'selected' : ''}>Progress</option>
		<option value="End" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('End') ? 'selected' : ''}>End</option>
    </c:otherwise>
	</c:choose>
	
		
	
	
	</select> 
	
</td>
<td class="even">
<input id="ISxvalue1" type="text" style="width:96%" name="xvalue" value="${extractor_rule_list.etrbc_value}">
</td>
<td class="even">

<select id="ISinclusive1" style="color:#000000; padding:2px;" name="inclusive">
<option value="N"  ${fn:toLowerCase(extractor_rule_list.etrbc_inclusive) == fn:toLowerCase('N') ? 'selected' : ''}>N</option>
<option value="Y" ${fn:toLowerCase(extractor_rule_list.etrbc_inclusive) == fn:toLowerCase('Y') ? 'selected' : ''}>Y</option>
</select>

</td>
<td class="even">
<select id="ISaction1" style="color:#000000; padding:2px;" name="action">

<c:choose>
	<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co')}">
 	<option value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="EXIT" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('EXIT') ? 'selected' : ''}>EXIT</option>
<option value="CONTINUE" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('CONTINUE') ? 'selected' : ''}>CONTINUE</option>
<option value="TOOFAR" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('TOOFAR') ? 'selected' : ''}>TOOFAR</option>
</c:when>
    <c:otherwise>
 <option value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="Exit" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('Exit') ? 'selected' : ''}>Exit</option>
<option value="Continue" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('Continue') ? 'selected' : ''}>Continue</option>
<option value="TooFar" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('TooFar') ? 'selected' : ''}>TooFar</option>
 </c:otherwise>
</c:choose>


</select>
</td>
<td class="even">
<select id="ISsrchType1" style="color:#000000; padding:2px;" name="srchType">
<c:choose>

<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co')}">
<option  value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="CONTAINS" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('CONTAINS') ? 'selected' : ''}>CONTAINS</option>
<option  value="STARTSWITH" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('STARTSWITH') ? 'selected' : ''}>STARTSWITH</option>
<option value="ENDSWITH" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('ENDSWITH') ? 'selected' : ''}>ENDSWITH</option>
<option value="EQUALS" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('EQUALS') ? 'selected' : ''}>EQUALS</option>
</c:when>
 <c:otherwise>
<option  value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="Contains" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('Contains') ? 'selected' : ''}>Contains</option>
<option  value="StartsWith" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('StartsWith') ? 'selected' : ''}>StartsWith</option>
<option value="EndsWith" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('EndsWith') ? 'selected' : ''}>EndsWith</option>
<option value="Equals" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('Equals') ? 'selected' : ''}>Equals</option>
 </c:otherwise>
</c:choose>




</select>
</td>
<input type="hidden" name="deleteFlag" id="deleteFlag" value="no">

</tr>

    <c:choose>  
        <c:when test="${cssTrClassname1=='even'}">  
             <c:set var="cssTrClassname1" value="odd"/>
             </c:when>  
             <c:otherwise>  
             <c:set var="cssTrClassname1" value="even"/>
             </c:otherwise>  
    </c:choose>  
</c:if>

</c:forEach>
 
     	
<input type="hidden" name="etrbc_cid" value="${etrbc_cid}"/> 
<input type="hidden" name="etrbc_cik" value="${etrbc_cik}"/>
<input type="hidden" name="etrbc_industry" value="${etrbc_industry}"/>
<input type="hidden" name="etrbc_language" value="${etrbc_lagnuage}"/>
<input type="hidden" name="entityId" value="${etrbc_lagnuage}"/>
 						 
	

<c:if test="${ISRowCount gt 0}">
 <script>
 document.getElementById("ISSetButton").style.display = "none";
</script>
</c:if>
 
  
  
</table>
</div>


<div style="margin-bottom:10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10" style="border-collapse: separate; border:1px solid #ccc;">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>BS Identification</strong></td>
    <td width="40%" align="right" valign="middle" bgcolor="#fff">
    
    <select name="BSTags" id="BSTags" style="color:#000000; padding:8px 8px 7px 8px; font-size:13px;">
   
    <c:choose>
    <c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co') || fn:toLowerCase(parserName)==fn:toLowerCase('Enhanced Public Parser')}">
    <option value="Algorithm">Algorithm</option>
    <option value="TableIdentifier">TableIdentifier</option>
    <option value="Instance">Instance</option>
    <option value="BEGIN">BEGIN</option>
	<option value="PROGRESS">PROGRESS</option>
	<option value="END">END</option>

</c:when>
    <c:otherwise>
    <option value="Algorithm">Algorithm</option>
    <option value="ID">ID</option>
    <option value="Instance">Instance</option>
    <option value="Begin">Begin</option>
	<option value="Progress">Progress</option>
	<option value="End">End</option>
 </c:otherwise>
	</c:choose>
   
    </select> 
    
    <a href="Javascript:void('0');" class="btn btn-sm btn-info" style="padding:3px 10px; margin-top:-5px;" onClick="addTableRow($('#BSTable'));">Add a New Tag</a>
    <a href="Javascript:void('0');" class="btn btn-sm btn-info" style="padding:3px 10px; margin-top:-5px;" onClick="addTableSet($('#BSTable'));" id="BSSetButton">New Tag Set</a>
    </td>
  </tr>
  
  
  
  
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5"  style="border-collapse: separate;  border-spacing:1px;" bgcolor="#ebebeb" id="BSTable">
  <tr class="throw row-bg">
    <td width="2%"><input type="checkbox" name="BSMastercheckbox" id="BSMastercheckbox"></td>
    <td width="20%"><strong>Name</strong></td>
    <td width="28%" align="left" ><strong>Value</strong></td>
    <td width="21%" align="left" ><strong>Form Inclusive / Exclusive</strong></td>
    <td width="14%" align="left" ><strong>Action</strong></td>
    <td width="15%" align="left" ><strong>Search Type</strong></td>
  </tr>
  


<c:set var="cssTrClassname2" value="even"/>
  <c:set  var="BSRowCount" value="0"/>
  <c:forEach items="${extractor_rule_list}" var="extractor_rule_list">   
  
  <c:if test="${extractor_rule_list.etrbc_tableType=='BS'}">
 <c:set var="BSRowCount" value="${BSRowCount + 1}" scope="page"/>
  <tr class='${cssTrClassname2}'>
  <td>
  
<%--   <input type="hidden" name="id" id="id" value= "${extractor_rule_list.id}"/>
 --%>  <input type="hidden" name="etrbc_Id" id="etrbc_Id" value= "${extractor_rule_list.etrbc_Id}"/>
  <input type="hidden" name="tableType" id="'+tableTag+'tableType'+rowCount+'" value= "${extractor_rule_list.etrbc_tableType}"/>
  
  
  <input type="checkbox" name="checkbox4" id="checkbox4" class="BScheckbox4">
  </td>
 	 <td class="even">
	
	
	<select id="BSTags1" style="color:#000000; padding:2px;" name="tag">
	 	<c:choose>
    	<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co') || fn:toLowerCase(parserName)==fn:toLowerCase('Enhanced Public Parser')}">
    	<option value="Algorithm" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Algorithm') ? 'selected' : ''}>Algorithm</option>
		<option value="TableIdentifier" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('TableIdentifier') ? 'selected' : ''}>TableIdentifier</option>
	 	<option value="Instance" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) ==fn:toLowerCase('Instance') ? 'selected' : ''}>Instance</option>
	 	<option value="BEGIN" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('BEGIN') ? 'selected' : ''} >BEGIN</option>
		<option value="PROGRESS" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('PROGRESS') ? 'selected' : ''}>PROGRESS</option>
		<option value="END" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('END') ? 'selected' : ''}>END</option>
    	</c:when>
    <c:otherwise>
        <option value="Algorithm" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Algorithm') ? 'selected' : ''}>Algorithm</option>
		<option value="ID" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('ID') ? 'selected' : ''}>ID</option>
	 	<option value="Instance" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) ==fn:toLowerCase('Instance') ? 'selected' : ''}>Instance</option>
	 	<option value="Begin" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Begin') ? 'selected' : ''} >Begin</option>
		<option value="Progress" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Progress') ? 'selected' : ''}>Progress</option>
		<option value="End" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('End') ? 'selected' : ''}>End</option>
    </c:otherwise>
	</c:choose>
	 	
	 	
	 	
	</select>
	

	
</td>
<td class="even">
<input id="BSxvalue1" type="text" style="width:96%" name="xvalue" value="${extractor_rule_list.etrbc_value}">
</td>
<td class="even">

<select id="BSinclusive1" style="color:#000000; padding:2px;" name="inclusive">
<option value="N"  ${fn:toLowerCase(extractor_rule_list.etrbc_inclusive) == fn:toLowerCase('N') ? 'selected' : ''}>N</option>
<option value="Y" ${fn:toLowerCase(extractor_rule_list.etrbc_inclusive) == fn:toLowerCase('Y') ? 'selected' : ''}>Y</option>
</select>

</td>
<td class="even">
<select id="BSaction1" style="color:#000000; padding:2px;" name="action">
<c:choose>
	<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co')}">
 	<option value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="EXIT" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('EXIT') ? 'selected' : ''}>EXIT</option>
<option value="CONTINUE" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('CONTINUE') ? 'selected' : ''}>CONTINUE</option>
<option value="TOOFAR" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('TOOFAR') ? 'selected' : ''}>TOOFAR</option>
</c:when>
    <c:otherwise>
 <option value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="Exit" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('Exit') ? 'selected' : ''}>Exit</option>
<option value="Continue" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('Continue') ? 'selected' : ''}>Continue</option>
<option value="TooFar" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('TooFar') ? 'selected' : ''}>TooFar</option>
 </c:otherwise>
</c:choose>



</select>
</td>
<td class="even">
<select id="BSsrchType1" style="color:#000000; padding:2px;" name="srchType">
<c:choose>

<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co')}">
<option  value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="CONTAINS" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('CONTAINS') ? 'selected' : ''}>CONTAINS</option>
<option  value="STARTSWITH" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('STARTSWITH') ? 'selected' : ''}>STARTSWITH</option>
<option value="ENDSWITH" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('ENDSWITH') ? 'selected' : ''}>ENDSWITH</option>
<option value="EQUALS" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('EQUALS') ? 'selected' : ''}>EQUALS</option>
</c:when>
 <c:otherwise>
<option  value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="Contains" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('Contains') ? 'selected' : ''}>Contains</option>
<option  value="StartsWith" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('StartsWith') ? 'selected' : ''}>StartsWith</option>
<option value="EndsWith" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('EndsWith') ? 'selected' : ''}>EndsWith</option>
<option value="Equals" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('Equals') ? 'selected' : ''}>Equals</option>
 </c:otherwise>
</c:choose>

</select>
</td>
<input type="hidden" name="deleteFlag" id="deleteFlag" value="no">
</tr>

    <c:choose>  
        <c:when test="${cssTrClassname2=='even'}">  
             <c:set var="cssTrClassname2" value="odd"/>
             </c:when>  
             <c:otherwise>  
             <c:set var="cssTrClassname2" value="even"/>
             </c:otherwise>  
    </c:choose>  
</c:if>

</c:forEach>

<c:if test="${BSRowCount gt 0}">
 <script>
 document.getElementById("BSSetButton").style.display = "none";
</script>
</c:if>

  
</table>
</div>

<div style="margin-bottom:10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10" style="border-collapse: separate; border:1px solid #ccc;">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>CF Identification</strong></td>
    <td width="40%" align="right" valign="middle" bgcolor="#fff">
    <select name="CFTags" id="CFTags" style="color:#000000; padding:8px 8px 7px 8px; font-size:13px;">
    <c:choose>
    <c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co') || fn:toLowerCase(parserName)==fn:toLowerCase('Enhanced Public Parser')}">
    <option value="Algorithm">Algorithm</option>
    <option value="TableIdentifier">TableIdentifier</option>
    <option value="Instance">Instance</option>
    <option value="BEGIN">BEGIN</option>
	<option value="PROGRESS">PROGRESS</option>
	<option value="END">END</option>

</c:when>
    <c:otherwise>
    <option value="Algorithm">Algorithm</option>
    <option value="ID">ID</option>
    <option value="Instance">Instance</option>
    <option value="Begin">Begin</option>
	<option value="Progress">Progress</option>
	<option value="End">End</option>
 </c:otherwise>
	</c:choose>
   
    </select> 
   
     <a href="javascript:void();" class="btn btn-sm btn-info" style="padding:3px 10px; margin-top:-5px;" onClick="addTableRow($('#CFTable'));">Add a New Tag</a>
      <a href="Javascript:void('0');" class="btn btn-sm btn-info" style="padding:3px 10px; margin-top:-5px;" onClick="addTableSet($('#CFTable'));" id="CFSetButton">New Tag Set</a>
     </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5"  style="border-collapse: separate;  border-spacing:1px;" bgcolor="#ebebeb" id="CFTable">
  <tr class="throw row-bg">
    <td width="2%" ><input type="checkbox" name="CFMastercheckbox" id="CFMastercheckbox"></td>
    <td width="20%" ><strong>Name</strong></td>
    <td width="28%" align="left" ><strong>Value</strong></td>
    <td width="21%" align="left" ><strong>Form Inclusive / Exclusive</strong></td>
    <td width="14%" align="left" ><strong>Action</strong></td>
    <td width="15%" align="left" ><strong>Search Type</strong></td>
  </tr>
  
  
  

<c:set var="cssTrClassname3" value="even"/>
  
  <c:set  var="CFRowCount" value="0"/>
  
  <c:forEach items="${extractor_rule_list}" var="extractor_rule_list">   
  
  <c:if test="${extractor_rule_list.etrbc_tableType=='CF'}">
  <c:set var="CFRowCount" value="${CFRowCount + 1}" scope="page"/>
 
  <tr class='${cssTrClassname3}'>
  <td>
  
<%--   <input type="hidden" name="id" id="id" value= "${extractor_rule_list.id}"/>
 --%>  <input type="hidden" name="etrbc_Id" id="etrbc_Id" value= "${extractor_rule_list.etrbc_Id}"/>
  <input type="hidden" name="tableType" id="'+tableTag+'tableType'+rowCount+'" value= "${extractor_rule_list.etrbc_tableType}"/>
  
  
  <input type="checkbox" name="checkbox4" id="checkbox4" class="CFcheckbox4">
  </td>
 	 <td class="even">
	
	
	<select id="CFTags1" style="color:#000000; padding:2px;" name="tag">
		<c:choose>
    	<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co') || fn:toLowerCase(parserName)==fn:toLowerCase('Enhanced Public Parser')}">
    	<option value="Algorithm" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Algorithm') ? 'selected' : ''}>Algorithm</option>
		<option value="TableIdentifier" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('TableIdentifier') ? 'selected' : ''}>TableIdentifier</option>
	 	<option value="Instance" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) ==fn:toLowerCase('Instance') ? 'selected' : ''}>Instance</option>
	 	<option value="BEGIN" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('BEGIN') ? 'selected' : ''} >BEGIN</option>
		<option value="PROGRESS" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('PROGRESS') ? 'selected' : ''}>PROGRESS</option>
		<option value="END" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('END') ? 'selected' : ''}>END</option>
    	</c:when>
    <c:otherwise>
        <option value="Algorithm" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Algorithm') ? 'selected' : ''}>Algorithm</option>
		<option value="ID" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('ID') ? 'selected' : ''}>ID</option>
	 	<option value="Instance" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) ==fn:toLowerCase('Instance') ? 'selected' : ''}>Instance</option>
	 	<option value="Begin" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Begin') ? 'selected' : ''} >Begin</option>
		<option value="Progress" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Progress') ? 'selected' : ''}>Progress</option>
		<option value="End" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('End') ? 'selected' : ''}>End</option>
    </c:otherwise>
	</c:choose>
		
	</select>
</td>
<td class="even">
<input id="CFxvalue1" type="text" style="width:96%" name="xvalue" value="${extractor_rule_list.etrbc_value}">
</td>
<td class="even">

<select id="CFinclusive1" style="color:#000000; padding:2px;" name="inclusive">
<option value="N"  ${fn:toLowerCase(extractor_rule_list.etrbc_inclusive) == fn:toLowerCase('N') ? 'selected' : ''}>N</option>
<option value="Y" ${fn:toLowerCase(extractor_rule_list.etrbc_inclusive) == fn:toLowerCase('Y') ? 'selected' : ''}>Y</option>
</select>

</td>
<td class="even">
<select id="CFaction1" style="color:#000000; padding:2px;" name="action">
<c:choose>
	<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co')}">
 	<option value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="EXIT" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('EXIT') ? 'selected' : ''}>EXIT</option>
<option value="CONTINUE" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('CONTINUE') ? 'selected' : ''}>CONTINUE</option>
<option value="TOOFAR" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('TOOFAR') ? 'selected' : ''}>TOOFAR</option>
</c:when>
    <c:otherwise>
 <option value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="Exit" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('Exit') ? 'selected' : ''}>Exit</option>
<option value="Continue" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('Continue') ? 'selected' : ''}>Continue</option>
<option value="TooFar" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('TooFar') ? 'selected' : ''}>TooFar</option>
 </c:otherwise>
</c:choose>

</select>
</td>
<td class="even">
<select id="CFsrchType1" style="color:#000000; padding:2px;" name="srchType">
<c:choose>

<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co')}">
<option  value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="CONTAINS" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('CONTAINS') ? 'selected' : ''}>CONTAINS</option>
<option  value="STARTSWITH" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('STARTSWITH') ? 'selected' : ''}>STARTSWITH</option>
<option value="ENDSWITH" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('ENDSWITH') ? 'selected' : ''}>ENDSWITH</option>
<option value="EQUALS" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('EQUALS') ? 'selected' : ''}>EQUALS</option>
</c:when>
 <c:otherwise>
<option  value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="Contains" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('Contains') ? 'selected' : ''}>Contains</option>
<option  value="StartsWith" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('StartsWith') ? 'selected' : ''}>StartsWith</option>
<option value="EndsWith" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('EndsWith') ? 'selected' : ''}>EndsWith</option>
<option value="Equals" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('Equals') ? 'selected' : ''}>Equals</option>
 </c:otherwise>
</c:choose>

</select>
</td>
<input type="hidden" name="deleteFlag" id="deleteFlag" value="no">
</tr>

<c:choose>  
        <c:when test="${cssTrClassname3=='even'}">  
             <c:set var="cssTrClassname3" value="odd"/>
             </c:when>  
             <c:otherwise>  
             <c:set var="cssTrClassname3" value="even"/>
             </c:otherwise>  
</c:choose>  
</c:if>
</c:forEach>
<c:if test="${CFRowCount gt 0}">
 <script>
 document.getElementById("CFSetButton").style.display = "none";
</script>
</c:if>
</table>
</div>




<div style="margin-bottom:60px;">
<table width="100%" border="0" cellspacing="0" cellpadding="10" style="border-collapse: separate; border:1px solid #ccc;">
  <tr>
    <td width="60%" bgcolor="#fff" style="font-size:13px;"><strong>OPEX Identification</strong></td>
    <td width="40%" align="right" valign="middle" bgcolor="#fff">
   <select name="OPEXTags" id="OPEXTags" style="color:#000000; padding:8px 8px 7px 8px !important; font-size:13px;">
    <c:choose>
    <c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co') || fn:toLowerCase(parserName)==fn:toLowerCase('Enhanced Public Parser')}">
    <option value="Algorithm">Algorithm</option>
    <option value="TableIdentifier">TableIdentifier</option>
    <option value="Instance">Instance</option>
    <option value="BEGIN">BEGIN</option>
	<option value="PROGRESS">PROGRESS</option>
	<option value="END">END</option>

</c:when>
    <c:otherwise>
    <option value="Algorithm">Algorithm</option>
    <option value="ID">ID</option>
    <option value="Instance">Instance</option>
    <option value="Begin">Begin</option>
	<option value="Progress">Progress</option>
	<option value="End">End</option>
 </c:otherwise>
	</c:choose>
   </select> 
   
     <a href="javascript:void();" class="btn btn-sm btn-info" style="padding:3px 10px; margin-top:-5px;" onClick="addTableRow($('#OPEXTable'));">Add a New Tag</a>
     <a href="Javascript:void('0');" class="btn btn-sm btn-info" style="padding:3px 10px; margin-top:-5px;" onClick="addTableSet($('#OPEXTable'));" id="OPEXSetButton">New Tag Set</a>
     </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="5"  style="border-collapse: separate;  border-spacing:1px;" bgcolor="#ebebeb" id="OPEXTable">
  <tr class="throw row-bg">
    <td width="2%" ><input type="checkbox" name="OPEXMastercheckbox" id="OPEXMastercheckbox"></td>
    <td width="20%" ><strong>Name</strong></td>
    <td width="28%" align="left" ><strong>Value</strong></td>
    <td width="21%" align="left" ><strong>Form Inclusive / Exclusive</strong></td>
    <td width="14%" align="left" ><strong>Action</strong></td>
    <td width="15%" align="left" ><strong>Search Type</strong></td>
  </tr>
  
  
  

<c:set var="cssTrClassname4" value="even"/>
<c:set  var="OPEXRowCount" value="0"/>
  
  <c:forEach items="${extractor_rule_list}" var="extractor_rule_list">   
  
  <c:if test="${fn:toLowerCase(extractor_rule_list.etrbc_tableType)==fn:toLowerCase('OPEX')}">
 <c:set var="OPEXRowCount" value="${OPEXRowCount + 1}" scope="page"/>
  <tr class='${cssTrClassname3}'>
  <td>
  
<%--   <input type="hidden" name="id" id="id" value= "${extractor_rule_list.id}"/>
 --%>  <input type="hidden" name="etrbc_Id" id="etrbc_Id" value= "${extractor_rule_list.etrbc_Id}"/>
  <input type="hidden" name="tableType" id="'+tableTag+'tableType'+rowCount+'" value= "${extractor_rule_list.etrbc_tableType}"/>
  
  
  <input type="checkbox" name="checkbox4" id="checkbox4" class="OPEXcheckbox4">
  </td>
 	 <td class="even">
	
	
	<select id="OPEXTags1" style="color:#000000; padding:2px;" name="tag">
		<c:choose>
    	<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co') || fn:toLowerCase(parserName)==fn:toLowerCase('Enhanced Public Parser')}">
    	<option value="Algorithm" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Algorithm') ? 'selected' : ''}>Algorithm</option>
		<option value="TableIdentifier" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('TableIdentifier') ? 'selected' : ''}>TableIdentifier</option>
	 	<option value="Instance" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) ==fn:toLowerCase('Instance') ? 'selected' : ''}>Instance</option>
	 	<option value="BEGIN" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('BEGIN') ? 'selected' : ''} >BEGIN</option>
		<option value="PROGRESS" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('PROGRESS') ? 'selected' : ''}>PROGRESS</option>
		<option value="END" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('END') ? 'selected' : ''}>END</option>
    	</c:when>
    <c:otherwise>
        <option value="Algorithm" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Algorithm') ? 'selected' : ''}>Algorithm</option>
		<option value="ID" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('ID') ? 'selected' : ''}>ID</option>
	 	<option value="Instance" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) ==fn:toLowerCase('Instance') ? 'selected' : ''}>Instance</option>
	 	<option value="Begin" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Begin') ? 'selected' : ''} >Begin</option>
		<option value="Progress" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('Progress') ? 'selected' : ''}>Progress</option>
		<option value="End" ${fn:toLowerCase(extractor_rule_list.etrbc_tag) == fn:toLowerCase('End') ? 'selected' : ''}>End</option>
    </c:otherwise>
	</c:choose>
		
	</select>
</td>
<td class="even">
<input id="OPEXxvalue1" type="text" style="width:96%" name="xvalue" value="${extractor_rule_list.etrbc_value}">
</td>
<td class="even">

<select id="OPEXinclusive1" style="color:#000000; padding:2px;" name="inclusive">
<option value="N"  ${fn:toLowerCase(extractor_rule_list.etrbc_inclusive) == fn:toLowerCase('N') ? 'selected' : ''}>N</option>
<option value="Y" ${fn:toLowerCase(extractor_rule_list.etrbc_inclusive) == fn:toLowerCase('Y') ? 'selected' : ''}>Y</option>
</select>

</td>
<td class="even">
<select id="OPEXaction1" style="color:#000000; padding:2px;" name="action">
<c:choose>
	<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co')}">
 	<option value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="EXIT" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('EXIT') ? 'selected' : ''}>EXIT</option>
<option value="CONTINUE" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('CONTINUE') ? 'selected' : ''}>CONTINUE</option>
<option value="TOOFAR" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('TOOFAR') ? 'selected' : ''}>TOOFAR</option>
</c:when>
    <c:otherwise>
 <option value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="Exit" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('Exit') ? 'selected' : ''}>Exit</option>
<option value="Continue" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('Continue') ? 'selected' : ''}>Continue</option>
<option value="TooFar" ${fn:toLowerCase(extractor_rule_list.etrbc_action) == fn:toLowerCase('TooFar') ? 'selected' : ''}>TooFar</option>
 </c:otherwise>
</c:choose>

</select>
</td>
<td class="even">
<select id="OPEXsrchType1" style="color:#000000; padding:2px;" name="srchType">
<c:choose>

<c:when test="${fn:toLowerCase(parserName)==fn:toLowerCase('SEC Public Co')}">
<option  value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="CONTAINS" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('CONTAINS') ? 'selected' : ''}>CONTAINS</option>
<option  value="STARTSWITH" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('STARTSWITH') ? 'selected' : ''}>STARTSWITH</option>
<option value="ENDSWITH" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('ENDSWITH') ? 'selected' : ''}>ENDSWITH</option>
<option value="EQUALS" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('EQUALS') ? 'selected' : ''}>EQUALS</option>
</c:when>
 <c:otherwise>
<option  value="NA" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('NA') ? 'selected' : ''}>NA</option>
<option value="Contains" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('Contains') ? 'selected' : ''}>Contains</option>
<option  value="StartsWith" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('StartsWith') ? 'selected' : ''}>StartsWith</option>
<option value="EndsWith" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('EndsWith') ? 'selected' : ''}>EndsWith</option>
<option value="Equals" ${fn:toLowerCase(extractor_rule_list.etrbc_searchType) == fn:toLowerCase('Equals') ? 'selected' : ''}>Equals</option>
 </c:otherwise>
</c:choose>

</select>
</td>
<input type="hidden" name="deleteFlag" id="deleteFlag" value="no">
</tr>

<c:choose>  
        <c:when test="${cssTrClassname4=='even'}">  
             <c:set var="cssTrClassname4" value="odd"/>
             </c:when>  
             <c:otherwise>  
             <c:set var="cssTrClassname4" value="even"/>
             </c:otherwise>  
</c:choose>  
</c:if>
</c:forEach>

<c:if test="${OPEXRowCount gt 0}">
 <script>
 document.getElementById("OPEXSetButton").style.display = "none";
</script>
</c:if>
</table>
</div>
