function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function() {
  console.log(`${this.firstName} ${this.lastName}`);
}

Student.prototype.enroll = function(course) {
  // NEED TO ADD STUDENT TO COURSE'S ENROLLED STUDENT
  if (!course.students.includes(this)) {

    this.courses.push(course);
    course.addStudent(this);
    if (this.hasConflict() == true) {
      console.log('Student has a scheduling conflict!');
    }
  }
}

Student.prototype.courseLoad = function() {
  // NEED TO RETURN HASH OF DEPARTMENTS TO # OF CREDITS THE STUDENT IS TAKING IN THAT DEPARTMENT
  let courseLoadHash = {};

  this.courses.forEach(course => {
    let department = course.department;
    let departmentInHash = courseLoadHash[department];

    if(departmentInHash) {
      courseLoadHash[department] += course.numOfCredits;
    } else {
      courseLoadHash[department] = course.numOfCredits;
    }
  });

  return courseLoadHash;
}

Student.prototype.hasConflict = function() {

  for(let i = 0; i < this.courses.length - 1; i++) {
    for(let j = i + 1; j < this.courses.length; j++) {
      if (this.courses[i].conflictsWith(this.courses[j]) === true) {

        return true;
      }
    }
  }
  return false;
}





function Course(courseName, department, numOfCredits, daysOfWeek, timeBlock) {
  this.courseName = courseName;
  this.department = department;
  this.numOfCredits = numOfCredits;
  this.daysOfWeek = daysOfWeek;
  this.timeBlock = timeBlock;
  this.students = [];
}

Course.prototype.addStudent = function(student) {
  if(!this.students.includes(student)) {
    this.students.push(student);
  }
}

Course.prototype.conflictsWith = function(secondCourse) {
  // BOOLEAN METHOD
  let firstScheduleHash = {};
  let secondScheduleHash = {};

  this.daysOfWeek.forEach(day => {
    firstScheduleHash[day] = this.timeBlock;
  });

  console.log(firstScheduleHash);
  secondCourse.daysOfWeek.forEach(day => {
    secondScheduleHash[day] = secondCourse.timeBlock;
  });

  console.log(secondScheduleHash);

  for(let key1 in firstScheduleHash ) {
    for(let key2 in secondScheduleHash) {
      if (firstScheduleHash[key1] === secondScheduleHash[key1]) {
        return true;
      }
    }
  }

  return false;
}




// // // // // // // // // // // // // // // //
let s = new Student('Kenny', 'Choi');
let c1 = new Course('m101', 'Math', 4, ['mon', 'tues', 'fri'], 1);
let c2 = new Course('m102', 'Math', 5, ['mon', 'tues', 'fri'], 2);
let c3 = new Course('e102', 'English', 3, ['mon', 'tues', 'fri'], 4);
let c4 = new Course('e103', 'English', 4, ['mon', 'tues', 'fri'], 4);


s.enroll(c1);
s.enroll(c2);
s.enroll(c3);
s.enroll(c4);

// c1.conflictsWith(c2);
// s.hasConflict();