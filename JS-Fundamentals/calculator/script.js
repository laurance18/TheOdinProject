let ops = document.getElementById('ops');
let current = document.getElementById('current');

var nodes = document.getElementById('grid').getElementsByTagName('button');
for(var i=0; i<nodes.length; i++) {
    nodes[i].addEventListener("click", function(event){updateCurrent(event)});
}

function updateCurrent(event) {
    node = event.target;
    nodeClass = (node.className).replace('blue', '').replace('orange', '').replace(/\s/g, '')
    if(nodeClass == 'number') {
        if(current.innerHTML == '0') {
            current.innerHTML = node.innerHTML;
        }
        else {
            current.innerHTML = current.innerHTML + node.innerHTML;
        }
    }
}

var utilities = document.getElementById('utilities').getElementsByTagName('button');
for(var i=0; i<nodes.length; i++) {
    utilities[i].addEventListener("click", function(event){reconfigureCalc(event)});
}

function reconfigureCalc(event) {
    isClear = false;
    event.target.id == 'clear' ? isClear = true : isClear = false;

    if(isClear){
        current.innerHTML = '0';
    }
}