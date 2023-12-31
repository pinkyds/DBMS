//Create a database department
use department


//Create a collection as teacher with fields as name , department ,experience and salary
db.createCollection("teacher", {
  name: String,
  department: String,
  experience: Number,
  salary: Number
})



db.teacher.insertMany([
  { name: "Alice", department: "Math", experience: 5, salary: 50000 },
  { name: "Bob", department: "Science", experience: 7, salary: 60000 },
  { name: "Carol", department: "English", experience: 10, salary: 70000 },
  { name: "Dave", department: "History", experience: 12, salary: 80000 },
  { name: "Eve", department: "Math", experience: 3, salary: 40000 },
])



//Display the department wise average salary.
db.teacher.aggregate([
  { $group: { _id: "$department", averageSalary: { $avg: "$salary" } } },
  { $sort: { _id: 1 } }
])



//Display the no. Of employees working in each department
db.teacher.aggregate([
  { $group: { _id: "$department", count: { $sum: 1 } } },
  { $sort: { _id: 1 } }
])



//Display the department wise minimum salary
db.teacher.aggregate([
  { $group: { _id: "$department", minSalary: { $min: "$salary" } } },
  { $sort: { _id: 1 } }
])




//Apply index and drop index
db.teacher.createIndex({ department: 1 })




db.teacher.dropIndex({ department: 1 })
