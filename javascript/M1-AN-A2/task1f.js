
console.log("-------------TASK 1F--------------")

function vowel_calc(myWord)
{
	var wordLength = myWord.length;
	var arr = [];

	for (var i = 0; i < wordLength; i++) {

		if (i == 0)
			arr.push(wordLength);

		else

			arr.push((wordLength - i) + arr[i - 1] - i);
	}

	var vowelCount = 0;
	for (var i = 0; i < wordLength; i++)

		if (myWord[i] == 'a' || myWord[i] == 'e' || myWord[i] == 'i'
			|| myWord[i] == 'o' || myWord[i] == 'u')
			vowelCount += arr[i];
	return vowelCount;
}
var myWord = "daceh";
console.log( vowel_calc(myWord));
