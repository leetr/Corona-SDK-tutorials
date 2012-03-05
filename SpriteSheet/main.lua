--load sprite module
local sprite = require( "sprite" )

-- load spritesheet image
-- 1st parameter is a path to the image file
-- 2nd frame width
-- 3rd frame height
local pteroSheet = sprite.newSpriteSheet( "assets/images/ptero_fly_anim.png", 252, 120 )

-- create a spriteset
-- 1st parameter is the spritesheet we just created, 
-- 2nd is the number of the first frame
-- 3rd is the total nmber of frames in the animation
local pteroSet = sprite.newSpriteSet( pteroSheet, 1, 6 )

-- add spriteset to the sprite module, so that we can instanciate it later
-- 1st param is the spriteset we created above
-- 2nd - a name for our animation (we'll use it to create an instance later)
-- 3rd - start frame
-- 4th - number of frames
-- 5th - time in millis for a full animation
-- 6th - number of loops to play, -2 is for continuous looping
sprite.add( pteroSet, "ptero", 1, 6, 300, -2 )

--create white background
local background = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
background:setFillColor( 255 )

--create an instance of our animated sprite
local ptero = sprite.newSprite( pteroSet )

--center it on screen
ptero:setReferencePoint( display.CenterReferencePoint )
ptero.x = display.contentWidth / 2
ptero.y = display.contentHeight / 2

-- start animating
ptero:prepare( "ptero" )
ptero:play()