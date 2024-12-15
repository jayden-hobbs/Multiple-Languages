import kotlin.random.Random

fun getPlayerChoice(): String {
    println("Choose rock, paper, or scissors: ")
    return readLine()!!.lowercase()
}

fun getComputerChoice(): String {
    val choices = listOf("rock", "paper", "scissors")
    return choices[Random.nextInt(choices.size)]
}

fun determineWinner(playerChoice: String, computerChoice: String) {
    if (playerChoice == computerChoice) {
        println("It's a tie!")
    } else if (
        (playerChoice == "rock" && computerChoice == "scissors") ||
        (playerChoice == "paper" && computerChoice == "rock") ||
        (playerChoice == "scissors" && computerChoice == "paper")
    ) {
        println("Player: $playerChoice, Computer: $computerChoice")
        println("You win!")
    } else {
        println("Player: $playerChoice, Computer: $computerChoice")
        println("You lose!")
    }
}

fun main() {
    val playerChoice = getPlayerChoice()
    val computerChoice = getComputerChoice()
    determineWinner(playerChoice, computerChoice)
}

