
const container = document.querySelector('#container');

const par = document.createElement('p');
par.textContent = "Hey I'm red!";
par.style.color = 'red';
container.appendChild(par)

const div = document.createElement('div');
div.style.border = '1px solid black';
div.style.backgroundColor = 'pink';

const headerchild = document.createElement('h1')
headerchild.textContent = "I'm in a div!";
div.appendChild(headerchild);

const parchild = document.createElement('p');
parchild.textContent = 'ME TOO!';
div.appendChild(parchild)

container.appendChild(div);
