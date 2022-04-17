// let mult1 = function (x,y){
// 	console.log('function expression');
// 	return x*y;
// 	// body...
// }

// let mult2 = (x,y)=>{
// 	console.log('Arrow function 1');
// 	return x*y;
// }
// console.log(mult1(2,3));
// console.log(mult2(2,3));




// let mult3 =(x,y)=> x*y;
// console.log(mult3(2,3));

// let double1 = function(x){
// 	console.log("one parameter arrow function ");
// 	return 2*x;
// }
// console.log(double1(4));

// let double2= (x) => {
// 	console.log('Arrow function 1');
// 	return 2*x;
// }
// console.log(double2(4));

// let double3 =(x) => 2*x;
// console.log('one parameter arrow function',double3(4));





// let getNum = function(){
// 	console.log('function expression');
// 	return 15;
// }

// console.log(getNum());


// let getNum2 = () =>{
// 	console.log('Arrow function');
// 	return 15;
// }
// console.log(getNum2());

// let getNum3 =()=>15;
// console.log(getNum3());




// What is a f,g,h) function expressiong With an example, explain how can we define an anonymous functionh)What arethe advantages of arrow functions


// An arrow function expression is a compact alternative to a traditional function expression, but is limited and can't be used in all situations.

// Differences & Limitations:

// Does not have its own bindings to this or super, and should not be used as methods.
// Does not have new.target keyword.
// Not suitable for call, apply and bind methods, which generally rely on establishing a scope.
// Can not be used as constructors.
// Can not use yield, within its body


// const studentDetails=[
// {id:'A441', sales:[10,12,13,10,16,22,30]},
// {id:'B234', sales:[2,4,3,4,2,6,8,10]},
// {id:'A617', sales:[5,5,5,5,5]},
// {id:'C229', sales:[9,7,6,8,8,10,9,3,4,5,6]},
// {id:'D412', sales:[25,25,23,21]	},
// {id:'A054', sales:[2,2,3,1,5,6,7,11,2]	},
// {id:'B955', sales:[1,1,1,1,1,1]	},
// {id:'M341', sales:[4,5,4,5,4]	},
// {id:'H103', sales:[3,2,2,3,1,1]	},
// {id:'B199', sales:[6,5,4]	},
// {id:'D388', sales:[7,8,9,8,4,4,4,3,2,1]}]
// let num= 250;
// let students=studentDetails.map(function(sum){
//     let vall= meen(sum);
//     let meera = {id:sum.id, totalsale:vall};
//     return meera;
// })
// function meen(e){
// 	return e.sales.reduce(function(a, b){
//     	let v1= a+b;
//     	return v1;
//     },0);
// }
// console.log(students);




// const studentDetails=[
// {id:'A441', sales:[10,12,13,10,16,22,30]},
// {id:'B234', sales:[2,4,3,4,2,6,8,10]},
// {id:'A617', sales:[5,5,5,5,5]},
// {id:'C229', sales:[9,7,6,8,8,10,9,3,4,5,6]},
// {id:'D412', sales:[25,25,23,21]	},
// {id:'A054', sales:[2,2,3,1,5,6,7,11,2]	},
// {id:'B955', sales:[1,1,1,1,1,1]	},
// {id:'M341', sales:[4,5,4,5,4]	},
// {id:'H103', sales:[3,2,2,3,1,1]	},
// {id:'B199', sales:[6,5,4]	},
// {id:'D388', sales:[7,8,9,8,4,4,4,3,2,1]}]
// let num= 250;
// let students=studentDetails.map(function(sum){
//     let vall= meen(sum);
//     let meera = {id:sum.id, maxSale:vall};
//     return meera;
// })
// function meen(e){
// 	return e.sales.reduce(function(acc, curr){
//     	let v1= curr;
//     	let v2=acc;
//     	if(v1>v2)
//     		return curr;
//     	else
//     		return acc;
//     });
// }
// console.log(students);

// let arr = [1,5,7,12,6,10];
// let x = arr.map(val => val*val);
// console.log(x);

// let str = 'meenu';
// console.log(str.toUpperCase());

// let db = (x) => x.toUpperCase();
// console.log(db('anamika'));

// let db = (x,y,z) => {
// 	console.log('ss');
// 	if(x==y==z)
// 		return true;
// 	else
// 		return false;
// }
// console.log(db(2,4,3));


// function removeCharRecursive(str,X)
// {
	
	
// 	if (str.length == 0)
// 	{
// 		return "";
// 	}
// 	if (str.charAt(0) == X)
// 	{

// 		return removeCharRecursive(
// 			str.substring(1), X);
// 	}
// 	return str.charAt(0) +
// 		removeCharRecursive(
// 		str.substring(1), X);
// }

// var str = "geeksforgeeks";
// var X = 'e';
// str = removeCharRecursive(str, X);
// console.log(str);


// function remove_character(str_to_remove, str) {
//   let reg = new RegExp(str_to_remove)
//   return str.replace(reg, '')
// }

