db.student.insertMany([
  { Rollno: 1, Name: "Amit", Class: "SE", Div: "A", Subject: "DBMS", Marks: 75, Address: { city: "Mumbai" } },
  { Rollno: 2, Name: "Bhakti", Class: "SE", Div: "B", Subject: "DBMS", Marks: 45, Address: { city: "Pune" } },
  { Rollno: 3, Name: "Rahul", Class: "SE", Div: "B", Subject: "DBMS", Marks: 67, Address: { city: "Bangalore" } },
  { Rollno: 4, Name: "Sneha", Class: "TE", Div: "A", Subject: "SPOS", Marks: 55, Address: { city: "Pune" } },
  { Rollno: 5, Name: "Karan", Class: "TE", Div: "B", Subject: "DBMS", Marks: 35, Address: { city: "Mumbai" } },
  { Rollno: 6, Name: "Priya", Class: "BE", Div: "A", Subject: "SPOS", Marks: 85, Address: { city: "Pune" } }
])

var mapFunction = function () {
  if (this.Subject === "DBMS") {
    if (this.Marks > 70) {
      emit("Highscores", 1);
    } else if (this.Marks > 40 && this.Marks <= 70) {
      emit("Average scores", 1);
    } else if (this.Marks <= 40) {
      emit("Failed", 1);
    }
  }
};


var reduceFunction = function (key, values) {
  return Array.sum(values);
};


db.student.mapReduce(
  mapFunction,
  reduceFunction,
  {
    out: { inline: 1 }
  }
);
// Map function
var cityMapFunction = function () {
  emit(this.Address.city, 1);
};

// Reduce function
var cityReduceFunction = function (key, values) {
  return Array.sum(values);
};

// Execute the MapReduce
db.student.mapReduce(
  cityMapFunction,
  cityReduceFunction,
  {
    out: { inline: 1 }
  }
);

