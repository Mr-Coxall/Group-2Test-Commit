-- TutorialWorldsScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Dec - 2015
-- Created for: ICS2O
-- This is the worlds selector scene with the tutorial

TutorialWorldsScene = class()

local homeButton
local additionWorldButton
local subtractionWorldButton
local multiplicationWorldButton
local divisionWorldButton
local sugarMountainWorldButton

function TutorialWorldsScene:init()
    
    homeButton = Button("Dropbox:homeButton", vec2(WIDTH/2-400, HEIGHT/2+325))
    additionWorldButton = Button("Dropbox:additionWorldSelect", vec2(WIDTH/2-325, HEIGHT/2+150))
    subtractionWorldButton = Button("Dropbox:subtractionWorldSelect", vec2(WIDTH/2+325, HEIGHT/2+150))
    multiplicationWorldButton = Button("Dropbox:multiplicationWorldSelect", vec2(WIDTH/2-325, HEIGHT/2-230))
    divisionWorldButton = Button("Dropbox:divisionWorldSelect", vec2(WIDTH/2+325, HEIGHT/2-230))
    sugarMountainWorldButton = Button("Dropbox:sugarMountainWorldSelect", vec2(WIDTH/2, HEIGHT/2))
        
    homeButton.draggable = false
    additionWorldButton.draggable = false
    subtractionWorldButton.draggable = false
    multiplicationWorldButton.draggable = false 
    divisionWorldButton.draggable = false 
    sugarMountainWorldButton.draggable = false
end

function TutorialWorldsScene:draw()
    
    sprite("Dropbox:levelSelectBackground", WIDTH/2, HEIGHT/2)
    
    homeButton:draw()
    additionWorldButton:draw()
    subtractionWorldButton:draw()
    multiplicationWorldButton:draw()
    divisionWorldButton:draw()
    sugarMountainWorldButton:draw()
    
    fill(255, 255, 255, 255)
    stroke(0, 0, 0, 255)
    strokeWidth(3)
    rectMode(CORNER)
    rect(WIDTH/2-222, HEIGHT/2+125, 280, 30)
    
    fill(0, 0, 0, 255)
    fontSize(60)
    text("Worlds", WIDTH/2, HEIGHT/2+300) 
    fontSize(24)
    text("<- Press the addition world", WIDTH/2-90, HEIGHT/2+140)
end

function TutorialWorldsScene:touched(touch)
    -- Codea does not automatically call this method    
    
    additionWorldButton:touched(touch)

    if(additionWorldButton.selected == true) then
        Scene.Change("tutoriallevels")
    end
end