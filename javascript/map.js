// // console.log('---------------TASK:-1-----------');
// // const nums = [2,3,4,5,6];
// // //const numscopy=[...nums];
// // const arr =nums.map(function(element){
// // 	return element*element;
// // })
// // console.log('original array:- ',nums);
// // console.log('arrays square:- ',arr);


// console.log('---------------TASK:-A1.2-----------');
// const nums1 = [2,3,10,-5,0,-22,4,5,6];
// const num = nums1.map(function(element){
// 	if(element>=0)
// 		return element;
// 	else
// 		return -1*element;
// });
// console.log('absolute values are:- ',num);

// console.log('---------------TASK:-A1.3-----------');
// const names = ["meenu","deepu","maairaSignh","pia"];
// const arr1 = names.map(function(element){
// 	return '<p>' + element +'<p>';
// });
// console.log(arr1);


// console.log('---------------TASK:-A1.4-----------');
// const strArr = ["meenu","deepu","maairaSignh","pia"];
// let maxlen =3;
// const arr = strArr.map(function(element){
// 	if(element.length<=maxlen)
// 		return element;
// 	else
// 		return element.substring(0,maxlen);
// });
// console.log(arr);

// console.log('---------------TASK:-A1.5-----------');
// const prods= [
// {name:'Pepsi', qty:20,price:15},
// {name:'coke', qty:15,price:10},
// {name:'maggi', qty:10,price:12},
// {name:'const', qty:6,price:60},
// {name:'perk', qty:20,price:15},
// ];
// const ar=prods.map(function(element){
// 	let v1 = element.qty*element.price;
// 	let json1 ={name: element.name, value:v1};
// 	return json1;
// });
// ar.sort(compAscval);
// console.log(ar);

// function compAscval(p1,p2){
// 	if(p1.value>p2.value)
// 		return -1;
// 	else if(p1.value<p2.value)
// 		return 1;
// 	else
// 		return 0;
// }

// console.log('---------------TASK:-A1.6--------');
// const strNameArr = ["meenu","deepu","maairaSignh","pia"];
// const makeArr =strNameArr.map(function(element){
// 	return makeNameJSON(element);
// });
// function makeNameJSON(name){
// 	let index = name.indexOf(' ');
// 	let json={};
// 	if(index<0){
// 		json.fistName = name;
// 		json.lastName = '';
// 	}
// 	else{
// 		json.fistName = name.substring(0,index);
// 		json.lastName =name.substring(index+1);
// 	}
// 	return json;
// }
// console.log('make names are:-->>> ',makeArr);




// // console.log('---------------TASK:-B1.1-----------');
// console.log('---------------TASK:-B1.3-----------');
// const newnum = [4,8,12,3,5,7];
// //const numscopy=[...nums];
// let max =newnum.reduce(function(acc,curr){
// 	if(curr<acc)
// 		return curr;
// 	else
// 		return acc;
// });
// console.log('original array:- ',newnum);
// console.log('smallest num in Array:- ',max);


// console.log('---------------TASK:-B1.4-----------');
// const prods= [
// {name:'Pepsi', qty:20,price:15},
// {name:'coke', qty:15,price:10},
// {name:'maggi', qty:10,price:12},
// {name:'const', qty:6,price:60},
// {name:'perk', qty:20,price:15},
// ];
// const ar=prods.reduce(function(acc,curr){
// 	let v1 = acc.qty*acc.price;
// 	let accValue=acc.qty*acc.price;
// 	if(v1>accValue)
// 		return element;
// 	else
// 		return acc;
// });
// //ar.sort(compAscval);
// console.log(ar);

// console.log('---------------TASK:-B1.1-----------');
// const nums =[2];
// let sum = nums.reduce(function(acc,curr){
// 	let cube = curr*curr*curr;
// 	return acc+cube;
// },0);
// console.log(sum);

