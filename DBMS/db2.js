db.student.insertMany([
  { first_name: "Amit", last_name: "Sharma", gender: "male", class: "TE A", grd_point: 35, age: 20, city: "Mumbai",state:"MH", admission: "confirm" },
  { first_name: "Bhakti", last_name: "Patil", gender: "female", class: "TE B", grd_point: 40, age: 19, city: "Pune",state:"MH", admission: "confirm" },
  { first_name: "Riyansh", last_name: "Desai", gender: "male", class: "TE A", grd_point: 30, age: 18, city: "Bangalore",state:"KA", admission: "confirm" },
  { first_name: "Sneha", last_name: "Naik", gender: "female", class: "SE A", grd_point: 29, age: 21, city: "Delhi",state:"DL", admission: "confirm" },
  { first_name: "Karan", last_name: "Soniminde", gender: "male", class: "TE B", grd_point: 45, age: 22, city: "Mumbai",state:"MH", admission: "cancelled" },
  { first_name: "Priya", last_name: "Joshi", gender: "female", class: "SE B", grd_point: 31, age: 20, city: "Bangalore",state:"KA", admission: "cancelled" },
  { first_name: "Evanshika", last_name: "Rao", gender: "female", class: "TE C", grd_point: 33, age: 15, city: "Hyderabad",state:"TG", admission: "confirm" },
  { first_name: "Vikas", last_name: "Kulkarni", gender: "male", class: "BE A", grd_point: 38, age: 20, city: "Bangalore",state:"KA", admission: "confirm" },
  { first_name: "Rajesh", last_name: "Nair", gender: "male", class: "TE A", grd_point: 28, age: 17, city: "Bangalore",state:"KA", admission: "confirm" },
  { first_name: "Smita", last_name: "Singh", gender: "female", class: "TE B", grd_point: 30, age: 18, city: "Chennai",state:"TN", admission: "cancelled" }
]);

db.student.find({
  $or:[
    {gender: "female"},
    {class: "TE B"}
    ],
  grd_point:{$gt:31} 
});

db.student.updateOne(
  {first_name:"Riyansh"},
  {$set:{age:20}}
  )

db.student.updateOne(
  {last_name:"Soniminde"},
  {$set:{city:"Nagpur"}},
  {$set:{state:"MH"}}
  )
  
db.student.find({
  state:"KA",
  admission:"cancelled"
  })
  
db.student.deleteOne(
  {first_name:"Evanshika",
  age:{$lt:18}
 } )  
 
db.student.find({
  $nor:[
    {gender:"male"},
    {age:{$lte:18}}
    ]
})
