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

    -- Assign "self.view" to local variable "sceneGroup" for easy reference
    local sceneGroup = self.view

    local title = display.newText({
        text = "Game of Life",  
        x = display.contentCenterX,  -- To Center the text horizontally
        y = 40,  
        fontSize = 50,  -- To Set the font size
        font = native.systemFontBold,  -- Use a system font
    })
    local myDetail = display.newText({
        text = "By Poorav Sharma \nStudent ID: 10636908",  
        x = display.contentCenterX,  -- To Center the text horizontally
        y = 100, 
        fontSize = 18,  -- To Set the font size
        font = native.systemFontBold,  -- Use a system font
    })

    -- Set the text color
    title:setFillColor(0, 1, 0) 
    myDetail:setFillColor(1, 0, 0) 

    ---Inserting the image for the home screen 
    local homeScreenPic = display.newImage("homescreen.png")
    -- Set the homeScreenPic's size
    homeScreenPic.width = 300
    homeScreenPic.height = 300
    -- Set the homeScreenPic's position
    homeScreenPic.x = 160
    homeScreenPic.y = 300

    local rect = display.newRect( 160, 300, 303, 303 )

    local buttonGroup = display.newGroup()
    local buttonBox = display.newRect(buttonGroup, 160, 525, 100, 50 )
    buttonBox:setFillColor(1, 1, 0)
    local buttonText = display.newText({
        text = "Enter", 
        x = 160,  -- To set text horizontally
        y = 525, 
        fontSize = 30,  -- To Set the font size
        font = native.systemFontBold,  -- Useing a system font
    })
    buttonText:setFillColor(0, 0, 0) 
    buttonGroup:insert(buttonText)



    -- Insert rectangle into "sceneGroup"
    sceneGroup:insert(rect)
    sceneGroup:insert(homeScreenPic)
    sceneGroup:insert (title)
    sceneGroup:insert(myDetail)
    sceneGroup:insert(buttonGroup)
    scene.btn = buttonGroup
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        scene.btn:addEventListener("tap", function()
            composer.removeScene("scenes.homescreen")
            composer.gotoScene("scenes.game", { effect = "fade", time = 500 })
         
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

