console.log('---------------------TASK3------------');
let num1=25;
let num2 = 25;
let str1='1';
let str2= '1';
let bool1= true;
let bool2= false;
let arr1 =[25];
let obj1={value:25};
console.log(false || 5);
console.log(true || 5);
console.log(false && 8);
console.log(true && 8);
console.log(false || 'Hello');
console.log(true || 'Hello');
console.log(false && 'Hello');
console.log(true && 'Hello');
console.log(null || 10);
console.log(null && 10);
console.log('Hello' || 'Bye');
console.log('Hello' && 'Bye');
console.log(0 || 5);
console.log(0 && 5);
console.log('' || 'Ok');
console.log('' && 'Ok');
console.log(undefined || 'Red');
console.log(undefined && 'Red');
console.log(2 || 3 || 4);
console.log(2 && 3 && 4);
console.log(0 || 0 || 12);
console.log(0 && 0 && 12);
console.log(''|| 'Red' || '');
console.log('' && 'Red' && '');
console.log(null || 'Red' || 'Green');
console.log(null && 'Red' && 'Green');

// console.log('Loose',str1==str1);
// console.log('Loose',num1==num2);
// console.log(5 == 5);
// console.log('5' == '5');
// console.log(5 == '5');
// console.log(5 === 5);
// console.log(5 === '5');
// console.log(5 === '5');
// console.log(true == 8);
// console.log(true === 8);
// console.log(true == 0);
// console.log(true === 0);
// console.log(true == -3);
// console.log(true === -3);
// console.log(false == -1);
// console.log(false == 0);
// console.log(false === -1);
// console.log(false === 0);
// console.log(false == 6);
// console.log(false === 6);


// b) Use the concept of truthy and falsy to give name the value Guest if it is an empty string
// In JavaScript, Truthy expressions evaluate to boolean true value and Falsy expressions evaluate to boolean false value.

// Unlike other programming languages, truthy and falsy values are not 
// limited to boolean data types and comparisons. 
// They can have many other forms.


// c) Explain all the examples for Not, And and Or operator 
// and their output as shown in the lesson video

// There are various types of operators discussed in this appendix. The following types are provided:

// Arithmetic Operators are used to perform mathematical calculations.
// Assignment Operators are used to assign a value to a property or variable. Assignment Operators can be numeric, date, system, time, or text.
// Comparison Operators are used to perform comparisons.
// Concatenation Operators are used to combine strings.
// Logical Operators are used to perform logical operations and include AND, OR, or NOT.
// Boolean Operators include AND, OR, XOR, or NOT and can have one of two values, true or false.

// d)Use logical operator give name the value Guest if it is an empty string
// There are four logical operators in JavaScript: || (OR), && (AND), ! (NOT), ?? (Nullish Coalescing). Here we cover the first three, the ?? operator is in the next article.

// Although they are called “logical”, they can be applied to values of any type, not only boolean. 
// Their result can also be of any type.

// e)Use logical operator and map to clean an array and replace empty strings in it with NA
// In this we check for string for None or empty string using the or operator and 
// replace the None values with empty string. Attention geek!

// f)Use logical operator to calculate the grade

// Nested if-else statement helps in creating multiple choices inside a program. But there are also some disadvantages of using them which are given below.
// Indentation is most important while using nested if-else statements. But if we add 2 layer nesting inside on if-else block. Then you will notice that your program is creeping towards right. And it will make difficult to read that program.
// Braces are used to show the scope of statements. There are chances that you may commit a mistake while writing those braces. One single mistake will fill your program with lots errors.
// As there are multiple if-else statements so you also have to take care of matching the correct else block with if statement.

// g)Use logical operator and map to createan array of final grades
// Map. The map() method is used for creating a new array from an existing one, 
// applying a function to each one of the elements of

// i)Use ternary operator and map to make an array of absolute values
// const numbers = [1, 2, 3, 4];
// const doubled = numbers.map(item => item * 2);
// console.log(doubled);