// console.log('---------------TASK:-2-----------');
// const numss = [4,8,12,20,6];
// //const numscopy=[...nums];
// const arrr =numss.map(function(element){
// 	return element*2;
// })
// console.log('original array:- ',numss);
// console.log('arrays twice:- ',arrr);

// console.log('---------------TASK:-3-----------');
// const sqrArr = [4,8,12,20,6];
// //const numscopy=[...nums];
// const resArr =sqrArr.map(function(element){
// 	return element*element;
// })
// console.log('original array:- ',sqrArr);
// console.log('arrays square:- ',resArr);


// console.log('---------------TASK:-4-----------');
// const numbers = [4,8,12,3,5,7];
// //const numscopy=[...nums];
// const arco =numbers.map(function(val){
// 	if(val%2==0)
// 		return val;
// 	else
// 		return 0;
// 	//return element*element;
// })
// console.log('original array:- ',numbers);
// console.log('o wali aarre:- ',arco);

// console.log('---------------TASK:-5-----------');
// const numbers1 = [4,8,12,3,5,7];
// let v1='Even';
// let v2='Odd';
// //const numscopy=[...nums];
// const arco1 =numbers1.map(function(val){
// 	if(val%2==0)
// 		return v1;
// 	else
// 		return v2;
// 	//return element*element;
// })
// console.log('original array:- ',numbers1);
// console.log('Even Odd Array:- ',arco1);



// console.log('---------------TASK:-6-----------');
// const doublestrArr = ["meenu","deepu","maairaSignh","pia"];
// let maxlen1 =doublestrArr.length;
// let newS='';

// const doublestr = doublestrArr.map(function(values){
// 	return values+values;

// });
// console.log('doublestr:-  ',doublestr);


// console.log('---------------TASK:-7-----------');
// const namesunique =  [{"name" : "Mark", "age" : 23},
// {"name" : "Steve", "age" : 28},
// {"name" : "Mary", "age" : 25},
// {"name" : "Bill", "age" : 34}];
// const namesuniquearr1 = namesunique.map(function(element){
// 	return  element.name +'is'+element.age+'years old.';
// });
// console.log(namesuniquearr1);

// console.log('---------------TASK:-8-----------');
// const namesunique =  ["Mark","James","Martha"];
// const namesuniquearr1 = namesunique.map(function(element){
// 	return '<ul><li>' + element +'</li><li>';
// });
// console.log(namesuniquearr1);


// console.log('---------------TASK:-10-----------');
// const namesunique =  [{"id" : 101, "name" : "Mark"},
// {"id" : 105, "name" : "Steve"},
// {"id" : 78, "name" : "James"}];
// const namesuniquearr1 = namesunique.map(function(element){
// 	return '<p class=id'+ element.id +'>Mark</p>' ;
// });
// console.log(namesuniquearr1);

// console.log('---------------TASK:-11-----------');
// const namesunique =  [{name:"Mary",marks:72},
// {name:"Anita",marks:75},
// {name:"Thomas", marks:81},
// {name:"Bruce", marks:64}];
// const namesuniquearr1 = namesunique.map(function(element){
// 	return ' <tr><td> '+ element.name +' </td><td> '+
// 	element.marks + " </td><td><button onClick=show( "+element.name+")>Show More</button>" ;
// });
// console.log(namesuniquearr1);


// console.log('---------------TASK:-11-----------');
// const namesunique =  [{fname:"Jack",lname:"Smith",city:"London"},
// {fname:"Mary",lname:"Markle",city:"Amsterdam"},
// {fname:"Ed",lname:"May",city:"Paris"},
// {fname:"Tim",lname:"Gates",city:"Rome"}];
// const namesuniquearr1 = namesunique.map(function(element){
// 	return element.city;
// });
// console.log(namesuniquearr1);

