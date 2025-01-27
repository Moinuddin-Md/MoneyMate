function matchPassword()
{
	var pass=document.getElementById("password").value;
	var cpass=document.getElementById("cpassword").value;
	if(cpass!=pass)
	{
		alert("Confirm password does not match with password");
		return false;
	}
	return true;
}
function makeActive(linkid)
{
	document.getElementById(linkid).style.color='red';
	//document.getElementById(linkid).style.backgroundColor='black';
}
function checkAmountLimit()
{
	if(document.getElementById("amount").value>20000){
		document.getElementById("error").innerHTML="Maximum 20000 is allowed per transaction";
		return false;
	}
	return true;
}
function checkAccountNo()
{
	var san=document.getElementById("san").value;
	var ran=document.getElementById("ran").value;
	if(parseInt(san)==parseInt(ran))
	{
		document.getElementById("msg").innerHTML="This is your own account number";
		return false;
	}
	return true;
}