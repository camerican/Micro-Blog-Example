document.addEventListener("DOMContentLoaded",function(){
  // rotate through background classes on body
  // say we have 3 background classes to rotate through...
  changeBackground(3);
  setInterval(function(){
    changeBackground(3);
  },5000);

});

function changeBackground(n) {
  document.body.className = 'background'
  document.body.classList.add('background' + -~Math.floor(Math.random()*n))
}