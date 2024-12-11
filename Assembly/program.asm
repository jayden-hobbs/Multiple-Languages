section .data
    prompt db "Choose Rock (r), Paper (p), or Scissors (s): $"
    invalid_choice db "Invalid choice. Please enter r, p, or s.$"
    player_prompt db "Your choice: $"
    computer_prompt db "Computer's choice: $"
    tie db "It's a tie!$"
    win db "You win!$"
    lose db "You lose!$"
    valid_choices db "rps$"

section .bss
    player_choice resb 1
    computer_choice resb 1

section .text
    global _start

_start:
    ; Display prompt to choose Rock, Paper, or Scissors
    mov ah, 09h
    lea dx, [prompt]
    int 21h

    ; Get player input (choice)
    lea dx, [player_prompt]
    mov ah, 09h
    int 21h

    ; Read user input (one character)
    mov ah, 01h
    int 21h
    mov [player_choice], al

    ; Validate the player input (r, p, s)
    lea dx, [invalid_choice]
    mov al, [player_choice]
    cmp al, 'r'
    je .valid_choice
    cmp al, 'p'
    je .valid_choice
    cmp al, 's'
    je .valid_choice
    jmp _start

.valid_choice:
    ; Display computer's choice
    lea dx, [computer_prompt]
    mov ah, 09h
    int 21h

    ; Generate computer's random choice (use random number and map to r, p, s)
    call random_choice
    mov al, [computer_choice]

    ; Output computer's choice
    mov ah, 02h
    lea dx, [computer_choice]
    int 21h

    ; Determine the winner
    mov al, [player_choice]
    cmp al, [computer_choice]
    je .tie
    cmp al, 'r'
    je .player_rock
    cmp al, 'p'
    je .player_paper
    cmp al, 's'
    je .player_scissors

.tie:
    lea dx, [tie]
    mov ah, 09h
    int 21h
    jmp _start

.player_rock:
    mov al, [computer_choice]
    cmp al, 's'
    je .player_wins
    cmp al, 'p'
    je .player_loses
    jmp _start

.player_paper:
    mov al, [computer_choice]
    cmp al, 'r'
    je .player_wins
    cmp al, 's'
    je .player_loses
    jmp _start

.player_scissors:
    mov al, [computer_choice]
    cmp al, 'p'
    je .player_wins
    cmp al, 'r'
    je .player_loses
    jmp _start

.player_wins:
    lea dx, [win]
    mov ah, 09h
    int 21h
    jmp _start

.player_loses:
    lea dx, [lose]
    mov ah, 09h
    int 21h
    jmp _start

; Random choice generator for the computer
random_choice:
    ; Use DOS interrupt 0x2C to get the system time (for randomness)
    mov ah, 2Ch
    int 21h
    ; Use the low byte of the system time as a "seed" for random number
    ; Then modulo i
