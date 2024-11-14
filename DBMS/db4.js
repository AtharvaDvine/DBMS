db.student.insertMany([
  {
    Rollno: 1,
    Name: "Amit",
    Class: "SE",
    Div: "A",
    Marks: [
      { Subject: "TOC", Score: 75 },
      { Subject: "DS", Score: 65 },
      { Subject: "SPOS", Score: 80 }
    ],
    Address: { city: "Mumbai" }
  },
  {
    Rollno: 2,
    Name: "Bhakti",
    Class: "SE",
    Div: "B",
    Marks: [
      { Subject: "TOC", Score: 70 },
      { Subject: "DS", Score: 45 },
      { Subject: "SPOS", Score: 55 }
    ],
    Address: { city: "Pune" }
  },
  {
    Rollno: 3,
    Name: "Rahul",
    Class: "SE",
    Div: "B",
    Marks: [
      { Subject: "TOC", Score: 67 },
      { Subject: "DS", Score: 50 },
      { Subject: "SPOS", Score: 60 }
    ],
    Address: { city: "Bangalore" }
  },
  {
    Rollno: 4,
    Name: "Sneha",
    Class: "TE",
    Div: "A",
    Marks: [
      { Subject: "TOC", Score: 82 },
      { Subject: "DS", Score: 75 },
      { Subject: "SPOS", Score: 85 }
    ],
    Address: { city: "Pune" }
  },
  {
    Rollno: 5,
    Name: "Karan",
    Class: "TE",
    Div: "B",
    Marks: [
      { Subject: "TOC", Score: 55 },
      { Subject: "DS", Score: 35 },
      { Subject: "SPOS", Score: 65 }
    ],
    Address: { city: "Mumbai" }
  },
  {
    Rollno: 6,
    Name: "Priya",
    Class: "BE",
    Div: "A",
    Marks: [
      { Subject: "TOC", Score: 78 },
      { Subject: "DS", Score: 88 },
      { Subject: "SPOS", Score: 92 }
    ],
    Address: { city: "Pune" }
  }
])

  db.student.aggregate([
  { $unwind: "$Marks" },
  { $match: { "Marks.Subject": "DS" } },
  { $group: { _id: "$Address.city", maxMarks: { $max: "$Marks.Score" } } }
])

db.student.aggregate([
  {$unwind: "$Marks"},
  {$group:{_id:"$Marks.Subject",AVG_marks:{$avg:"$Marks.Score"}}}
  ])
  
db.student.updateOne(
  {Rollno:1},
  {$push:{Marks:{Subject:"Math",Marks:88}}}
  )  
  
  db.student.createIndex({Rollno:1})
  db.student.createIndex({Name:1,Class:1})
  db.student.getIndexes()
  db.student.dropIndex("Rollno_1")
  
  db.student.aggregate([
  { $match: { "Address.city": "Pune" } },
  { $unwind: "$Marks" },
  { $group: { _id: "$Marks.Subject", maxScore: { $max: "$Marks.Score" } } },
  { $sort: { _id: 1 } }
])
