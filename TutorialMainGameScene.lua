-- TutorialMainGameScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Dec - 2015
-- Created for: ICS2O
-- This is the main game scene with the tutorial

TutorialMainGameScene = class()

local equationToDrag
local greenCircle
local redCircle
local smallGreenCircle
local smallRedCircle

function TutorialMainGameScene:init()
    
    equationToDrag = SpriteObject("Dropbox:tutorialEquation", vec2(WIDTH/2, HEIGHT/2+275))
    greenCircle = SpriteObject("Dropbox:tutorialGreenCircle", vec2(WIDTH/2+350, HEIGHT/2-200))
    redCircle = SpriteObject("Dropbox:tutorialRedCircle", vec2(WIDTH/2-350, HEIGHT/2-200))
    smallGreenCircle = SpriteObject("Dropbox:tutorialSmallGreenCircle", vec2(WIDTH/2+350, HEIGHT/2-200))
    smallRedCircle = SpriteObject("Dropbox:tutorialSmallRedCircle", vec2(WIDTH/2-350, HEIGHT/2-200))
    
    greenCircle.draggable = false
    redCircle.draggable = false 
    smallGreenCircle.draggable = false
    smallRedCircle.draggable = false
end

function TutorialMainGameScene:draw()
    
    sprite("Dropbox:chocolateScene", WIDTH/2, HEIGHT/2)

    greenCircle:draw()
    redCircle:draw()
    equationToDrag:draw()
    
    fill(255, 255, 255, 255)
    stroke(0, 0, 0, 255)
    strokeWidth(3)
    rectMode(CENTER)
    
    if tutorialSecondTime then
        rect(WIDTH/2, HEIGHT/2, 500, 40) -- Creates white rectangle behind text
    else
        rect(WIDTH/2, HEIGHT/2, 450, 40) -- Creates white rectangle behind text
    end
    
    fill(0, 0, 0, 255)
    fontSize(30)
    
    if tutorialSecondTime then
        text("Now drag the equation to the red circle", WIDTH/2, HEIGHT/2)
    else
        text("Drag the equation to the green circle", WIDTH/2, HEIGHT/2)
    end
end

function TutorialMainGameScene:touched(touch)
    
    equationToDrag:touched(touch)
    greenCircle:touched(touch)
    redCircle:touched(touch)
    smallGreenCircle:touched(touch)
    smallRedCircle:touched(touch)
    
    if tutorialSecondTime then
        if(equationToDrag:isTouching(smallRedCircle)) then
            Scene.Change("tutorialwrong")
        end
    else
        if(equationToDrag:isTouching(smallGreenCircle) == true) then
            Scene.Change("tutorialright")
        end
    end 
end