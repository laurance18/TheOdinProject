let playerChoice = "";
let winCheck = {
    'rock' : 'scissors',
    'paper': 'rock',
    'scissors' : 'paper'
};

let choiceArray = [
    'rock',
    'paper',
    'scissors'
]

let playerScore = 0;
let compScore = 0;

let roundOver = false;
const resultDiv = document.getElementById('result');


function roundStart(choice) {
    if(!roundOver) {
        playerChoice = String(choice);
        compChoice = choiceArray[Math.floor(Math.random()*choiceArray.length)];
        console.log(`playerChoice: ${playerChoice}\ncompChoice: ${compChoice}`);

        if(playerChoice == compChoice) {
            resultDiv.textContent = "It's a tie!";
        }
        else if (winCheck[playerChoice] == compChoice){
            playerScore++;
            resultDiv.textContent = `${playerChoice.charAt(0).toUpperCase() + playerChoice.slice(1)} beats ${compChoice}!!`;
            updateScore();
        }
        else {
            compScore++;
            resultDiv.textContent = `${compChoice.charAt(0).toUpperCase() + compChoice.slice(1)} beats ${playerChoice}!!`;
            updateScore();
        }
    }
    else {
        alert("Round is over! Refresh the page to play again.")
    }
}

function updateScore() {
    (document.getElementById('pscore')).textContent = playerScore;
    (document.getElementById('cscore')).textContent = compScore;
    if (playerScore == 5 || compScore == 5) {
        roundOver = true;
        playerScore > compScore ? resultDiv.textContent = "PLAYER WINS!" : resultDiv.textContent = "COMPUTER WINS!" 
    }
}