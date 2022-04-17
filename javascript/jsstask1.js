
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