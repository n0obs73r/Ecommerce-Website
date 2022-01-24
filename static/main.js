var bY = document.getElementById("rangeY");
var bX = document.getElementById("rangeX");
var baseplate_output = document.getElementById("baseplate");
var user_col_output = document.getElementById("user_col");
var rangeCol = document.getElementById("rangeCol");

baseplate_output.innerHTML = (bY.value) + "&nbsp &nbsp x &nbsp &nbsp" + (bX.value);
user_col_output.innerHTML = 'Max Used Colors: '+ (rangeCol.value);

document.getElementById("vplus").onclick = function() {
  bY.value = parseInt(bY.value) + 1;
baseplate_output.innerHTML = (bY.value) + "&nbsp &nbsp x &nbsp &nbsp" + (bX.value);
}

document.getElementById("hplus").onclick = function() {
  bX.value = parseInt(bX.value) + 1;
baseplate_output.innerHTML = (bY.value) + "&nbsp &nbsp x &nbsp &nbsp" + (bX.value);
}

document.getElementById("vminus").onclick = function() {
  bY.value = parseInt(bY.value) - 1;
baseplate_output.innerHTML = (bY.value) + "&nbsp &nbsp x &nbsp &nbsp" + (bX.value);
}

document.getElementById("hminus").onclick = function() {
  bX.value = parseInt(bX.value) - 1;
baseplate_output.innerHTML = (bY.value) + "&nbsp &nbsp x &nbsp &nbsp" + (bX.value);
}

rangeCol.oninput = function() {
  user_col_output.innerHTML = 'Max Used Colors: '+ (rangeCol.value);
}

document.getElementById("image").defaultValue = "lion.png";


// for (let i = 0; i < 50; i++) {
//   document.getElementById("image").value;
// }