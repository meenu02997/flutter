// //console.log('---------------JS-A2#3 TASK 10-------');


// // const str=["Hi","Hello","Bye","ye"];
// // let len= str.length;
// // let hash = '#';
// // let newstr ='';
// // let count='';
// // for(let i=0;i<len;i++)
// // {
// // 	    newstr = newstr + str[i] +hash ;
// // 		hash = hash + '#';
// // 		count++;
// // }
// // console.log(newstr);

// // console.log('---------------JS-A2#3 TASK 11-------');
// // function myJoin (array, separator) {

// //   let newString = "";

// //   if (separator === undefined) {
// //     separator === "/";
// //   }

// //   for (let i = 0; i < array.length; i++) {
// //     newString += array[i] + separator;
// //   }

// //   return newString;

// // }
// // console.log(myJoin(["Hi","Hello","Bye"], '**'));

// // console.log('---------------JS-A2#3 TASK 12.2-------');
// // //function myJoin (array, separator) {

// //   const nums=["JavaScript","Hello","React","Java","Python","C","Node"];
// //   const numscopy=[...nums];
// //   //nums.sort(computeNumbersAsc);
// //   nums.sort(computeNumbersDsc);
// //   function computeNumbersAsc(num1,num2){
// //   	if(num1>num2)
// //   		return -1;
// //   	else if(num1<num2)
// //   		return 1;
// //   	else
// //   		return 0;
// //   }
// //  function computeNumbersDsc(num1,num2){
// //   	if(num1>num2)
// //   		return 1;
// //   	else if(num1<num2)
// //   		return -1;
// //   	else
// //   		return 0;
// //   }
// //   console.log(numscopy);
// //   console.log('Descending order array');
// //   console.log(nums);












// // console.log('---------------JS-A2#3 TASK 13-------');
// // //function myJoin (array, separator) {

// //   const names=["JavaScript","Hello","React","Java","Python","C","Node"];
// //   const namesCopy=[...names];
// //   //nums.sort(computeNumbersAsc);
// //   names.sort(computeNumbersDsc);
// //   function computeNumbersAsc(name1,name2){
// //   	return name1.localeCompare(name2);
// //   }
// //  function computeNumbersDsc(name1,name2){
// //   	return -1*name1.localeCompare(name2);
// //   }
  
// //   console.log(namesCopy);
// //   console.log('Descending order array');
// //   console.log(names);

// // console.log('---------------JS-A2#3 TASK 15.1-------');

// // const students=[
// // {name:"Jack",maths:55,english:60,science:62},
// // {name:"Anita",maths:62,english:65,science:56},
// // {name:"Thomas",maths:68,english:58,science:54},
// // {name:"Steve",maths:51,english:56,science:68},
// // {name:"Julia",maths:47,english:77,science:72},
// // {name:"Mary",maths:72,english:55,science:60}];
// // console.log('---------------JS-A2#3 TASK 15.1-------');
// // const students=[{"name":"Jack","country":"USA","age":35},
// // {"name":"Amit","country":"India","age":38},
// // {"name":"Edward","country":"USA","age":41},
// // {"name":"Vishal","country":"India","age":30},
// // {"name":"Annie","country":"USA","age":27},
// // {"name":"Preeti","country":"India","age":25},
// // {"name":"Sophie","country":"France","age":29},
// // {"name":"Harpreet","country":"India","age":48},
// // {"name":"Bob","country":"USA","age":21}];
// //  const namesCopy=[...students];
// //  var sorted = students.sort(function IHaveAName(a, b) { // non-anonymous as you ordered...
// //     return b.age < a.age ? 1 // if b should come earlier, push a to end
// //          : b.age > a.age ? -1 // if b should come later, push a to begin
// //          : 0;                   // a and b are equal
// // });
// //  console.log('array before sorting');
// //   console.log(namesCopy);
// //   console.log('Ascending order array');
// //   console.log(students);

//  //nums.sort(computeNumbersAsc);
//  //  students.sort(computeNumbersDsc);
//  //  function computeNumbersAsc(name1,name2){
//  //  	return name1.localeCompare(name2);
//  //  }
//  // function computeNumbersDsc(name1,name2){
//  //  	return -1*name1.localeCompare(name2);
//  //  }






