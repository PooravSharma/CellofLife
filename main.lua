-----------------------------------------------------------------------------------------
--
-- main.lua
-- Week 8 deliverable
-----------------------------------------------------------------------------------------
--Poorav Sharma 
-- 0 and O are the cell
-- 1 and # is the space
-- i tried using the cell rules but coudn't make detect the neighbours properly -fixed this problem for week 8 deliverables i ended up with two ways to fix it one is to duplicate the old matrix and the other is to create a new metrix and fill it with values
-- i just outputed the iteration 4 for figure 2(b to d)
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
    print("")
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
--[[
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
--]]
function detectNeighbourCells(currentCell, x, y)
    local neighbourCells = 0
    for i = -1, 1 do
        for j = -1, 1 do
            if (i == 0 and j == 0) then

            else
             local row = ((x-1 + i + rows ) % rows)+1
             local colum = ((y-1 + j +colums) % colums)+1
            
             if currentCell[row][colum] == 0 then
                neighbourCells = neighbourCells + 1
             end
             
            end
        end 
       
    end

    return neighbourCells

end 

--[[ creates a empty matrix where it fills the matrix for the next state the according to the rules 
function nextState(currentMatrix)
    local nextStateMatrix = createMatrixArray(rows, colums)
    for i = 1, rows do
        for j = 1, colums do
            x = i
            y= j
            neighbourDetected = detectNeighbourCells(currentMatrix, x, y)
            cellLocated = currentMatrix[i][j]

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


---[[ duplicates the current matrix and changes the cells according to the rules 
function nextState(currentMatrix)
    local nextStateMatrix = duplicateArrayMatrix(currentMatrix)
    for i = 1, rows do
        for j = 1, colums do
            neighbourDetected = detectNeighbourCells(currentMatrix, i, j)
            cellLocated = currentMatrix[i][j]
            if (cellLocated == 0) then
                if(neighbourDetected <2 or neighbourDetected>3) then
                    nextStateMatrix[i][j] = 1
                else 
                    --cell stays the same
                end 
            else 
                if(cellLocated == 1 and neighbourDetected == 3) then 
                    nextStateMatrix[i][j] = 0
                else
                   --cell stays the same
                end
            end
        end 
        
    end
   

    
    displayMatrix(nextStateMatrix)
    return nextStateMatrix
end

function duplicateArrayMatrix(oldMatrix)
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

    
    local currentMatrix = matrix
    iterated =1;
    iteration = 4;
    while  iterated <=iteration do
        currentMatrix = nextState(currentMatrix)
        iterated = iterated +1
        
    end


end

function main()
   local matrix = createMatrixArray(rows, colums)
   ---[[
    fillMatrix(matrix)
    displayMatrix(matrix)
   
    simulate(matrix)
 
end

main()