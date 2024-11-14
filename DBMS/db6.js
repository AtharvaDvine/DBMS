db.City.insertMany([
  { cityname: "Mumbai", area: 603, population: 20411000 },
  { cityname: "Pune", area: 331, population: 3124458 },
  { cityname: "Nagpur", area: 227, population: 2405665 },
  { cityname: "Nashik", area: 264, population: 1486053 },
  { cityname: "Aurangabad", area: 139, population: 1192000 },
  { cityname: "Kolhapur", area: 66, population: 549283 },
  { cityname: "Nanded", area: 108, population: 550564 },
  { cityname: "Solapur", area: 148, population: 951118 }
]);

// Map function
var mapFunction = function () {
  if (this.population > 1000000) {
    emit("HIGHLY POPULATED", 1);
  } else {
    emit("LOW POPULATED", 1);
  }
};

// Reduce function
var reduceFunction = function (key, values) {
  return Array.sum(values);
};

// Execute the MapReduce
db.City.mapReduce(
  mapFunction,
  reduceFunction,
  {
    out: { inline: 1 }
  }
);