// // const students = [
// // {"name":"Mary","marks":[72,65,55,71]},
// // {"name":"Anita","marks":[66,70,75,53]},
// // {"name":"Edward","marks":[44,54,64,58]},
// // {"name":"Thomas","marks":[62,55,65,81]},
// // {"name":"Robin","marks":[41,44,47,49]},
// // {"name":"Sophia","marks":[71,73,67,77]},
// // {"name":"Bruce","marks":[52,57,61,64]}];
// // //sumArr = marksSum();
// // let sum=0;
// // let minmark =70;
// // let num= 71;
// // let n = students.length;
// // let students1=students.filter(function(sum){
// //     return sum.marks.reduce(
// //     	function(a, b){
// //     	return a + b;
// //     }) /n;
// // })

// // console.log(students1);
// // //   let con = students.filter(function(student){
// //  	 for (let i = 0; i < students[i].marks.length; i++) 
// // 		{
// // 			sum = sum +students[i].marks[i];
// // 		}
// // 		console.log(sum);
// // 		return sum;

// //  })
// // console.log(con);

// //  let Index = students.findIndex(function(student){
// //  	return  student.marks>minmark;
// //  })
// // console.log('Index=  ',Index);

// // // function mum(st){
// // // 	for (let i = 0; i < students[i].marks.length; i++) 
// // // 		{
// // // 			sum = sum +students[i].marks[i];
// // // 		}
// // // 		console.log(sum);
// // // 		return sum;
// // // }
// // // console.log(mum(st));
// // function comuteMarks(compJSON){
// // 	let emArray=compJSON.students;
// // 	let total=0;
// // 	for (let i=0;i<emArray.marks.length;i++){
// // 		let emp = emArray[i];
// // 		total = total+emp.marks;
// // 	}
// // 	return total;
// // }
// // let totmarks = comuteMarks(students);
// // console.log(total);


// // const persons= [{"name":"Jack","country":"USA","age":35},
// // {"name":"Amit","country":"India","age":38},
// // {"name":"Edward","country":"USA","age":41},
// // {"name":"Vishal","country":"India","age":30},
// // {"name":"Annie","country":"USA","age":27},
// // {"name":"Nick","country":"France","age":32},
// // {"name":"Francis","country":"France","age":44},
// // {"name":"Preeti","country":"India","age":25},
// // {"name":"Sophie","country":"France","age":29},
// // {"name":"Harpreet","country":"India","age":48},
// // {"name":"Bob","country":"USA","age":21}];
// //  let country1 ='USA';
// //  let minAge =30;
// // //   let con = persons.filter(function(person){
// // //  	return  person.age>minAge;
// // //  })
// // // console.log(con);

// // //  let Index = persons.findIndex(function(person){
// // //  	return  person.age>minAge;
// // //  })
// // // console.log('Index=  ',Index);
// //   let con = persons.find(function(person){
// //  	return person.country==country1;
// //  })
// // console.log(con);
// // let Index = persons.findIndex(function(person){
// //  	return person.country==country1;
// //  })
// // // console.log('Index=  ',Index);
// //  // let n = person.name;
// //  // let length =n.length;
// // //  let con = persons.find(function(person){
// // //  	return person.name.length<6;
// // //  })
// // // console.log(con);

// // //  let Index = persons.findIndex(function(person){
// // //  	return person.name.length<6;
// // //  })
// // // console.log('Index=  ',Index);
// // //  let con = persons.find(function(person){
// // //  	return person.name.length<6;
// // //  })
// // // console.log(con);

// // //  let Index = persons.findIndex(function(person){
// // //  	return person.name.length<6;
// // //  })
// // // console.log('Index=  ',Index);
// // //  let con = persons.find(function(person){
// // //  	return person.country==country1 && person.age<35;
// // //  })
// // // console.log(con);

// // //  let Index = persons.findIndex(function(person){
// // //  	return person.country==country1 && person.age<35;
// // //  })
// // // console.log('Index=  ',Index);
// // //  let con = persons.find(function(person){
// // //  	return person.country==country1;
// // //  })
// // // console.log(con);

// // //  let Index = persons.findIndex(function(person){
// // //  	return person.country==country1;
// // //  })
// // // console.log('Index=  ',Index);



// // console.log('---------------JS-A2#3 TASK 16.3-------');
// // const students = [
// // {"name":"Mary","marks":[72,65,55,71]},
// // {"name":"Anita","marks":[66,70,75,53]},
// // {"name":"Edward","marks":[44,54,64,58]},
// // {"name":"Thomas","marks":[62,55,65,81]},
// // {"name":"Robin","marks":[41,44,47,49]},
// // {"name":"Sophia","marks":[71,73,67,77]},
// // {"name":"Bruce","marks":[52,57,61,64]}];
// // let cutOFF= 300;
// // let stu=students.filter(function(sum){
// //     return students.sort(function IHaveAName(a, b) {
// //     	return sum.marks.reduce(function(a, b){return a + b;})>cutOFF;
// //     })

