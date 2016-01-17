-- AchievementsScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the achievements scene 

AchievementsScene = class()

local homeButton

function AchievementsScene:init()
    -- you can accept and set parameters here
    homeButton = Button("Dropbox:homeButton", vec2(WIDTH/2-400, HEIGHT/2+325))
    homeButton.draggable = false 
end

function AchievementsScene:draw()
    -- Codea does not automatically call this method
    background(0, 0, 0, 255)
    homeButton:draw()
    
    fill(255, 255, 255, 255)
    fontSize(60)
    text("Achievements", WIDTH/2, HEIGHT/2+300) 
    
    --ACHIEVEMENTS (left side)
    fontSize(30)
    text("Complete tutorial", WIDTH/2-200, HEIGHT/2+200)
    text("Complete Lollipop World", WIDTH/2-200, HEIGHT/2+150)
    text("Complete Chocolate World", WIDTH/2-200, HEIGHT/2+100)
    text("Complete Gummy World", WIDTH/2-200, HEIGHT/2+50)
    text("Complete Jellybean World", WIDTH/2-200, HEIGHT/2)
    text("Complete Sugar Mountain World", WIDTH/2-200, HEIGHT/2-50)
    --ACHIEVEMENTS (right side)
    text("Complete 50 Equations", WIDTH/2+200, HEIGHT/2+150)
    text("Complete 100 Equations", WIDTH/2+200, HEIGHT/2+100)
    text("Get an equation correct", WIDTH/2+200, HEIGHT/2+200)
    text("Buy something from the store", WIDTH/2+200, HEIGHT/2+50)
    text("Buy everything from the store", WIDTH/2+200, HEIGHT/2)
    text("Look at credits", WIDTH/2+200, HEIGHT/2-50)
    text("Complete Game", WIDTH/2+200, HEIGHT/2-100)
    text("Complete all achievements", WIDTH/2+200, HEIGHT/2-150)
end

function AchievementsScene:touched(touch)
    -- Codea does not automatically call this method
    
    homeButton:touched(touch)
    
    if(homeButton.selected == true) then
        Scene.Change("mainmenu")
    end
end