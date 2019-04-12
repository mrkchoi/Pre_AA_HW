

function logArguments(arg1, arg2) {
  let results = [];

  for(let i = 0; i < arguments.length; i++) {
    results.push(arguments[i]);
  }

  return results;
}

// console.log(logArguments('hello', 'world', 3));




function thisBreaks() {
  console.log(arguments instanceof Array);

  arguments.forEach(arg => {
    console.log(arg);
  });
}

// thisBreaks();


function thisWorks() {
  let args = Array.prototype.slice.call(arguments);

  console.log(args instanceof Array);

  args.forEach(arg => {
    console.log(arg);
  });
}

// thisWorks('hello', 'this', 'works!');



// ES6 Array.from

function thisWorksToo() {
  let args = Array.from(arguments);

  console.log(args instanceof Array);

  args.forEach(arg => {
    console.log(arg);
  });
}

// thisWorksToo(1,2,3,4,5);


// ES5 vs ES6 Rest parameters

function functionWay(firstArg) {
  console.log(`The first argument is ${firstArg}`);

  let remainingArgs = Array.prototype.slice.call(arguments, 1);

  console.log(`The remaining arguments are: `);

  remainingArgs.forEach(arg => {
    console.log(arg);
  })
}

// functionWay(1,2,3,3,4);


// ES6 WAY | REST PARAMETERS

function restWay(firstArg, ...otherArgs) {
  console.log(`The first arg is ${firstArg}`);

  console.log('The remaining args are: ');

  otherArgs.forEach(arg => {
    console.log(arg);
  });
}

// restWay(1,4,5,6,7,78,8,8);




// ES6 SPREAD SYNTAX

function spread1(noun, verb, adv, place) {
  console.log(`${noun} likes to ${adv} ${verb} by the ${place}.`);
}

let args = ['Jill', 'jump', 'aggressively', 'fireplace']
// spread1(...args);


function spread2(v, w, x, y, z) {
  console.log(`${v} ${w} ${x} ${y} ${z}`);
}

let args1 = [2,3];
// spread2(1, ...args1, 4, ...[5]);




// ES6 Default values

function defaults(x, y=17) {
  return x + y;
}

// console.log(defaults(10, 200));
// console.log(defaults(10));



function greatMovieReminder(movie) {
  window.setTimeout(() => {
    console.log(`Remember to watch: ${movie}`);
  }, 5 * 1000);
  console.log(`Setting timer for ${movie}`);
}

greatMovieReminder('Citizen Kane');
greatMovieReminder('Lost in Translation');
greatMovieReminder('Touch of Evil');