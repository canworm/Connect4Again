function[colSum, rowSum, diagOneSum, diagTwoSum] = countWin(row, column, top, player)
%check for winner: col
    colSum = 1;

    %check below
    checkRow = row;
   while checkRow<7
        if top(checkRow+1,column)==player
            checkRow = checkRow+1;
            colSum = colSum+1;
        else
            break;
        end
    end
    %check above
    checkRow = row;
    while checkRow>1
        if top(checkRow-1,column)==player
            checkRow = checkRow-1;
            colSum=colSum+1;
        else
            break
        end
    end

    
    %check for winner: row
    rowSum = 1;
    checkCol = column;

    %check behind
    while (checkCol>1)
        if top(row,checkCol-1)==player
            checkCol=checkCol-1;
            rowSum=rowSum+1;
        else
            break;
        end
    end

    %check in front
    checkCol = column;
    while (checkCol<7)
        if top(row,checkCol+1)==player
            checkCol=checkCol+1;
            rowSum=rowSum+1;
        else
            break;
        end
    end

    
%Check for winner: diagonal
    diagOneSum = 1;
    diagTwoSum = 1;
    %check above/to the right
    checkCol = column;
    checkRow = row;
    while checkRow>1 && checkCol<7
        if top(checkRow-1,checkCol+1)==player
            diagOneSum = diagOneSum+1;
            checkRow=checkRow-1;
            checkCol=checkCol+1;
        else
            break;
        end
    end

    %check above/to the left
    checkCol = column;
    checkRow = row;
    while checkRow>1 && checkCol>1
        if top(checkRow-1,checkCol-1)==player
            diagTwoSum = diagTwoSum+1;
            checkRow=checkRow-1;
            checkCol=checkCol-1;
        else
            break;
        end
    end

    %check below/to the right
    checkCol = column;
    checkRow = row;
    while checkRow<7 && checkCol<7
        if top(checkRow+1,checkCol+1)==player
            diagTwoSum=diagTwoSum+1;
            checkRow=checkRow+1;
            checkCol=checkCol+1;
        else
            break;
        end
    end
    %check below/to the left
    checkCol = column;
    checkRow = row;
    while checkRow<7 && checkCol>1
        if top(checkRow+1,checkCol-1)==player
            diagOneSum=diagOneSum+1;
            checkRow=checkRow+1;
            checkCol=checkCol-1;
        else
            break;
        end
    end
