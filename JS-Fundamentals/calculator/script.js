let ops = document.getElementById('ops');
let current = document.getElementById('current');

var nodes = document.getElementById('grid').getElementsByTagName('button');
for(let i=0; i<nodes.length; i++) {
    if((nodes[i].className).includes('number')){
        nodes[i].addEventListener("click", function(event){updateCurrent(event)});   
    } else if((nodes[i].className).includes('operator')) {
        nodes[i].addEventListener("click", function(event){operationUpdate(event)});   
    }
}

var utilities = document.getElementById('utilities').getElementsByTagName('button');
for(let i=0; i<utilities.length; i++) {
    utilities[i].addEventListener("click", function(event){reconfigureCalc(event)});
}

function updateCurrent(event) {
    node = event.target;
    nodeClass = (node.className).replace('blue', '').replace('orange', '').replace(/\s/g, '')
    if(ops.innerHTML == '') {
        if(current.innerHTML == '0') {
            current.innerHTML = node.innerHTML;
        }
        else {
            current.innerHTML = current.innerHTML + node.innerHTML;
        }
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
    let op = event.target;
    ops.innerHTML = current.innerHTML + ' ' + op.innerHTML + ' ';
}
