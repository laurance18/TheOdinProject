const container = document.getElementById("maingrid");

function makeRows(rows, cols) {
  container.style.setProperty('--grid-rows', rows);
  container.style.setProperty('--grid-cols', cols);
  for (c = 0; c < (rows * cols); c++) {
    let cell = document.createElement("div");
    cell.style.padding = `${192/rows}px`;
    container.appendChild(cell).className = "grid-item";
  };
};

let slider = document.getElementById('slider');
let output = document.getElementById('slider-value');
output.textContent = `${slider.value}x${slider.value}`;

slider.oninput = function () {
  output.textContent = `${this.value}x${this.value}`;
  // makeRows(this.value,this.value)
};

makeRows(16, 16); 