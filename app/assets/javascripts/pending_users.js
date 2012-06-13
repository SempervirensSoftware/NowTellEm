function validatePendingSignup()
{	
	if (!validatePendingSignupPassword())
	{
		return false;
	}
						
	if (!validatePendingSignupConfirmation())
	{
		return false;
	}

	return true;
}


function validatePendingSignupPassword()
{
	var password = $("#user_password").val();

	if (password && password.length > 5) {
		$("#user_password").removeClass("error");
		$("#user_password_error").addClass("removed");
		return true;
 	}
	else
	{			
		if (!password)
		{
			$("#user_password_error").html("A password is required");	
		}
		else
		{
			$("#user_password_error").html("Your password must be at least 6 characters");	
		}
		
		$("#user_password").addClass("error");			
		$("#user_password_error").removeClass("removed");
		return false;
	}
}

function validatePendingSignupConfirmation()
{
	var password = $("#user_password").val();
	var confirmation = $("#user_password_confirmation").val();

	if (confirmation && (confirmation === password)) {
		$("#user_password_confirmation").removeClass("error");
		$("#user_password_confirmation_error").addClass("removed");
		return true;
 	}
	else
	{			
		if (!confirmation)
		{
			$("#user_password_confirmation_error").html("A password confirmation is required");	
		}
		else
		{
			$("#user_password_confirmation_error").html("The password and confirmation don't match");	
		}
		
		$("#user_password_confirmation").addClass("error");	
		$("#user_password_confirmation_error").removeClass("removed");
		return false;
	}
}