// console.log('---------------TASK:-12-----------');
// const namesunique =  [{fname:"Jack",lname:"Smith",city:"London"},
// {fname:"Mary",lname:"Markle",city:"Amsterdam"},
// {fname:"Ed",lname:"May",city:"Paris"},
// {fname:"Tim",lname:"Gates",city:"Rome"}];
// const namesuniquearr1 = namesunique.map(function(element){
// 	return element.fname +' '+element.lname;
// });
// console.log(namesuniquearr1);
// console.log('---------------TASK:-13-----------');
// const sumnum = [1, 2, 3].reduce(add,0); // with initial value to avoid when the array is empty

// function add(accumulator, a) {
//     return accumulator + a;
// }

// console.log(sumnum);

// console.log('---------------TASK:-14.2-----------');
// const sumnum2 = [1, 2, 3,5,9,16];// with initial value to avoid when the array is empty
// let adtion =sumnum2.reduce(function add(acc, curr) {
//    if(curr>acc)
//    	return curr;
//    else
//    	return acc;
// },0);
// console.log('max number:- ',adtion); 



// console.log('---------------TASK:-14.3-----------');
// const sumnum33 = [1, 2, 3,5,9,16];// with initial value to avoid when the array is empty

// let adtionn =sumnum33.reduce(function add(acc, curr) {
//    if(curr<acc)
//    	return curr;
//    else
//    	return acc;
// });
// console.log('min number:- ',adtionn); 


// console.log('---------------TASK:-14.4---------');
// const sumnum3 = [1, 2, 3,5,19,16];// with initial value to avoid when the array is empty
// let count=0;

// let adtion1 =sumnum3.reduce(function add(acc) {
//    if(acc>10)
//    	 count++;
//    else
//    	return 0;
// });
// console.log('min number:- ',adtion1);


// console.log('---------------TASK:-14.1-----------');
// const sumnum = ['reema', 'neha', 'rohan'].reduce(add); // with initial value to avoid when the array is empty

// function add(accumulator,a) {
//     return accumulator + '::'+a;
// }
// console.log(sumnum);
// var authorString = sumnum.join("::");
// console.log(authorString);

// console.log('---------------TASK:-15.2-----------');
//  const names = ["Reema", "Neha", "Rohan"]; // with initial value to avoid when the array is empty
// let val = names.reduce(function(acc,curr){
// 	return acc+curr[0]+':';
// },'');
// console.log(val);


// console.log('---------------TASK:-15.3-----------');
//  const names = ["Reema", "Neha", "Rohan"]; // with initial value to avoid when the array is empty
// let val = names.reduce(function(acc,curr){
// 	return acc+curr[0].length;
// },'');
// console.log(val);



// console.log('---------------TASK:-16-----------');
// const namesunique =  [{name : "Mark", age : 23},
// {name : "Steve", age : 28},
// {name : "Mary", age : 25},
// {name : "Bill", age : 34}];
// let count=0;
// for(i=0;i>=namesunique.length;i++)
// {
// 	if(namesunique.age>27)
// 		count=count+1;
// 	else
// 		console.log('ff');
// }
// console.log(count);
// const totalTaxes = namesunique.filter(function (element) {
//     return element.age;
// })<27;
// const totalTaxes = namesunique.reduce(function (sum, tax) {
//     return sum + tax.age;
// }, 0);


// console.log('---------------TASK:-17.1-----------');
// const names = ["Hello", "React", "Java", "Python", "Hibernate", "JavaScript"];
// let arr =[];
// let val = names.reduce(function(acc,curr){
// 	return acc+curr+'#';
// },'');

// console.log(val);

// console.log('---------------TASK:-17.2-----------');
// const names = ["Hello", "React", "Java", "Python", "Hibernate", "JavaScript"];
// let val = names.reduce(function(acc,curr){
// 	let count =0;
// 	return acc+curr+'#';
// },'');
// console.log(val);


// console.log('---------------TASK:-17.3-----------');
// const names = ["Hello", "React", "Java", "Python", "Hibernate", "JavaScript"];
// let val1= '';
// if(names.length>0)
//    val1=names[0];
// let larstr= names.reduce(function(acc,curr){
// 	if(curr.length>acc.length)
// 		return curr;
// 	else
// 		return acc;
// },val1);
// console.log(larstr);

