-- GameLogoScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the second scene (game logo)

GameLogoScene = class()

--global to this file
local startTime2

function GameLogoScene:init()

    startTime2 = ElapsedTime
end

function GameLogoScene:draw()
    -- Codea does not automatically call this method
    
    sprite("Dropbox:gameLogo", WIDTH/2, HEIGHT/2)
    
    if(startTime2 + 2 < ElapsedTime) then
        if tutorialOver then
            Scene.Change("mainmenu")
        else 
            Scene.Change("tutorialmainmenu")
        end
    end
end

function GameLogoScene:touched(touch)
    -- Codea does not automatically call this method
end