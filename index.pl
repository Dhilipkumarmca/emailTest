#!/usr/bin/perl

use strict;
use warnings;

print "Content-type:text/html\n\n";
print <<HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Email notification</title>
<script type="text/javascript">
function val()
{
	var email=document.getElementById("email").value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var tres=filter.test(email);
	if(email == "")
	{
		alert("please enter email id");
		return false;
	}
	if(tres == false)
	{
		alert("Please enter valid email address");		
		return false;
	}
	var sub=document.getElementById("sub").value;
	if(sub == "")
	{
		var csub=confirm("Subject is empty, Do you like to send mail anyway");
		if(csub == false)
		{
			return false;
		}
	}
	var msg=document.getElementById("msg").value;

	if(msg == "")
	{
		var msub=confirm("Message body is empty, Do you like to send mail anyway");
		if(msub == false)
		{
			return false;
		}
	}
	
}
</script>
<style>
textarea
{
   resize: none;
}
</style>
</head>
<body>
<form name="efrm" action="eperl.pl" method="GET">
<table>
<tr><td>Email:</td><td><input type="text" name="email" id="email" /></td></tr>
<tr><td>Subject:</td><td><input type="text" name="sub" id="sub" /></td></tr>
<tr><td>Message:</td><td><textarea name="msg" id="msg" cols="70" rows="10"></textarea></td></tr>
<tr><td colspan="2" align="center"><input type="submit" id="submit" value="Send" onclick="return val()" /></td></tr>
</table>
</form>
</body>
</html>

HTML