// console.log('---------------TASK:-17.3-----------');
// const names = ["Hello", "React", "Java", "Python", "Hibernate", "JavaScript"];
// let val1= 'a';

// console.log(("str1,str2,str3,str4".match(new RegExp("str", "g")) || []).length);



// console.log('---------------TASK:-17.4-----------');
//  const names = ["Reema", "Neha", "Rohan"];
//  let count =0; // with initial value to avoid when the array is empty
// let val = names.reduce(function(acc,curr){
// 	if(curr[0]=='a')
// 	   return 555;
// 	else
// 		return 666;
// },'');


// console.log(val);


// console.log('---------------TASK:-17.4-----------');
// function hasB(str){
// 	let lenstr = str.length;
// 	for(let i=0;i<lenstr;i++){
// 		if(str[i]=='A' || str[i]=='a'){
// 			console.log('0');
// 		}else if(str[i]=='J' || str[i]=='j'){
// 			console.log('2');
// 		}else if(str[i]=='R' || str[i]=='r'){
// 			console.log('1');
// 		}
// 	}
// }
//  const strings = ["Reema", "Neha", "Rohan"];
//  let stringCopy=[...strings];
//  let count ; 
//  let len = strings.length; // with initial value to avoid when the array is empty
// for(let i=0;i<len;i++){
// 	count=hasB(strings[i]);
// }

// console.log('---------------TASK:-18.1---------');
// const person=[{"name":"Jack","maths":55,"english":60,"science":62},
// {"name":"Anita","maths":62,"english":65,"science":56},
// {"name":"Thomas","maths":68,"english":72,"science":75},
// {"name":"Steve","maths":51,"english":56,"science":68},
// {"name":"Julia","maths":47,"english":77,"science":72},
// {"name":"Mary","maths":72,"english":55,"science":81}];
//  var result = person.reduce(function(a, b) {
//           return a + b.maths
//       }, 0);
// console.log(result);
// console.log('---------------TASK:-18.1---------');
// const person=[{"name":"Jack","maths":55,"english":60,"science":62},
// {"name":"Anita","maths":62,"english":65,"science":56},
// {"name":"Thomas","maths":68,"english":72,"science":75},
// {"name":"Steve","maths":51,"english":56,"science":68},
// {"name":"Julia","maths":47,"english":77,"science":72},
// {"name":"Mary","maths":72,"english":55,"science":81}];
// let targetMarks=60;
// let count=0;
// var  minMaxArray = person.reduce(
//         (accumulator, currentValue) => {
//              return (60 < currentValue.science ? accumulator : currentValue);
//         }
//     );
// console.log(minMaxArray);


//var  minMaxArray = shots.reduce((acc, shot) => acc = acc > shot.english ? acc : shot.english, 0);
//console.log(sum1);



// console.log('---------------TASK:-18.3---------');

// const performance=[
// {name:'Mark',Maths:80,English:75,Science:63,Computers:90},
// {name:'Bob',Maths:30,English:81,Science:88,Computers:50},
// {name:'Julia',Maths:88,English:87,Computers:88},
// {name:'MaAnothny',Maths:60,English:64,Computers:75},
// ];
// let class1 ={
// 	name:'bca',
// 	marks:performance
// }

// console.log(performance);
// function computeMarks(compJSON){
// 	let stArr = compJSON.performance;
// 	let total=0;
// 	for(let i=0;i<performance.length;i++){
// 		let stu=performance[i];
// 		total=total+stu.Maths;
// 	}
// 	return total;
// }
// let totmarks = computeMarks(class1);
// console.log(totmarks);


// onsole.log('---------------TASK:-18.3---------');

// const performance=[
// {name:'Mark',Maths:80,English:75,Science:63,Computers:90},
// {name:'Bob',Maths:30,English:81,Science:88,Computers:50},
// {name:'Julia',Maths:88,English:87,Computers:88},
// {name:'MaAnothny',Maths:60,English:64,Computers:75},
// ];
// let class1 ={
// 	name:'bca',
// 	marks:performance
// }

