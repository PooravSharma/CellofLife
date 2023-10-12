local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    -- Code here runs when the scene is first created but has not yet appeared on screen
    composer.removeScene("scenes.userinputstate")
    composer.removeScene("scenes.randomstate")
    composer.removeScene("scenes.loadstate")
    display.remove(gameTitle)
    gameTitle = nil
    -- Assign "self.view" to local variable "sceneGroup" for easy reference
    local sceneGroup = self.view
    gameTitle = display.newText({
        text = "Game of Life",  
        x = display.contentCenterX,  -- To Center the text horizontally
        y = -40,  
        fontSize = 50,  -- To Set the font size
        font = native.systemFontBold,  -- Use a system font
    })
    gameTitle:setFillColor(0, 1, 0) 
    local title = display.newText({
        text = "Choose how you want to \nstart the Game!!!",  
        x = display.contentCenterX,  -- To Center the text horizontally
        y = 40,  
        fontSize = 25,  -- To Set the font size
        font = native.systemFontBold,  -- Use a system font
    })
    title:setFillColor(1, 1, 1) 

    ---Making buttom for the random seed start state
    local buttonRandom = display.newGroup()
    local randombuttonBoxborder = display.newRect(buttonRandom, 160, 160, 285, 55 )
    local randombuttonBox = display.newRect(buttonRandom, 160, 160, 280, 50 )

    randombuttonBox:setFillColor(1, 1, 0)
    randombuttonBoxborder:setFillColor(1, 1, 1)
    local randombuttonText = display.newText({
        text = "Start State with Random seeds", 
        x = 160,  -- To set text horizontally
        y = 160, 
        fontSize = 18,  -- To Set the font size
        font = native.systemFontBold,  -- Useing a system font
    })
    randombuttonText:setFillColor(0, 0, 0) 
    buttonRandom:insert(randombuttonText)

     ---Making buttom for the user input seed start state
    local buttonuserInput = display.newGroup()
    local userinputbuttonBoxborder = display.newRect(buttonuserInput, 160, 260, 285, 55 )
    local userinputbuttonBox = display.newRect(buttonuserInput, 160, 260, 280, 50 )

    userinputbuttonBox:setFillColor(0/255, 200/255, 0/255)
    userinputbuttonBoxborder:setFillColor(1, 1, 1)
    local userinputbuttonText = display.newText({
        text = "Personally Input Start State", 
        x = 160,  -- To set text horizontally
        y = 260, 
        fontSize = 18,  -- To Set the font size
        font = native.systemFontBold,  -- Useing a system font
    })
    userinputbuttonText:setFillColor(0, 0, 0) 
    buttonuserInput:insert(userinputbuttonText)
    
     ---Making buttom load saved start state
    local buttonLoad = display.newGroup()
    local loadbuttonBoxborder = display.newRect(buttonLoad, 160, 360, 285, 55 )
    local loadbuttonBox = display.newRect(buttonLoad, 160, 360, 280, 50 )

    loadbuttonBox:setFillColor(255/255, 165/255, 0/255)
    loadbuttonBoxborder:setFillColor(1, 1, 1)
    local loadbuttonText = display.newText({
        text = "Load Saved State", 
        x = 160,  -- To set text horizontally
        y = 360, 
        fontSize = 18,  -- To Set the font size
        font = native.systemFontBold,  -- Useing a system font
    })
    loadbuttonText:setFillColor(0, 0, 0) 
    buttonLoad:insert(loadbuttonText)

    local buttonBackGroup = display.newGroup()
    local buttonBack = display.newRect(buttonBackGroup, 160, 525, 100, 50 )
    buttonBack:setFillColor(1, 1, 0)
    local backbuttonText = display.newText({
        text = "Back", 
        x = 160,  -- To set text horizontally
        y = 525, 
        fontSize = 30,  -- To Set the font size
        font = native.systemFontBold,  -- Useing a system font
    })
    backbuttonText:setFillColor(0, 0, 0) 
    buttonBackGroup:insert(backbuttonText)

    -- Insert Buttons into "sceneGroup"
    sceneGroup:insert( buttonRandom )
    sceneGroup:insert( buttonuserInput )
    sceneGroup:insert( buttonLoad )
    sceneGroup:insert(title)
    sceneGroup:insert(buttonBackGroup)
    --sceneGroup:insert(gameTitle)

    scene.backState = buttonBackGroup
    scene.randomState = buttonRandom
    scene.loadState = buttonLoad
    scene.userinputState = buttonuserInput
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        scene.randomState:addEventListener("tap", function()
            composer.removeScene("scenes.randomstate")
            composer.gotoScene("scenes.randomstate", { effect = "slideLeft", time = 500 })
        end)
        scene.loadState:addEventListener("tap", function()
            composer.removeScene("scenes.loadstate")
            composer.gotoScene("scenes.loadstate", { effect = "slideLeft", time = 500 })
        end)
        scene.userinputState:addEventListener("tap", function()
            composer.removeScene("scenes.userinputstate")
            composer.gotoScene("scenes.userinputstate", { effect = "slideLeft", time = 500 })
        end)

        scene.backState:addEventListener("tap", function()
            display.remove(gameTitle)
            gameTitle = nil
            composer.removeScene("scenes.game")
            composer.gotoScene("scenes.homescreen", { effect = "fade", time = 500 })
         
        end)


    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
       

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene

