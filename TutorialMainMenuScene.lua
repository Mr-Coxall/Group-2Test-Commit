-- TutorialMainMenuScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Dec - 2015
-- Created for: ICS2O
-- This is the main menu scene with the tutorial

TutorialMainMenuScene = class()

--global to this file
local settingsButton
local mainGameButton
local storeButton
local achievementsButton
local leaderboardsButton

function TutorialMainMenuScene:init()
    -- you can accept and set parameters here
    
    settingsButton = Button("Dropbox:Blue Settings Button", vec2(WIDTH/2-390, HEIGHT/2+315))
    mainGameButton = Button("Dropbox:mainMenuPlayButton", vec2(WIDTH/2, HEIGHT/2))
    storeButton = Button("Dropbox:mainMenuStoreButton", vec2(WIDTH/2, HEIGHT/2-300))
    achievementsButton = Button("Dropbox:mainMenuAchievementsButton", vec2(WIDTH/2+300, HEIGHT/2-300))
    leaderboardsButton = Button("Dropbox:mainMenuLeaderboardsButton", vec2(WIDTH/2-300, HEIGHT/2-300))
    
    settingsButton.draggable = false
    mainGameButton.draggable = false 
    storeButton.draggable = false
    achievementsButton.draggable = false
    leaderboardsButton.draggable = false

    music("Dropbox:Nigel Good - Discover", true, 0.25) 
end

function TutorialMainMenuScene:draw()
    -- Codea does not automatically call this method

    sprite("Dropbox:mainMenuScene", WIDTH/2, HEIGHT/2, 1024, 800)
    
    settingsButton:draw()
    mainGameButton:draw()
    storeButton:draw()
    --achievementsButton:draw()
    --leaderboardsButton:draw()
    
    fill(255, 255, 255, 255)
    stroke(0, 0, 0, 255)
    strokeWidth(3)
    rectMode(CENTER)
    rect(WIDTH/2-325, HEIGHT/2, 350, 30) -- Creates white rectangle behind text
    
    fill(0, 0, 0, 255)
    fontSize(27)
    text("Press this to begin the game->", WIDTH/2-320, HEIGHT/2)
end

function TutorialMainMenuScene:touched(touch)
    -- Codea does not automatically call this method
    
    mainGameButton:touched(touch)
    
    if(mainGameButton.selected == true) then
        Scene.Change("tutorialworlds")
    end
end