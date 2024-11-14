db.student.insertMany([
  { first_name: "Bhakti", last_name: "Patil", gender: "female", class: "TE B", grd_point: 40, age: 19, city: "Pune", course: "BSc" },
  { first_name: "Rahul", last_name: "Desai", gender: "male", class: "TE A", grd_point: 31, age: 18, city: "Bangalore", course: "BSc" },
  { first_name: "Karan", last_name: "Kumar", gender: "male", class: "TE B", grd_point: 45, age: 22, city: "Mumbai", course: "BCom" },
  { first_name: "Priya", last_name: "Jadhav", gender: "female", class: "TE B", grd_point: 31, age: 20, city: "Bangalore", course: "BA" },
  { first_name: "Vikas", last_name: "Kulkarni", gender: "male", class: "BE A", grd_point: 38, age: 20, city: "Bangalore", course: "BSc" },
  { first_name: "Smita", last_name: "Singh", gender: "female", class: "TE B", grd_point: 30, age: 18, city: "Chennai", course: "BCom" }
])

db.student.find({
  $or: [
    { class: "TE A" },
    { grd_point: { $gte: 31 } }
  ] ,
    gender: "male" 
})

db.student.find({
  city: "Bangalore",
  age: {$lte : 19}
})

db.student.updateOne(
  {first_name: "Bhakti"},
  {$set: {course: "MCA"}}
)

db.student.deleteMany(
  {age: 18},
  {gender: "male"}
  )

db.student.deleteOne(
  {last_name:"Jadhav"},
  {class:"TE B"}
  )  
  
db.student.find({
  $nor:[
    {gender:"male"},
    {grd_point:{$lt:40}}
    ]
  })  
  
db.student.save(
    { first_name: "Rajat", last_name: "Patil", gender: "male", class: "TE B", grd_point: 42, age: 20, city: "Pune", course: "BSc" }
  )  