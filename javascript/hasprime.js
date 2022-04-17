var numArray = [2, 3, 4, 5, 6, 7, 8, 9, 10]

numArray = numArray.filter((number) => {
  for (var i = 2; i <= Math.sqrt(number); i++) {
    if (number % i === 0) 
    	console.log('0');
    	return false;
  }
  return true;
}
);

console.log(numArray);