// console.log(remove_character('hello', 'helloworld'))

// let sum = ('x': number, 'y': number): number => {
//     return x + y;
// }

// sum(10, 20);

// function Person(stringg1, stringg2) {
//   this.stringg1 = stringg1;
//   this.stringg2 = stringg2;
// }
// const person1 = new Person('Arfat','Ruhaan');
// console.log(person1); 
// const arr = prods.map(function(element){
// 	let v1 = element.price;
// 	let json1 = {name: element.name, value:v1};
// 	return json1;
// });
// arr.sort(compAscValue);
// console.log(arr);


// let arr = [1,54,7,12,6,10];
// let x= arr.find(val => val%2==0);
// console.log(x);

//console.log('------task 2d----');
// let numbers = [56, 1 , 8, 3, 10, 20, 30 ];
// numbers.sort(( a , b)=>{
//     if(a > b) return -1;
//     if(a < b) return 1;
//     return 0;
// });

// console.log(numbers);


// console.log('------task 2e----');
// const array1 = [1, 4, 9, 16];

// // pass a function to map
// const map1 = array1.map(x => x * 2);

// console.log(map1);



// function sum_sq(array) {
//   var sum = 0, 
//       i = array.length;
//   while (i--) 
//    sum += Math.pow(array[i], 2);
//   return sum;
// }
 
// console.log(sum_sq([0,1,2,3,4])); 



// let numbers = [1, 2, 3, 4, 5];

// console.log(numbers.find(e => e % 2 == 0));

// var arr1 = [1,2,3,4],
//     arr2 = [2,4],
//     res = arr1.filter(item => !arr2.includes(item));
// console.log(res);

// const array1 = [1, 4, 9, 16];

// // pass a function to map
// const map1 = array1.map(x => x * 2);

// console.log(map1);


// let arr=[{"name":"Dave","js":59,"react":64,"node":67},{"name":"George","js":58,"react":82,"node":65},{"name":"William","js":51,"react":56,"node":68},{"name":"Anita","js":62,"react":65,"node":56},{"name":"Thomas","js":68,"react":72,"node":75},{"name":"Steve","js":56,"react":51,"node":63},{"name":"Julia","js":47,"react":77,"node":72},{"name":"Mary","js":72,"react":55,"node":81}]
// let ansarr=arr.map(item=>console.log({Studentname:item.name,GradeJs:item.js<775?(item.js>=60?'B':'C'):'A',Gradereact:item.react<75?(item.react>=60?'B':'C'):'A',GradeNode:item.node<75?(item.node>=70?'B':'C'):'A'}))




// var students = [['David', 80], ['Vinoth', 77], ['Divya', 88], ['Ishitha', 95], ['Thomas', 68]];

// var Avgmarks = 0;

// for (var i=0; i < students.length; i++) {
//         Avgmarks += students[i][1];
//         var avg = (Avgmarks/students.length);
// }

// console.log("Average grade: " + (Avgmarks)/students.length);

//         if (avg < 60){
//           console.log("Grade : F");      
//           } 
//         else if (avg < 70) {
//                 console.log("Grade : D"); 
//                   } 
//         else if (avg < 80) 
//              {
//                 console.log("Grade : C"); 
//         } else if (avg < 90) {
//                 console.log("Grade : B"); 
//         } else if (avg < 100) {
//                 console.log("Grade : A"); 
// }

// var students = [['David', 80], ['Vinoth', 77], ['Divya', 88], ['Ishitha', 95], ['Thomas', 68]];

// var Avgmarks = 0;

// for (var i=0; i < students.length; i++) {
//         Avgmarks += students[i][1];
//         var avg = (Avgmarks/students.length);
// }

// console.log("Average grade: " + (Avgmarks)/students.length);

//         if (avg < 60){
//           console.log("Grade : F");      
//           } 
//         else if (avg < 70) {
//                 console.log("Grade : D"); 
//                   } 
//         else if (avg < 80) 
//              {
//                 console.log("Grade : C"); 
//         } else if (avg < 90) {
//                 console.log("Grade : B"); 
//         } else if (avg < 100) {
//                 console.log("Grade : A"); 
// }








// const array1 = [5, 12, 8, 130, 44];

// const isLargeNumber = (element) => element > 13;

// console.log(array1.findIndex(isLargeNumber));
// console.log([1, 2, 3, 4, 5, 6, 7]
// 	.filter(function(a){return a%3===0;}));




a) What are the difference between let and var

var and let are both used for variable declaration in javascript but the difference between them is that var is function scoped and let is block scoped. It can be said that a variable declared with var is defined throughout the program as compared to let

b)Write down the first example shown for let and var. Also, write down the concept explained in it.

		// calling x after definition
		var x = 5;
		console.log(x, "\n");

		// calling y after definition
		let y = 10;
		console.loge(y, "\n");

		// calling var z before definition will return undefined
		console.log(z, "\n");
		var z = 2;

		// calling let a before definition will give error
		console.log(a);
		let a = 3;
	<