// // })
// // console.log(stu);


// //console.log('---------------JS-A2#3 TASK 16.5-------');
// // const students = [
// // {"name":"Mary","marks":[72,65,55,71]},
// // {"name":"Anita","marks":[66,70,75,53]},
// // {"name":"Edward","marks":[44,54,64,58]},
// // {"name":"Thomas","marks":[62,55,65,81]},
// // {"name":"Robin","marks":[41,44,47,49]},
// // {"name":"Sophia","marks":[71,73,67,77]},
// // {"name":"Bruce","marks":[52,57,61,64]}];
// // let minTotal= 300;
// // let stu=students.sort(function IHaveAName(a, b) {

// //     return students.filter(function(sum){
// //     	return sum.marks.reduce(function(a, b){return a + b;});
// //     })

// // })

// // var sorted = stu.sort(function IHaveAName(a, b) { // non-anonymous as you ordered...
// //     return a.stu<b.minTotal ? -1 // if b should come earlier, push a to end
// //          : a.stu>b.minTotal ? 1 // if b should come later, push a to begin
// //          : 0;                   // a and b are equal
// // });

// // console.log(sorted);


// // console.log('---------------JS-A2#3 TASK 17-------');
// // 	function sort(s, n)
// // 	{
// // 		for (let i = 1 ; i < n; i++)
// // 		{
// // 			let temp = s[i];
// // 			let j = i - 1;
// // 			while (j >= 0 && temp.length < s[j].length)
// // 			{
// // 				s[j + 1] = s[j];
// // 				j--;
// // 			}
// // 			s[j + 1] = temp;
// // 		}
// // 	}

// // 	function printArraystring(str, n)
// // 	{
// // 		for (let i = 0; i < n; i++)
// // 			console.log(str[i]+" ");
// // 	}
	
// // 	let arr = ["aa","car","is","going"];
// // 	let n = arr.length;

// // 	sort(arr,n);
// // 	printArraystring(arr, n);





// // console.log('---------------JS-A2#3 TASK 16.2-------');
// // const students = [
// // {"name":"Mary","marks":[72,65,55,71]},
// // {"name":"Anita","marks":[66,70,75,53]},
// // {"name":"Edward","marks":[44,54,64,58]},
// // {"name":"Thomas","marks":[62,55,65,81]},
// // {"name":"Robin","marks":[41,44,47,49]},
// // {"name":"Sophia","marks":[71,73,67,77]},
// // {"name":"Bruce","marks":[52,57,61,64]}];
// //  const namesCopy=[...students];
// //  var sorted = students.sort(function IHaveAName(a, b) { // non-anonymous as you ordered...
// //     return b.marks < a.marks ? -1 
// //          : b.marks > a.marks ? 1 // if b should come later, push a to begin
// //          : 0;                   
// // });
// //  console.log('array before sorting');
// //   console.log(namesCopy);
// //   console.log('Ascending order array');
// //   console.log(students);

// //  var sorted = students.sort(function IHaveAName(a, b) { // non-anonymous as you ordered...
// //     return b. < a.age ? 1 // if b should come earlier, push a to end
// //          : b.age > a.age ? -1 // if b should come later, push a to begin
// //          : 0;                   // a and b are equal
// // });

// // console.log('---------------JS-A2#3 TASK 15.1-------');
// // const students=[{"name":"Jack","country":"USA","age":35},
// // {"name":"Amit","country":"India","age":38},
// // {"name":"Edward","country":"USA","age":41},
// // {"name":"Vishal","country":"India","age":30},
// // {"name":"Annie","country":"USA","age":27},
// // {"name":"Preeti","country":"India","age":25},
// // {"name":"Sophie","country":"France","age":29},
// // {"name":"Harpreet","country":"India","age":48},
// // {"name":"Bob","country":"USA","age":21}];
// //  const namesCopy=[...students];
// //  var sorted = students.sort(function IHaveAName(a, b) { // non-anonymous as you ordered...
// //     return b.age < a.age ? 1 // if b should come earlier, push a to end
// //          : b.age > a.age ? -1 // if b should come later, push a to begin
// //          : 0;                   // a and b are equal
// // });
// //  console.log('array before sorting');
// //   console.log(namesCopy);
// //   console.log('Ascending order array');
// //   console.log(students);

