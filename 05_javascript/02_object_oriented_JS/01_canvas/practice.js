document.addEventListener("DOMContentLoaded", function(){
  const canvas =  document.getElementById('mycanvas');
  const ctx = canvas.getContext('2d');
  // ctx.fillStyle = ('red');
  // // ctx.fillRect(50,50,100,100);
  // // ctx.beginPath();
  // // ctx.arc(50, 50, 40, 20, 30);
  // // ctx.strokeStyle = 'orangered';
  // // ctx.lineWidth = 3;
  // // ctx.stroke();
  // // ctx.fillStyle = 'pink';
  // // ctx.fill();
  // // ctx.closePath();

  // ctx.beginPath();
  // ctx.moveTo(75, 50);
  // ctx.lineTo(100, 75);
  // ctx.lineTo(100, 25);
  // ctx.lineTo(100, 100);
  // ctx.lineTo(100, 20);
  // ctx.fill();


  // ctx.beginPath();
  // ctx.arc(75,75,50,0, Math.PI * 2, true);
  // ctx.moveTo(110, 75);
  // ctx.arc(75,75,35,0,Math.PI, false);
  // ctx.moveTo(65, 65);
  // ctx.arc(60,65,5,0, Math.PI * 2, true);
  // ctx.moveTo(95,65);
  // ctx.arc(90,65,5,0, Math.PI * 2, true);
  // ctx.lineWidth = 2;
  // ctx.stroke();
  
  ctx.beginPath();
  ctx.moveTo(25,25);
  ctx.lineTo(75,75);
  ctx.lineTo(25,75);
  ctx.closePath();
  ctx.stroke();
  ctx.fill();
});
