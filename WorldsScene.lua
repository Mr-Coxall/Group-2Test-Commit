-- WorldsScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Dec - 2015
-- Created for: ICS2O
-- This is the worlds selector scene 

WorldsScene = class()

local homeButton
local additionWorldButton
local subtractionWorldButton
local multiplicationWorldButton
local divisionWorldButton
local sugarMountainWorldButton

function WorldsScene:init()
    
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

function WorldsScene:draw()
    
    sprite("Dropbox:levelSelectBackground", WIDTH/2, HEIGHT/2)
    
    homeButton:draw()
    additionWorldButton:draw()
    subtractionWorldButton:draw()
    multiplicationWorldButton:draw()
    divisionWorldButton:draw()
    sugarMountainWorldButton:draw()
    
    fill(0, 0, 0, 255)
    fontSize(60)
    text("Worlds", WIDTH/2, HEIGHT/2+300) 
end

function WorldsScene:touched(touch)
    -- Codea does not automatically call this method
    
    homeButton:touched(touch)
    additionWorldButton:touched(touch)
    subtractionWorldButton:touched(touch)
    multiplicationWorldButton:touched(touch)
    divisionWorldButton:touched(touch)
    sugarMountainWorldButton:touched(touch)
    
    if(homeButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        Scene.Change("mainmenu")
    end

    if(additionWorldButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        worldSelected = "+"
        Scene.Change("levels")
    elseif(subtractionWorldButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        worldSelected = "-"
        Scene.Change("levels")
    elseif(multiplicationWorldButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        worldSelected = "*"
        Scene.Change("levels")
    elseif(divisionWorldButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        worldSelected = "/"
        Scene.Change("levels")
    elseif(sugarMountainWorldButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        worldSelected = "?" 
        Scene.Change("levels")
    end
end