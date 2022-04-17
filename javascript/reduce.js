console.log('---------------TASK:-18.1---------');
const studentDetails=[{"name":"Jack","maths":55,english:60,"science":62},
{"name":"Anita","maths":62,english:65,"science":56},
{"name":"Thomas","maths":68,english:72,"science":75},
{"name":"Steve","maths":51,english:56,"science":68},
{"name":"Julia","maths":47,english:77,"science":72},
{"name":"Mary","maths":72,english:55,"science":81}];
let num= 200;
// let students=studentDetails.reduce(
// 	function(a, b){return a + b.english;
//     });
let count=0;
let fruits = [];
let numi=200;
let totalPrice = studentDetails.reduce((total,item)=>{
	console.log('tot are:-'+total+'   itm are:-',item);
	count =count+1;
	//console.log(count)
	return (total+ item.maths);
},0)>numi;
fruits.push(totalPrice);
console.log('cout are:-',count);

console.log(totalPrice);