// console.log(performance);
// function computeMarks(compJSON){
// 	let stArr = compJSON.performance;
// 	let total=0;
// 	for(let i=0;i<performance.length;i++){
// 		let stu=performance[i];
// 		total=total+stu.Maths;
// 	}
// 	return total;
// }
// let totmarks = computeMarks(class1);
// console.log(totmarks);

// const per=[{name:"Mary",city:"London"},
// {name:"Anita",city:"Paris" },
// {name:"Edward",city:"New York"},
// {name:"Thomas",city:"Rome"},
// {name:"Robin",city:"Seattle"},
// {name:"Sophia",city:"Los Angeles"},
// {name:"Bruce",city:"Delhi"}];

//  con = [{city:"London",continent:"Europe"},
// {city:"Delhi",continent:"Asia"},
// {city:"Seattle",continent:"North America"},
// {city:"Paris",continent:"Europe"},
// {city:"New York",continent:" North America"},
// {city:"Rome",cont-inent:"Europe"},
// {city:"Bengaluru",continent:"Asia"},
// {city:"Los Angeles",continent:"North America"}]


// let ff = con.filter()


// findContinent = (Continentt) => con.find(({ city }) => city === Continentt).continent, // This line finds the city from "con". I've extracted the function here instead of using .find() inline to prevent repitition. This also means that you can add in some null checks here if you really want.
// sortCountriesByContinent = () => per.sort((a, b) => {
//   return findContinent(a.city).localeCompare(findContinent(b.city)); // Sorts "per" by using the .localeCompare() method and using the findContinent() function we made earlier.
// });

// console.log(sortCountriesByContinent());






// console.log('---------------TASK:-18.5---------');
// const studentDetails=[{"name":"Jack","maths":55,"english":60,"science":62},
// {"name":"Anita","maths":62,"english":65,"science":56},
// {"name":"Thomas","maths":68,"english":72,"science":75},
// {"name":"Steve","maths":51,"english":56,"science":68},
// {"name":"Julia","maths":47,"english":77,"science":72},
// {"name":"Mary","maths":72,"english":55,"science":81}];
// let num= 250;
// let students=studentDetails.reduce(function(a, b){return a + b;
//     }) < num;
// console.log(students);

// console.log('---------------TASK:-19.2---------');
// const studentDetails=[{"fname":"Jack","lname":"Smith","city":"London"},
// {"fname":"Mary","lname":"Markle","city":"London"},
// {"fname":"Ed","lname":"May","city":"Paris"},
// {"fname":"Tim","lname":"Gates","city":"Rome"}];
// let city= studentDetails.find(function(firstName){
// 	return firstName.city;
// });
// console.log(city);
// let num= 250;
// let students=studentDetails.reduce((acc, e) => acc.set(e, (acc.get(e) || 0) + 1), new Map());
// // const groupByAge = studentDetails.reduce((acc, it) => {
//   acc[it.city] = acc[it.city] + 1 || 1;
//   return acc;
// }, {});

//console.log(students);
//console.log(groupByAge);



const studentDetails=[
{"name":"Mary","marks":[72,65,55,71]},
{"name":"Anita","marks":[66,70,75,53]},
{"name":"Edward","marks":[44,54,64,58]},
{"name":"Thomas","marks":[62,55,65,81]},
{"name":"Robin","marks":[41,44,47,49]},
{"name":"Sophia","marks":[71,73,67,77]},
{"name":"Bruce","marks":[52,57,61,64]}
];
let num= 250;
let students=studentDetails.filter(function(sum){
    return sum.marks.reduce(function(a, b){return a + b;
    }) < num;
})
//array.sort(compareFunction)

let meet=studentDetails.reduce(function(acc, curr){
	if(curr>acc)
		return curr;
	else 
		return acc;
    })>70;

console.log(students);
console.log(meet);

