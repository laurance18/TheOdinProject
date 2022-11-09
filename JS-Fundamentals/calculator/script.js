let ops = document.getElementById('ops');
let current = document.getElementById('current');

let afterOp = false;

var nodes = document.getElementById('grid').getElementsByTagName('button');
for(let i=0; i<nodes.length; i++) {
    if((nodes[i].className).includes('number')){
        nodes[i].addEventListener("click", function(event){updateCurrent(event)});   
    } else if((nodes[i].className).includes('operator')) {
        nodes[i].addEventListener("click", function(event){operationUpdate(event)});   
    } else if((nodes[i].className).includes('equals')) {
        nodes[i].addEventListener("click", function(event){calculate(event)});                   
    }
}

var utilities = document.getElementById('utilities').getElementsByTagName('button');
for(let i=0; i<utilities.length; i++) {
    utilities[i].addEventListener("click", function(event){reconfigureCalc(event)});
}

function updateCurrent(event) {
    node = event.target;
    nodeClass = (node.className).replace('blue', '').replace('orange', '').replace(/\s/g, '')
    if(current.innerHTML == '0' || afterOp) {
        current.innerHTML = node.innerHTML;
        afterOp = false;
    }
    else {
            current.innerHTML = current.innerHTML + node.innerHTML;
    }
}

function reconfigureCalc(event) {
    isClear = false;
    event.target.id == 'clear' ? isClear = true : isClear = false;
    if(isClear){
        current.innerHTML = '0';
        ops.innerHTML = '';
    } else {
        current.innerHTML = (current.innerHTML).slice(0, -1);
    }
}

function operationUpdate(event) {
    afterOp = true;
    ops.innerHTML = `${current.innerHTML} ${event.target.innerHTML}`;
}

function calculate(event) {
    if(ops.innerHTML[ops.innerHTML.length-1] != '='){
        let num1= Number(ops.innerHTML.split(' ')[0]);
        let num2 = Number(current.innerHTML);
        let calc = ops.innerHTML.split(' ')[1];

        switch(calc) {
            case '÷':
                ops.innerHTML = `${ops.innerHTML} ${num2} =`;
                current.innerHTML = parseFloat((num1/num2).toFixed(3), 10);
                break;
            case '×':
                ops.innerHTML = `${ops.innerHTML} ${num2} =`;
                current.innerHTML = num1 * num2;
                break;
            case '-':
                ops.innerHTML = `${ops.innerHTML} ${num2} =`;
                current.innerHTML = num1 - num2;
                break;
            case '+':
                ops.innerHTML = `${ops.innerHTML} ${num2} =`;
                current.innerHTML = num1 + num2;
                break;
        }
    }
}