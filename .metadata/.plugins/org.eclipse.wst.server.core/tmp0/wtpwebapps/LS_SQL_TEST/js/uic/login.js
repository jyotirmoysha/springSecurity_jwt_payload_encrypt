function encryptPassword()
{	
    if($('#j_password').val() == "" && $('#j_username').val() == ""){
    	$('.error').hide();
		$('.error_message').show().text('Please enter username and password.');
		return false;
	}else if($('#j_username').val() == ""){
		$('.error').hide();
		$('.error_message').show().text('Please enter username.');
		return false;
	}else if($('#j_password').val() == ""){
		$('.error').hide();
		$('.error_message').show().text('Please enter password.');
		return false;
	} else {
		$('.error_message').hide();
	}
	
	var numVal1 = parseInt($("#R1").val());
	var numVal2 = parseInt($("#R2").val());
	var numVal3 = parseInt($("#R3").val());
	var text = $("#j_password").val();
	var c1 = text.charCodeAt(0);
	
	l = (((c1 * numVal1 + 4 + 7) * numVal2 * 4 - 10) * numVal3 - 11) * 10 + 1;
    s = l+"";
    i = s.length;
    var s1 = i;
    encodedMessage = s1 + s;
    j = text.length;

	for(var k = 1; k < j; k++)
	{
	    var c3 = text.charCodeAt(k);
	    l1 = (((c3 * numVal1 + 4 + 7) * numVal2 * 4 - 10) * numVal3 - 11) * 10 + 1;
	    var s3 = l1+'';
	    i1 = s3.length;
	    var s4 = i1;
	    var s5 = l1;
	    encodedMessage = encodedMessage + s4 + s5;
	}
	
	$("#j_password").val(encodedMessage+"~"+numVal1+"R"+numVal2+"R"+numVal3);
	
	return true;
}


function submitLoginForm() {
	
	if($('#j_password').val() == "" && $('#j_username').val() == ""){
		$('.error_message').show().text('Please enter username and password.');
	}else if($('#j_username').val() == ""){
		$('.error_message').show().text('Please enter username.');
	}else if($('#j_password').val() == ""){
		$('.error_message').show().text('Please enter password.');
	} else {
		$('.error_message').hide();
		$('#loginForm').submit();
	}
	
}

