console.log('----------assignment task2---');
let m1='82';
let m2= '70';
let m3='66';
let m4= '84';
if(m1>=80){
	console.log('Maths : '+m1 +' : A');
}
else if(m1<80 && m1>=60){
	console.log('Maths : '+m1 +' : B');
}
else if(m1<60 && m1>=40){
	console.log('Maths : '+m1 +' : C');
}
else if(m1<40){
	console.log('Maths : '+m1 +' : D');
}
if(m2>=80){
	console.log('English : '+m2 +' : A');
}
else if(m2<80 && m2>=60){
	console.log('English : '+m2 +' : B');
}
else if(m2<60 && m2>=40){
	console.log('English : '+m2 +'vC');
}
else if(m2<40){
	console.log('English : '+m2 +' : D');
}
if(m3>=80){
	console.log('Computers : '+m3 +' : A');
}
else if(m3<80 && m3>=60){
	console.log('Computers : '+m3 +' : B');
}
else if(m3<60 && m3>=40){
	console.log('Computers : ' +m3 +' : C');
}
else if(m3<40){
	console.log('Computers : '+m3 +' : D');
}
if(m4>=80){
	console.log('Science : '+m4 +' : A');
}
else if(m4<80 && m4>=60){
	console.log('Science : '+m4 +' : B');
}
else if(m4<60 && m4>=40){
	console.log('Science : '+m4 +' : C');
}
else if(m4<40){
	console.log('Science : '+m4 +' : D');
}





console.log('----------assignment task3---');
let str1='456789456789456';
let str2= '1234567890123456789';
if(str1>str2){
	console.log(str1);
}
else if(str2>str1){
	console.log(str2);
}
else if(str2==str1){
	console.log('equal');
}


// <script>
// // Javascript implementation of the approach

// // Function that returns true if str
// // is a valid identifier
// function isValid(str,n)
// {
// 	// If first character is invalid
// 	if (!((str[0] >= 'a' && str[0] <= 'z')
// 		|| (str[0]>= 'A' && str[0] <= 'Z')
// 		|| str[0] == '_'))
// 		return false;

// 	// Traverse the string for the rest of the characters
// 	for (let i = 1; i < str.length; i++)
// 	{
// 		if (!((str[i] >= 'a' && str[i] <= 'z')
// 			|| (str[i] >= 'A' && str[i] <= 'Z')
// 			|| (str[i] >= '0' && str[i] <= '9')
// 			|| str[i] == '_'))
// 			return false;
// 	}

// 	// String is a valid identifier
// 	return true;
// }

// 	// Driver code
// 	let str = "_geeks123";
// 	let n = str.length;

// 	if (isValid(str, n))
// 		document.write("Valid");
// 	else
// 		document.write("Invalid");

// // This code is contributed by patel2127
// </script>





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


console.log('----------assignment task6------------------');

let st ='moenu';
let l=st.length;
let count=0;
for(let i=0;i<=l;i++)
{
	if(str[i]!='')
	{
		count++;
	}
}
console.log(count);


console.log('----------assignment task1------------------');

let str8 ='abC';
let len=str8.length;
//let count1=0;
let newstr ='';
let hash = '#';
for(let i=0;i<len;i++)
{
	 newstr = newstr + str8[i] +hash ;
	 hash = hash + hash;
	
}
console.log(newstr);
//console.log(count);



console.log('----------assignment task5------------------');

let c= 25;
let d=30;
let m = 1070;

let aa = m+d;
//let bb = m+c;
let y0 = aa/c;
let mmm= Math.floor(y0);
//let y1 = bb/c;
console.log('y = ',y0);
//console.log('y2= ',y1);
