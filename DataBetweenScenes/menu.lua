-- add our gamestate structure
local gameState = require( "gamestate" )

-- add Corona's Storyboard module
local storyboard = require( "storyboard" )

-- create a new scene
local scene = storyboard.newScene()

-- include Corona's "widget" library, we need it for buttons
local widget = require "widget"

-- forward declarations for our level selection buttons
-- needed to remove the buttons from the scene in destroyScene
local level1Btn, level2Btn

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	local label = display.newText(group, "Select level", 20, 20, "Verdana", 14 )
	label:setTextColor( 255, 255, 255 )
	
	-- create 2 buttons that load different levels
	level1Btn = widget.newButton{
		label="1",
		labelColor = { default={255}, over={128} },
		default="assets/images/button.png",
		over="assets/images/button-over.png",
		width=80, height=40,
		onRelease = function()
			
			-- This is the cream of this tutorial
			-- set the level number to 1  
			gameState.level = 1
			
			-- launch the game scene
			storyboard.gotoScene( "game", "fade", 500 )
		end
	}
	level1Btn.view:setReferencePoint( display.CenterReferencePoint )
	level1Btn.view.x = 80
	level1Btn.view.y = display.contentHeight * 0.5
	
	level2Btn = widget.newButton{
		label="2",
		labelColor = { default={255}, over={128} },
		default="assets/images/button.png",
		over="assets/images/button-over.png",
		width=80, height=40,
		onRelease = function()
			
			-- set the level number to 1
			gameState.level = 2
			
			-- launch the game scene
			storyboard.gotoScene( "game", "fade", 500 )
		end
	}
	level2Btn.view:setReferencePoint( display.CenterReferencePoint )
	level2Btn.view.x = 240
	level2Btn.view.y = display.contentHeight * 0.5
	
	-- all display objects must be inserted into group
	-- you must insert .view property for widgets
	group:insert( level1Btn.view )	
	group:insert( level2Btn.view )
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	-- widgets must be manually removed, such as life
	if level1Btn then
		level1Btn:removeSelf()
		level1Btn = nil
	end
	
	if level2Btn then
		level2Btn:removeSelf()
		level2Btn = nil
	end
	
end

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

--don't forget to return the scene
return scene