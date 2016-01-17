-- TutorialMainGameRightScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Dec - 2015
-- Created for: ICS2O
-- This is the scene that tells the user they got the question right with tutorial

TutorialMainGameRightScene = class()

local startTime 

function TutorialMainGameRightScene:init()
    -- you can accept and set parameters here
    
    startTime = ElapsedTime
    tutorialSecondTime = true
end

function TutorialMainGameRightScene:draw()
    -- Codea does not automatically call this method
    
    sprite("SpaceCute:Background", 512, 384, 1024, 768)
 
    -- Changes colour, font, size of text
    -- this text indicates to the user that they are correct and get candy         
    fill(25, 255, 0, 255)
    font("Futura-CondensedExtraBold")
    fontSize(100) 
    text("You got it Correct!",WIDTH/2, 600)
    text("Here is a candy", WIDTH/2, 100)
    sprite("Dropbox:candyForCurrency", WIDTH/2, HEIGHT/2)
    
    if(startTime + 3 < ElapsedTime) then
        Scene.Change("tutorialmaingame")
    end
end

function TutorialMainGameRightScene:touched(touch)
    -- Codea does not automatically call this method
end