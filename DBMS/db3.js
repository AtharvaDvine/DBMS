db.student.insertMany([
  { Rollno: 1, Name: "Amit", Class: "SE", Div: "A", Subject: "TOC", Marks: 75, Address: { city: "Mumbai" } },
  { Rollno: 2, Name: "Bhakti", Class: "SE", Div: "B", Subject: "DBMS", Marks: 45, Address: { city: "Pune" } },
  { Rollno: 3, Name: "Rahul", Class: "SE", Div: "B", Subject: "TOC", Marks: 67, Address: { city: "Bangalore" } },
  { Rollno: 4, Name: "Sneha", Class: "TE", Div: "A", Subject: "SPOS", Marks: 55, Address: { city: "Pune" } },
  { Rollno: 5, Name: "Karan", Class: "TE", Div: "B", Subject: "DBMS", Marks: 35, Address: { city: "Mumbai" } },
  { Rollno: 6, Name: "Priya", Class: "BE", Div: "A", Subject: "SPOS", Marks: 85, Address: { city: "Pune" } }
])

db.student.aggregate([
  { $match: { Subject: "TOC" } },
  { $group: { _id: null, avgMarks: { $avg: "$Marks" } } }
])

db.student.aggregate([
  { $group: { _id: "$Div", count: { $sum: 1 } } }
])

db.student.aggregate([
  { $match: { Div: "B", Subject: "DBMS" } },
  { $group: { _id: "$Div", minMarks: { $min: "$Marks" }, student: { $push: "$Name" } } }
])

db.student.aggregate([
  { $match: { Subject: "SPOS", "Address.city": "Pune" } },
  { $group: { _id: null, totalMarks: { $sum: "$Marks" } } }
])

db.student.aggregate([
  { $match: { Subject: "DBMS" } },
  { $group: { _id: "$Div", count: { $sum: 1 } } }
])

db.student.aggregate([
  { $group: { _id: "$Address.city", count: { $sum: 1 } } }
])

db.student.createIndex({ Rollno: 1 })

db.student.createIndex({ Class: 1, Div: 1 })
