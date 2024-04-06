#! /bin/bash

echo "Would you like to play rock,  paper, scissors: yes or no?"
read user_input

if [ $user_input == "yes" ]
then
    python3 rps.py
else
    echo "That's too bad, maybe next time."
fi
