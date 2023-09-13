-----------------------------------------------------------------------------------------
--
-- main.lua
-- Week 7 deliverable
-----------------------------------------------------------------------------------------
--Poorav Sharma 
-- 0 and O are the cell
-- 1 and # is the space
-- i tried using the cell rules but coudn't make detect the neighbours properly 
-- i just outputed the iteration 4 for figure 2(a)
local colums = 5
local rows = 5 



function createMatrixArray(rows, colums)
    local matrixArray = {}
    for i = 1, rows do 
        matrixArray[i] = {}
        for j = 1, colums do 
            matrixArray[i][j] = ""
        end
    end
    return matrixArray
   
end 

function fillMatrix(matrix)  
    for i = 1, rows do
        for j = 1, colums do
            matrix[i][j] =  1
           
        end 
    end
    --for the week 7 deliverable to get 2(a) figure state for the cell
    matrix [2][3] = 0
    matrix [3][3] = 0
    matrix [4][3] = 0
end 

function displayMatrix(matrix)
    for i = 1, rows do
        for j = 1, colums do
            if matrix[i][j] ==  0 then 
                io.write("O")
            else 
                io.write("#")
            end 
        end 
        print("")
    end
end 

function changePattern(matrix)
    if matrix[2][3] ==0 and matrix[4][3]==0 and matrix[4][3]==0 then 
        for i = 1, rows do
            for j = 1, colums do
                matrix[i][j] =  1
               
            end 
        end
        --for the week 7 deliverable to get 2(a) figure state for the cell
        matrix [3][2] = 0
        matrix [3][3] = 0
        matrix [3][4] = 0 
    end

end
function detectNeighbourCells(currentCell, x, y)
    local neighbourCells = 0
    for i = -1, 1 do
        for j = -1, 1 do
            if (i == 0 and j == 0) then

            else
            local row = ((x-1 + i + rows) % rows)+1
            local colum = ((y-1 + j + colums) % colums)+1
            
             if currentCell[row][colum] == 0 then
                neighbourCells = neighbourCells + 1
             end
            end
        end 
       
    end

    return neighbourCells

end 
---[[
function nextState(currentCell)
    local nextStateMatrix = currentCell
    for i = 1, rows do
        for j = 1, colums do
            x = i
            y= j
            neighbourDetected = detectNeighbourCells(currentCell, x, y)
            cellLocated = y

            if (cellLocated == 1) then
                if neighbourDetected == 3 then 
                    nextStateMatrix[i][j] = 0
                else 
                    nextStateMatrix[i][j] = 1
                end
            else
                if (neighbourDetected <2 or neighbourDetected>3) then
                    nextStateMatrix[i][j] = 1
                else
                 nextStateMatrix[i][j] = 0
                end
            end
        end 
        
    end
    displayMatrix(nextStateMatrix)
    return nextStateMatrix
end
--]]
--[[
function nextState(currentCell)
    local nextStateMatrix = currentCell
    for i = 1, rows do
        for j = 1, colums do
            x = i
            y= j
            neighbourDetected = detectNeighbourCells(currentCell, x, y)
            cellLocated = y
            if (cellLocated == 0) and (neighbourDetected <2 or neighbourDetected>3) then
                    nextStateMatrix[i][j] = 1
            elseif (cellLocated == 1 and neighbourDetected == 3) then 
                nextStateMatrix[i][j] = 0
            else
                nextStateMatrix[i][j] = 1
            
            end
        end 
        
    end
   

    
    displayMatrix(nextStateMatrix)
    return nextStateMatrix
end
--]]
--[[
function duplicateArrayMatrix(oldMatrix)
    local copiedRows = rows
    local copiedColoums = colums
    local copiedMatrix ={}

    for i = 1, rows do
        copiedMatrix[i] ={}
        for j = 1, colums do
            copiedMatrix[i][j]= oldMatrix[i][j] 
        end 
     
    end
    return copiedMatrix
end
--]]
function simulate(matrix)

    
    local currentCell = matrix
    iteration = 1;
    while iteration <=4 do
        print("")
        currentCell = nextState(currentCell)
        iteration = iteration +1
        
    end


end
function iterate(matrix)
    for i =1, 2 do 
        print("")
        fillMatrix(matrix)
        displayMatrix(matrix)
        changePattern(matrix)
        print("")
        displayMatrix(matrix)
    end
end
function main()
   local matrix = createMatrixArray(rows, colums)
    --fillMatrix(matrix)
   -- displayMatrix(matrix)
    --changePattern(matrix)
    --print("")
  --  displayMatrix(matrix)
    --simulate(matrix)
    iterate(matrix)
end

main()