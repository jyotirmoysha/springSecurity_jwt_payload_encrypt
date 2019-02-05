/*!
 * bootstrap-fileinput v4.4.7
 * http://plugins.krajee.com/file-input
 *
 * Krajee Explorer Font Awesome theme configuration for bootstrap-fileinput. 
 * Load this theme file after loading `fileinput.js`. Ensure that
 * font awesome assets and CSS are loaded on the page as well.
 *
 * Author: Kartik Visweswaran
 * Copyright: 2014 - 2017, Kartik Visweswaran, Krajee.com
 *
 * Licensed under the BSD 3-Clause
 * https://github.com/kartik-v/bootstrap-fileinput/blob/master/LICENSE.md
 */
$(document).ready(function(){
	
	"use strict";
	var teTagBef = '<tr class="file-preview-frame {frameClass}" id="{previewId}" data-fileindex="{fileindex}"' +
	    ' data-template="{template}"', teContent = '<td class="kv-file-content" style="display:none">\n';
	$.fn.fileinputThemes['explorer-fa'] = {
	    layoutTemplates: {
	        preview: '<div class="file-preview {class}">\n' +
	        '    {close}' +
	        '    <div class="{dropClass}">\n' +
	        '    <table id="uploadedTbl" class="table table-bordered table-hover"><tbody class="file-preview-thumbnails">\n' +
	        '    </tbody></table>\n' +
	        '    <div class="clearfix"></div>' +
	        '    <div class="file-preview-status text-center text-success"></div>\n' +
	        '    <div class="kv-fileinput-error"></div>\n' +
	        '    </div>\n' +
	        '</div>',
	        footer: '<td align="left">'+parserDropDown("{caption}")+'</td><td class="file-details-cell"><div class="explorer-caption" title="{caption}">{caption}</div> ' +
	        '</td><td><span class="pull-left" style="padding:5px 10px 0 0">{size}</span><div class="inputHidden"></div>{progress}</td><td class="file-actions-cell">{indicator} {actions}</td>',
	        actions: '{drag}\n' +
	        '<div class="file-actions">\n' +
	        '    <div class="file-footer-buttons">\n' +
	        '        {upload}  {delete} {other} ' +
	        '    </div>\n' +
	        '</div>',
	        zoomCache: '<tr style="display:none" class="kv-zoom-cache-theme"><td>' +
	        '<table class="kv-zoom-cache">{zoomContent}</table></td></tr>',
	        fileIcon: '<i class="fa fa-file kv-caption-icon"></i> '
	    },
	    previewMarkupTags: {
	        tagBefore1: teTagBef + '>' + teContent,
	        tagBefore2: teTagBef + ' title="{caption}">' + teContent,
	        tagAfter: '</td>\n{footer}</tr>\n'
	    },
	    previewSettings: {
	        image: {height: "0"},
	        html: {width: "0", height: "0"},
	        text: {width: "0", height: "0"},
	        video: {width: "0", height: "0"},
	        audio: {width: "0", height: "0"},
	        flash: {width: "0", height: "0"},
	        object: {width: "0", height: "0"},
	        pdf: {width: "0", height: "0"},
	        other: {width: "0%", height: "0"}
	    },
	    frameClass: 'explorer-frame',
	    fileActionSettings: {
	        removeIcon: '<i class="fa fa-ban"></i>',
	        uploadIcon: '<i class="fa fa-upload"></i>',
	        uploadRetryIcon: '<i class="fa fa-repeat"></i>',
	        zoomIcon: '<i class="fa fa-search-plus"></i>',
	        dragIcon: '<i class="fa fa-arrows"></i>',
	        indicatorNew: '<i class="fa fa-plus-circle text-warning"></i>',
	        indicatorSuccess: '<i class="fa fa-check-circle text-success"></i>',
	        indicatorError: '<i class="fa fa-exclamation-circle text-danger"></i>',
	        indicatorLoading: '<i class="fa fa-hourglass text-muted"></i>'
	    },
	    previewZoomButtonIcons: {
	        prev: '<i class="fa fa-caret-left fa-lg"></i>',
	        next: '<i class="fa fa-caret-right fa-lg"></i>',
	        toggleheader: '<i class="fa fa-arrows-v"></i>',
	        fullscreen: '<i class="fa fa-arrows-alt"></i>',
	        borderless: '<i class="fa fa-external-link"></i>',
	        close: '<i class="fa fa-remove"></i>'
	    },
	    previewFileIcon: '<i class="fa fa-file"></i>',
	    browseIcon: '<i class="fa fa-plus"></i>',
	    removeIcon: '<i class="fa fa-trash"></i>',
	    cancelIcon: '<i class="fa fa-ban"></i>',
	    uploadIcon: '<i class="fa fa-upload"></i>',
	    msgValidationErrorIcon: '<i class="fa fa-exclamation-circle"></i> '
	};

	/*main functionalty fileinput upload js */
 fileUplodObj.fileinput({
        	uploadAsync: true,
        	 'allowedFileExtensions': ['pdf','doc','docx','xls','ppt','txt','jpg','jpeg','gif','bmp','tif','xlsx','msg'],
        	'theme': 'explorer-fa',
        	showRemove: true,
        	showUpload: true,
        	showCancel: false,
        	browseIcon: ' ',
        	replaceFileInput: false,
        	slugCallback: function(filename) {
        		return filename;},
           uploadExtraData:function(previewId, index) {
        	   var data = {
        		   parser : $("#"+previewId).find('.selectedVal option:selected').val(),
        		   customerId : $("#customerId").val(),};
                   return data;
                   },
            uploadUrl: uploadFileUrl,
            overwriteInitial: false,
            initialPreviewAsData: true,
            maxFileCount: 10,
           maxFileSize: 100 * 1024,
            msgSizeTooLarge: 'File "{name}" (<b>{size} KB</b>)'
                            + 'exceeds maximum allowed upload size of <b>{100} MB</b>. '
                            + 'Please retry your upload!',
       
        }).on('fileupload', function(event, file, previewId, index) {
        	/*var fName=file.name.trim();
            if(!characterReg.test(fName)){
            	 return {message:'file Name not valid Please cancel selected File'+file.name};	 	
            };*/
        }).on("fileuploaded", function(event, files, previewId, index) {
        	var  finalInput="";
        	var pdfPwdInput="";

          	var uploadedFName=files.response.files[0].orgName;
          	var error=files.response.files[0].error;
            //error validation
          	if(!characterReg.test(uploadedFName) && error != ''){
          		 var referanceError = jQuery("#" + previewId).find(".explorer-caption");
            	 referanceError.after("<div class='errorFile' style='color:#ff0000'>"+error+"</div>");
            }else{
            //valid
            	var pdfPwdFlag=files.response.files[0].filepwdFlag;
            	var inputPdf='<input type="hidden" class="orgfilename"  name="orgfilename" id="orgfilename" value="'+files.response.files[0].orgName+'">' 
    			+'<input type="hidden" name="uploadfilename" class="uploadfilename" id="uploadfilename" value="'+files.response.files[0].name+'" group="" inc.pdf=""><span class="pull-left" style="marign:0 0 0 10px">';  
    			if(pdfPwdFlag=='false'){
    			pdfPwdInput='<input type="hidden" name="filepwd" id="filepwd" value="0" style="width:90px; height:26px !important" class="toggle form-control" placeholder="File Password">';      	
    			}else{
    			pdfPwdInput='<input type="password" class="isPasswordFile" name="filepwd" id="filepwd" value="" style="width:90px; height:26px !important" class="toggle form-control" placeholder="File Password">';      	
    				}
    			pdfPwdInput=pdfPwdInput+'</span>'
    			finalInput=inputPdf+''+pdfPwdInput;
    			  //footer btn replace
    	        var referanceRemoveCls = jQuery("#" + previewId).find(".file-footer-buttons");
             	var removeCls=referanceRemoveCls.find('.kv-file-remove');
             	removeCls.replaceWith('<button type="button" title="Delete" onclick="removeUploaded(this,\'' + files.response.files[0].name + '\',\'' + files.response.files[0].orgName + '\');" class="btn btn-danger"><i class="fa fa-trash"></i>  <span class="hidden-xs">Delete</span></button>');
            }
			//input hidden  progress
	        var referanceComponentInputHiddenCls = jQuery("#" + previewId).find(".inputHidden");
	        referanceComponentInputHiddenCls.before($(finalInput));
	        //remove progress Bar
	        var referanceComponentProgressbar = jQuery("#" + previewId).find(".progress");
	        referanceComponentProgressbar.remove();
	         // final progress bar
           $('.kv-upload-progress').hide();	
           
         	//file delete functionality
        }).on('fileclear', function(event) {
        	  var uloadFilesSize= $('.uploadfilename').size(); 
        	    if(uloadFilesSize>0){
        	    	var abort = false;
        	    	   if ($.confirm("Are you sure you want to delete this file?")) {
        	           deleteAllFiles();
        	           abort=true; 
        	    	   }	   
        	    }
        	    return abort; 
          });
          //cancel uploded  
    		$('.fileinput-cancel-button').click(function () { 
    			fileUplodObj.fileinput('reset');
    		});
		 		
});