//  //nums.sort(computeNumbersAsc);
//  //  students.sort(computeNumbersDsc);
//  //  function computeNumbersAsc(name1,name2){
//  //  	return name1.localeCompare(name2);
//  //  }
//  // function computeNumbersDsc(name1,name2){
//  //  	return -1*name1.localeCompare(name2);
//  //  }


// // console.log('---------------JS-A2#3 TASK 19-------');


// // function hasA(str){
// // 	let lenstr = str.length;
// // 	for(let i=0;i<lenstr;i++){
// // 		if(str[i]=='a' || str[i]=='A'){
// // 			return true;

// // 		}
// // 	}
// // 	return false;
// // }


// // const strings=["aa","car","is","going"];
// //  const namesCopy=[...strings];
// // let count =0;
// // let len = strings.length;
// // for(let i=0;i<len;i++){
// // 	if (hasA(strings[i])){
// // 		let arr= strings[i];
// // 		console.log("string contains A are :- ",arr);
// // 		count++;
// // 	}
// // }

// // console.log(count);
// // console.log( namesCopy);




// //console.log('---------------JS-A2#3 TASK 20-------');


// // function hasLowerCase(str) {
// //     return str.match(/[A-Z]/);
// // }


// // const strings=["aa","Car","Ls","going"];
// //  const namesCopy=[...strings];
// // let count =0;
// // let len = strings.length;
// // for(let i=0;i<len;i++){
// // 	if (hasLowerCase(strings[i])){
// // 		let arr= strings[i];
// // 		console.log("string contains A are :- ",arr);
// // 		count++;
// // 	}
// // }

// // console.log('count of string are :- ',count);
// // console.log( namesCopy);
// //docs/Web/JavaScript/Reference/Global_Objects/Array/sort#sorting_non-ascii_characters
// console.log('---------------JS-A2#3 TASK 21.a-------');
// // const per = [
// //   {name:"Mary", city:"London"},
// //   {name:"Anita", city:"Paris" },
// //   {name:"Edward", city:"New York"},
// //   {name:"Thomas", city:"Rome"},
// //   {name:"Robin", city:"Seattle"},
// //   {name:"Sophia", city:"Los Angeles"},
// //   {name:"Bruce", city:"Delhi"}
// // ],
// // con = [
// //   {city:"London", continent:"Europe"},
// //   {city:"Delhi", continent:"Asia"},
// //   {city:"Seattle", continent:"North America"},
// //   {city:"Paris", continent:"Europe"},
// //   {city:"New York", continent:"North America"},
// //   {city:"Rome", continent:"Europe"},
// //   {city:"Bengaluru", continent:"Asia"},
// //   {city:"Los Angeles", continent:"North America"}
// // ],
// // findContinent = (cityToFind) => con.find(({ city }) => city === cityToFind).continent, // This line finds the city from "con". I've extracted the function here instead of using .find() inline to prevent repitition. This also means that you can add in some null checks here if you really want.
// // sortCountriesByContinent = () => per.sort((a, b) => {
// //   return findContinent(a.city).localeCompare(findContinent(b.city)); // Sorts "per" by using the .localeCompare() method and using the findContinent() function we made earlier.
// // });

// // console.log(sortCountriesByContinent());

// const per = [
//   {name:"Mary", city:"London"},
//   {name:"Anita", city:"Paris" },
//   {name:"Edward", city:"New York"},
//   {name:"Thomas", city:"Rome"},
//   {name:"Robin", city:"Seattle"},
//   {name:"Sophia", city:"Los Angeles"},
//   {name:"Bruce", city:"Delhi"}
// ],
// con = [
//   {city:"London", continent:"Europe"},
//   {city:"Delhi", continent:"Asia"},
//   {city:"Seattle", continent:"North America"},
//   {city:"Paris", continent:"Europe"},
//   {city:"New York", continent:"North America"},
//   {city:"Rome", continent:"Europe"},
//   {city:"Bengaluru", continent:"Asia"},
//   {city:"Los Angeles", continent:"North America"}
// ],
// sortCountriesByContinent = () => per.map((data) => {
//     // Return a new object, with the name, city, and continent properties.
//     return {
//       ...con.find(({ city }) => city === data.city), // Find city from "con", and join its properties with this new object (city, continent). The duplicates shouldn't cause an issue (at least not for me).
//       ...data // Join the original properties (name, city) with the new object
//     };
// })
// .sort((a, b) => a.continent.localeCompare(b.continent)) // Once again, we sort using .localeCompare(), but this time we can directly use the .continent property
// .map((data) => delete data.continent && data); // Optional, but removes continent property from data. This always returns true (tmk), so we can use an "and" operator to return data.

// console.log(sortCountriesByContinent());