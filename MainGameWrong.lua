-- MainGameWrong
-- FinalAppGroup2-2015

-- Created by: Luke Vandenberghe and Zacharias Octavious
-- Created on: Dec - 2015
-- Created for: ICS2O
-- This is the main game right scene where the program tells the user they were incorrect

MainGameWrong = class()

local startTime

function MainGameWrong:init()

    startTime = ElapsedTime
end

function MainGameWrong:draw()
    
    --backround (only temporary) more backrounds need to be added
    sprite("SpaceCute:Background", 512, 384, 1024, 768)
    
    -- Changes colour, font, size of text
    -- this text indicates to the user that they are incorrect and don't get candy 
    --it also shows them the correct answer          
    fill(255, 13, 0, 255)       
    font("Futura-CondensedExtraBold")
    fontSize(80) 
    text("You got it Incorrect...",WIDTH/2, 700)
    text("The Correct Answer was:",WIDTH/2,600)
    text("No Candy for you!", WIDTH/2, 100)
    fill(0, 255, 0, 255)
    text(" "..MainGameScene.getNumber1().." "..MainGameScene.getEquationType().." "..MainGameScene.getNumber2().." = "..MainGameScene.getEquationAnswer(), WIDTH/2,500)
    
    if(startTime + 5 < ElapsedTime) then
       if (MainGameScene:isGameOver() == true ) then
            Scene.Change("totalscore")   
       else
            MainGameScene.changeTheEquation()
            Scene.Change("maingame")
       end
    end
end

function MainGameWrong:touched(touch)

end