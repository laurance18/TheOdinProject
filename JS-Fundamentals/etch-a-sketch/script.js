const container = document.getElementById("maingrid");

function makeRows(rows, cols) {
  container.style.setProperty('--grid-rows', rows);
  container.style.setProperty('--grid-cols', cols);
  for (c = 0; c < (rows * cols); c++) {
    let cell = document.createElement("div");
    cell.style.padding = `${192/rows}px`;

    cell.addEventListener('mouseover', function () {
      cell.style.backgroundColor = "black";
    });

    container.appendChild(cell).className = "grid-item";
  };
};

makeRows(16, 16); // INITAL GRID

let slider = document.getElementById('slider');
let output = document.getElementById('slider-value');
output.textContent = `${slider.value}x${slider.value}`;

slider.oninput = function () {
  output.textContent = `${this.value}x${this.value}`;
  while(container.firstChild) {
    container.removeChild(container.firstChild); // REMOVE OLD GRID
  }
  makeRows(this.value,this.value)
};
