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

makeRows(32, 32); // MAKE THIS REACTIVE WITH A SLIDER!!