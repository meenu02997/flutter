// let a=10;
// let b=20;

// let c1 = a || b;
// console.log("OR :",a, '||',b,'is',c1);
// let c2 = b || a;
// console.log("OR :",b,'||',a,'is',c2);
// let d1 = a && b;
// console.log("AND :",a,'&&',b,'is',d1);
// let d2 = b && a;
// console.log("AND :",b,'&&',a,'is',d2);

// let newEmp = {name:'Jack', password:'Jack123', level:2};
// let loginAttempt = {user:'Jack', password:'Jack123'};
// let loginName = newEmp.name || 'Guest';
// let password = newEmp.password || 'Guest';
// let level = newEmp.level || 1;
// let admin = newEmp.admin || (newEmp.level>=4);
// let loginSuccess = (loginAttempt.user === loginName) && (loginAttempt.password === password);
// let levelMsg = (admin ? "You have admin level access" : "Your access level is "+level);
// let message = (loginSuccess ? 'Welcome '+loginName+". "+levelMsg : 'Login Failed');
// console.log(message);
//newEmp = {name:'Jack'}
//newEmp = {name:'Jack'} 
//loginAttempt={user:'Jack', password:'Guest'};
// newEmp = 
// and loginAttempt=
// newEmp = 
// and loginAttempt=


// 
// let str=null;
// str=str || 'A';
// console.log(str);












// let x=null;
// x=x || 12.5;
// console.log(JSON.stringify({ x: x }));


let str1=null;
let str2=null;

str=str1 || str2 || 'error';
console.log(JSON.stringify({ str: str }));

// let x= 14;
// (x%2==0)? console.log('num is even :-',x+10) : console.log('num is even :-',x-3);

// let shots= [4,5,6,1,8,0,78,54,2];
// shots.reduce((acc, shot) => acc shot ? acc : shot, 0);
















// expected output: "{"x":5,"y":6}"

// console.log(JSON.stringify([new Number(3), new String('false'), new Boolean(false)]));
// // expected output: "[3,"false",false]"

// console.log(JSON.stringify({ x: [10, undefined, function(){}, Symbol('')] }));
// // expected output: "{"x":[10,null,null,null]}"

// console.log(JSON.stringify(new Date(2006, 0, 2, 15, 4, 5)));
// // expected output: ""2006-01-02T15:04:05.000Z""



// let x=15;
// let y=5;
// let z1 = x>y ? 2*x : y+10;
// let z2 = x<=2*y ? x+100 : y-5;
// console.log('z1=',z1);
// console.log('z2=',z2);





// let x = ("hello"==="hello"? "Wow" : "TryAgain");
// console.log(x);
// let x = (15 > 10 ? "Hello" : "Bye");
// let x = (16 === 16 ? "Ok" : "NotOk");
// let x = ("hello"==="hello"? "Wow" : "TryAgain");
























// const students = [
//   { name: 'Quincy', grade: 96 },
//   { name: 'Jason', grade: 84 },
//   { name: 'Alexis', grade: 100 },
//   { name: 'Sam', grade: 65 },
//   { name: 'Katie', grade: 90 }
// ];

// const studentGrades = students.filter(student => student.grade >= 90);
// return studentGrades;