# CLIvia generator

This is a CLI trivia game made using Ruby. 

To run this game on your computer:

# 1. Requirements 
It is needed for this program to run to have Ruby installed on your computer.
You may already have Ruby installed on your computer. You can check inside a terminal emulator by typing:

```bash
ruby -v
```

In case you do not have it installed you can do it following the next official ruby guidelines: 

https://www.ruby-lang.org/en/documentation/installation/

# 2. Start the game

Open the terminal and go to the path where the downloaded files are. After that run this on the CLI:

```bash
ruby clivia_generator.rb
```
The following welcome message will appear:

```bash
###################################
#   Welcome to Clivia Generator   #
###################################
random | scores | exit
>
```

To play a random trivia game, type random and press Enter:

```bash
random | scores | exit
> random
```

Input the number corresponding to the answer you think is correct. In this case, if you choose ```1```, you will get feedback:

```bash
Ho Chi Minh City... Incorrect!
The correct answer was: Saigon
```

You will continue answering until all 10 questions have been completed. The game will then display your final score:

```bash
Well done! Your score is 30
--------------------------------------------------
Do you want to save your score? (y/n)
```

If you want to save your score, type y and press Enter. Then, you will be asked to assign a name to the score:

```bash
Do you want to save your score? (y/n)
> y
Type the name to assign to the score
> Jhon Doe
```

After saving, the main menu will reappear:

```bash
###################################
#   Welcome to Clivia Generator   #
###################################
random | scores | exit
>
```

To view the top scores, type scores and press Enter:

```bash
random | scores | exit
> scores
+-----------+-------+
|    Top Scores     |
+-----------+-------+
| Codeable  | 30    |
| Anonymous | 20    |
+-----------+-------+
###################################
#   Welcome to Clivia Generator   #
###################################
random | scores | exit
>
```

When you're ready to quit the program, type exit and press Enter:

```bash
random | scores | exit
> exit
```
To kill the terminal press : 
```ctrl + z```

# 3. Enjoy 

Note: This is a prototype project which means it could contain errors if you find any or want to deliver any feedback
don't hesitate to reach out at: cefita@alumnat.copernic.cat 

