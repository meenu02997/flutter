function hasB(str){
	let lenstr = str.length;
	for(let i=0;i<lenstr; i++){
		if(str[i]=='o' || str[i]=='O'){
			return true;
		}
	}
	return false;
}

const strings = ['aba', 'ball', 'cab','bye','good'];
let len = strings.length;
let count =0;
for(let i=0; i<len; i++){
	if(hasB(strings[i])){
		count++;
	}
}
console.log('count of a is :- ',count);

