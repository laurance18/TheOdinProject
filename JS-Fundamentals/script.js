let playerChoice = "";

let choiceArray = [
    'rock',
    'paper',
    'scissors'
]

let roundOver = false;

function roundStart(choice) {
    if(!roundOver) {
        playerChoice = String(choice);
        console.log(`playerChoice updated with ${playerChoice}`)
        compChoice = choiceArray[Math.floor(Math.random()*choiceArray.length)];
        console.log(`compChoice updated with ${compChoice}`)

        if(playerChoice == compChoice) {
            
        }
    }
}