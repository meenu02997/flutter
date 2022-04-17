// stringtoarray = function (str) {
//      return str.trim().split(" ");
// };
// console.log(stringtoarray("my name is meenu singh"));


console.log("--------task 1b----------------");
stringtoarray = function (str) {
     return str.trim().toUpperCase().split(" ");
};
console.log(stringtoarray("my name is meenu singh"));

// console.log("--------task 1c");
// const animals = ['Hen', 'elephant', 'llama', 'leopard', 'ostrich', 'Whale', 'octopus', 'rabbit', 'lion', 'dog']
// const Msg = animals.reduce((accumulator, animal) => accumulator +' '+ animal[0], '')
// console.log(Msg.trim().split(" "));
// let secretMessage = animals.map(function(animal) {
//      return animal[0]
// });
// console.log("-------------TASK 1F--------------")
// function hasB(str){
// 	let lenstr = str.length;
// 	for(let i=0;i<lenstr; i++){
// 		if(str[i]=='o' || str[i]=='O'){
// 			return true;
// 		}
// 	}
// 	return false;
// }

// const strings = ['aba', 'ball', 'cab','bye','good'];
// let len = strings.length;
// let count =0;
// for(let i=0; i<len; i++){
// 	if(hasB(strings[i])){
// 		count++;
// 	}
// }
// console.log('count of a is :- ',count);



// console.log("-------------TASK 1F--------------")

// function vowel_calc(myWord)
// {
// 	var wordLength = myWord.length;
// 	var arr = [];

// 	for (var i = 0; i < wordLength; i++) {

// 		if (i == 0)
// 			arr.push(wordLength);

// 		else

// 			arr.push((wordLength - i) + arr[i - 1] - i);
// 	}

// 	var vowelCount = 0;
// 	for (var i = 0; i < wordLength; i++)

// 		if (myWord[i] == 'a' || myWord[i] == 'e' || myWord[i] == 'i'
// 			|| myWord[i] == 'o' || myWord[i] == 'u')
// 			vowelCount += arr[i];
// 	return vowelCount;
// }
// var myWord = "daceh";
// console.log( vowel_calc(myWord));



	// function sortByFreq(arr, n) {
		
	// 	var maxE = -1;

	// 	for (var i = 0; i < n; i++) {
	// 	maxE = Math.max(maxE, arr[i]);
	// 	}

	// 	var freq = new Array(maxE + 1).fill(0);

	// 	for (var i = 0; i < n; i++) {
	// 	freq[arr[i]]++;
	// 	}

	// 	var cnt = 0;

	// 	for (var i = 0; i <= maxE; i++) {
		
	// 	if (freq[i] > 0) {
	// 		var value = 100000 - i;
	// 		arr[cnt] = 100000 * freq[i] + value;
	// 		cnt++;
	// 	}
	// 	}

	// 	return cnt;
	// }

	// function printSortedArray(arr, cnt) {
		
	// 	for (var i = 0; i < cnt; i++) {
		
	// 	var frequency = parseInt(arr[i] / 100000);

	// 	var value = 100000 - (arr[i] % 100000);

	// 	for (var j = 0; j < frequency; j++) {
	// 		document.write(value + " ");
	// 	}
	// 	}
	// }

	// var arr = [4, 4, 5, 6, 4, 2, 2, 8, 5];

	// var n = arr.length;

	// var cnt = sortByFreq(arr, n);
	// arr.sort((a, b) => b - a);
	// printSortedArray(arr, cnt);





// var prods = [{id:'A441', name:'Pepsi',category:'Soft	Drink',	price:15,	quantity:2},
// {id:'B234', name:'Coke',	category:'Soft	Drink',	price:10,	quantity:8},
// {id:'A617', name:'Mirinda',	category:'Soft	Drink',	price:20,	quantity:20},
// {id:'B003', name:'Sprite',	category:'Soft	Drink',	price:16,	quantity:5},
// {id:'B225', name:'Minute	Maid',	category:'Soft	Drink',	price:25,	quantity:12},
// {id:'A742', name:'5Star',	category:'Chocloate',	price:10,	quantity:3},
// {id:'B388', name:'Appy',	category:'Soft	Drink',	price:35,	quantity:9},
// {id:'A899', name:'Gems',	category:'Chocloate',	price:12,	quantity:11},
// {id:'B635', name:'KitKat',	category:'Chocloate',	price:15,	quantity:7},
// {id:'B408', name:'Perk',	category:'Chocloate',	price:8,	quantity:15},
// {id:'A354', name:'Dairy	Milk',	category:'Chocloate',	price:30,	quantity:4}];

// const arr = prods.map(function(element){
// 	let v1 = element.price;
// 	let json1 = {name: element.name, value:v1};
// 	return json1;
// });
// arr.sort(compAscValue);
// console.log(arr);
// function compAscValue(p1,p2){
// 	if(p1.value>p2.value)
// 		return 1;
// 	else if(p1.value<p2.value)
// 		return -1;
// 	else
// 		return 0;
// }

// function compDecValue(p1,p2){
// 	if(p1.value>p2.value)
// 		return 1;
// 	else if(p1.value<p2.value)
// 		return -1;
// 	else
// 		return 0;
// }

// function IncreingOrder(p1,p2){
// 	if(p1.value>p2.value)
// 		return 1;
// 	else if(p1.value<p2.value)
// 		return -1;
// 	else
// 		return 0;
// }
