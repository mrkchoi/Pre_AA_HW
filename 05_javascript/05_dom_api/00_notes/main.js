
const outer = document.querySelector('.outer');
const middle = document.querySelector('.middle');
const inner = document.querySelector('.inner');

outer.addEventListener('click', (e) => {
  console.log('------------------');

  console.log('outer clicked!');
  console.log(e.target);
  console.log(e.currentTarget);
  
});

middle.addEventListener('click', (e) => {
  console.log('------------------');

  console.log('middle clicked!');
  console.log(e.target);
  console.log(e.currentTarget);
  
});

inner.addEventListener('click', (e) => {
  console.log('------------------');
  console.log('inner clicked!');
  console.log(e.target);
  console.log(e.currentTarget);
  e.stopPropagation();
});