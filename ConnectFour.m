clc 
clear
close all
%Connect Four 

%Initializing the sprites 
my_scene = simpleGameEngine('connect_four.png',86,101,4);

blank_square=1;
red_square=2;
black_square=3;
gameboard_display= ones(7,7)*blank_square;
top = ones(7,7)*blank_square;


%Input User Name
User1Name=input('Type user 1 name (Red Chip):','s' );
user2Name=input('Type user 2 name (Black Chip):','s');

drawScene(my_scene,gameboard_display,top)
title(User1Name);

%INput User Chip Placement
%Example:
%[clickR, clickC] = getMouseInput(my_scene);
%clickR is the row from clicking, clickC is col


redWin=0;
blackWin=0;

%while loop so that while the winner true/false is still false,
%game keeps looping
while (redWin==0) && (blackWin==0)
    [row,column] = getMouseInput(my_scene);
    row=1;
    %Place the chip in the board for red
    player = 2;
    while (top(row+1,column)==blank_square) && row<7
        row=row+1;
        if (row==7)
            break;
        end
    end
    
    top(row,column)=red_square;
    drawScene(my_scene,gameboard_display,top)
    title(user2Name);
    row = row
    column = column
    top = top;

    %check for winner function
    [colSum, rowSum, diagOneSum, diagTwoSum] = countWin(row, column, top, player);
    %did function return a winner?
    if colSum>=4
        redWin=1;
        break;
    end
    if rowSum>=4
        redWin=1;
        break;
    end
    if diagOneSum>=4
        redWin=1;
        break;
    end

    if diagTwoSum>=4
        redWin=1;
        break;
    end
%add black chip player placing their chip
    [row,column] = getMouseInput(my_scene);
    row=1;
    player = 3;
    while (top(row+1,column)==blank_square) && row<7
        row=row+1;
        if (row==7)
            break;
        end
    end
    
    top(row,column)=black_square;
    drawScene(my_scene,gameboard_display,top)
    title(User1Name)
    %it needs this for some reason
    row = row;
    column = column;
    top = top;

    %check for winner function
    [colSum, rowSum, diagOneSum, diagTwoSum] = countWin(row, column, top, player);
    

    if colSum>=4
        blackWin=1;
        break;
    end

    if rowSum>=4
        blackWin=1;
        break;
    end

    if diagOneSum>=4
        blackWin=1;
        break;
    end

    if diagTwoSum>=4
        blackWin=1;
        break;
    end

%end loop
end

%say who won
if (redWin==1)
    winner = [User1Name, ' Won!'];
    title(winner)
    fprintf('%s won!',User1Name)
elseif blackWin==1
    winner = [user2Name, ' Won!'];
    title(winner)
    fprintf('%s won!',user2Name)
end
