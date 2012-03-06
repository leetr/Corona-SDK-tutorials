-- add our gamestate structure
local gameState = require( "gamestate" )

-- add Corona's Storyboard module
local storyboard = require( "storyboard" )

-- create a new scene
local scene = storyboard.newScene()

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	-- LOOK HERE: this is where we're displaying the level number
	local label = display.newText(group, ("You chose level #" .. gameState.level), 20, 20, "Verdana", 14 )
	label:setTextColor( 0, 0, 0 )
	
	-- create a white rectangle as the backdrop
	local background = display.newRect( 0, 0, display.contentWidth , display.contentHeight )
	background:setFillColor( 255 )
	
	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( label )
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
end

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

return scene