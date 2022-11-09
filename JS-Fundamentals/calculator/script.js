let ops = document.getElementById('ops');
let current = document.getElementById('current');

var nodes = document.getElementById('grid').getElementsByTagName('button');
for(var i=0; i<nodes.length; i++) {
    nodes[i].addEventListener("click", function(event){updateCurrent(event)});
}

function updateCurrent(event) {
    node = event.target;
    nodeClass = (node.className).replace('blue', '').replace('orange', '').replace(/\s/g, '')
    console.log(nodeClass);
    if(nodeClass == 'number') {
        if(current.innerHTML == '0') {
            current.innerHTML = node.innerHTML;
        }
        else {
            current.innerHTML = current.innerHTML + node.innerHTML;
        }
    }
}
