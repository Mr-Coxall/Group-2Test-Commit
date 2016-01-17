-- SettingsScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the settings scene 

SettingsScene = class()

--global to this file
local creditsButton
local homeButton
local musicOnButton
local musicOffButton

function SettingsScene:init()
    -- you can accept and set parameters here
    
    creditsButton = Button("Dropbox:creditsButton", vec2(WIDTH/2, HEIGHT/2-200))
    homeButton = Button("Dropbox:homeButton", vec2(WIDTH/2-400, HEIGHT/2+325))
    musicOnButton = Button("Dropbox:settingsMusicOnButton", vec2(WIDTH/2+150, HEIGHT/2+150))
    musicOffButton = Button("Dropbox:settingsMusicOffButton", vec2(WIDTH/2+300, HEIGHT/2+150))
    
    creditsButton.draggable = false
    homeButton.draggable = false 
    musicOnButton.draggable = false
    musicOffButton.draggable = false
end

function SettingsScene:draw()
    -- Codea does not automatically call this method
    
    background(0, 0, 0, 255)
    
    creditsButton:draw()
    homeButton:draw()
    musicOnButton:draw()
    musicOffButton:draw()
    
    fill(255, 255, 255, 255)
    fontSize(60)
    text("Settings", WIDTH/2, HEIGHT/2+300)
    fontSize(55)
    text("Music", WIDTH/2-300, HEIGHT/2+150)
end

function SettingsScene:touched(touch)
    -- Codea does not automatically call this method
    creditsButton:touched(touch)
    homeButton:touched(touch)
    musicOnButton:touched(touch)
    musicOffButton:touched(touch)
    
    if(creditsButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        Scene.Change("credits")
    elseif(homeButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        Scene.Change("mainmenu")
    elseif(musicOnButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        music("Dropbox:Nigel Good - This Is Forever")
        musicOff = false
    elseif(musicOffButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        music.stop()
        musicOff = true
    end
end