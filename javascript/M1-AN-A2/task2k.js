var productMaster= [{id:'A441',name:'Pepsi',category:'Soft Drink', price:15, quantity:2},
{id:'B234',name:'Coke', category:'Soft Drink', price:10, quantity:8},
{id:'A617',name:'Mirinda', category:'Soft Drink', price:20, quantity:20},
{id:'B003',name:'Sprite', category:'Soft Drink', price:16, quantity:5},
{id:'B225',name:'Minute Maid', category:'Soft Drink', price:25, quantity:12},
{id:'A742',name:'5Star', category:'Chocloate', price:10, quantity:3},
{id:'B388',name:'Appy', category:'Soft Drink', price:35, quantity:9},
{id:'A899',name:'Gems', category:'Chocloate', price:12, quantity:11},
{id:'B635',name:'KitKat', category:'Chocloate', price:15, quantity:7},
{id:'B408',name:'Perk', category:'Chocloate', price:8, quantity:15},
{id:'A354',name:'Dairy Milk', category:'Chocloate', price:30, quantity:4}]
    
  
var arr1 = productMaster.filter(n => n.price*n.quantity < 150);
console.log(JSON.stringify(arr1));