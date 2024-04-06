import random
#note: standard 3 rounds for this game
user_score = 0

for i in range(1,4):
    player_choice = input('Rock, paper, scissors! What do you choose?')
    computer = random.choice(['rock', 'paper', 'scissors'])  

    print(f'player: {player_choice}, computer: {computer}')  
    
    if player_choice == computer:
        print('No one loses!')
    elif player_choice.lower() == 'rock':
        if computer == 'paper':
            print('Sorry, you lost this round :(')
        elif computer == 'scissors':
            print('You win, noice!')
            user_score += 1
    elif player_choice.lower() == 'paper':
        if computer == 'scissors':
            print('Sorry, you lost this round :(')
        elif computer == 'rock':
            print('You win, noice!')
            user_score += 1
    elif player_choice.lower() == 'scissors':
        if computer == 'rock':
            print('Sorry, you lost this round :(')
        elif computer == 'paper':
            print('You win, noice!')
            user_score += 1
    print(f'user_score: {user_score}')

    
