console.log('----------assignment task4-------------------');
function ValidateEmail(mail) 
{
 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(str.value))
  {
    return (true)
  }
    //alert("You have entered an invalid email address!")
    return (false)
}

let str = "@wer.com";
	//let n = str.length;

	if (ValidateEmail(str))
		console.log("Perfect");
	else
		console.log("not Perfect");
