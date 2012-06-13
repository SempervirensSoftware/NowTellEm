function validateFeedback()
{	
	if (!validateFeedbackEmail())
	{
		return false;
	}
						
	if (!validateFeedbackMessage())
	{
		return false;
	}

	return true;
}


function validateFeedbackEmail()
{
	var emailRegex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	var email = $('#feedback_email').val();
	if (email && emailRegex.test(email)) {
		$("#feedback_email").removeClass("error");
		$("#feedback_email_error").addClass("removed");		
		return true;
	}
	else
	{			
		if (!email)
		{			
			$("#feedback_email_error").html("Recipient email is required");
		}
		else
		{
			$("#feedback_email_error").html("Recipient email is invalid");
		}

		$("#feedback_email").addClass("error");	
		$("#feedback_email_error").removeClass("removed");
		return false;
	}
}

function validateFeedbackMessage()
{
	if ($("#feedback_message").val()) {
		$("#feedback_message").removeClass("error");
		$("#feedback_message_error").addClass("removed");
		return true;
 	}
	else
	{			
		$("#feedback_message").addClass("error");	
		$("#feedback_message_error").html("A message is required");
		$("#feedback_message_error").removeClass("removed");
		return false;
	}
}