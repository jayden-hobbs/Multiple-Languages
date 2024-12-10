#!/usr/bin/env python3

import random

def play_game_def():
    player_choice = input("Enter your choice (Rock, Paper, Scissors): ").capitalize()

    chosen = random.randint(1, 3)
    if chosen == 1:
        computer = 'Rock'
    elif chosen == 2:
        computer = 'Paper'
    else:
        computer = 'Scissors'

    print(f"\nPlayer Chose: {player_choice}")
    print(f"Computer Chose: {computer}\n")

    if player_choice == computer:
        final_message = 'DRAW'
    elif player_choice == 'Rock' and computer == 'Scissors':
        final_message = 'Player WINS!'
    elif player_choice == 'Rock' and computer == 'Paper':
        final_message = 'Player LOSS'
    elif player_choice == 'Paper' and computer == 'Rock':
        final_message = 'Player WINS!'
    elif player_choice == 'Paper' and computer == 'Scissors':
        final_message = 'Player LOSS'
    elif player_choice == 'Scissors' and computer == 'Paper':
        final_message = 'Player WINS!'
    elif player_choice == 'Scissors' and computer == 'Rock':
        final_message = 'Player LOSS'
    else:
        final_message = 'Invalid Input'

    print(final_message)

print("Welcome to Scissors Rock Paper\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")

while True:
    play_game_def()
    play_again = input("\nDo you want to play again? (yes/no): ").lower()
    if play_again != 'yes':
        print("Thanks for playing! Goodbye!")
        break

