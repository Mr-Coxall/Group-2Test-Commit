-- StoreScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the store scene 

StoreScene = class()

local homeButton 
local buyButtonForSkips
local buyButtonForBackgrounds
local backgroundPreviewRed
local backgroundPreviewGreen
local backgroundPreviewBlue

function StoreScene:init()
    -- you can accept and set parameters here
    homeButton = Button("Dropbox:homeButton", vec2(WIDTH/2-400, HEIGHT/2+325))
    buyButtonForSkips = Button("Dropbox:storeBuyButton", vec2(WIDTH/2+350, HEIGHT/2+150))
    buyButtonForBackgrounds = Button("Dropbox:storeBuyButton", vec2(WIDTH/2+350, HEIGHT/2))
    backgroundPreviewRed = Button("Dropbox:storeBackgroundPreviewRed", vec2(WIDTH/2-75, HEIGHT/2))
    backgroundPreviewGreen = Button("Dropbox:storeBackgroundPreviewGreen", vec2(WIDTH/2, HEIGHT/2))
    backgroundPreviewBlue = Button("Dropbox:storeBackgroundPreviewBlue", vec2(WIDTH/2+75, HEIGHT/2))
    
    homeButton.draggable = false 
    buyButtonForSkips.draggable = false
    buyButtonForBackgrounds.draggable = false
    backgroundPreviewRed.draggable = false
    backgroundPreviewGreen.draggable = false
    backgroundPreviewBlue.draggable = false
end

function StoreScene:draw()
    -- Codea does not automatically call this method
    background(0, 0, 0, 255)
    homeButton:draw()
    buyButtonForSkips:draw()
    buyButtonForBackgrounds:draw()
    backgroundPreviewRed:draw()
    backgroundPreviewGreen:draw()
    backgroundPreviewBlue:draw()
    
    fill(255, 255, 255, 255)
    fontSize(60)
    text("Store", WIDTH/2, HEIGHT/2+300) 
    fontSize(55)
    text("Skips", WIDTH/2-300, HEIGHT/2+150)
    text("15", WIDTH/2+190, HEIGHT/2+150) -- cost for skips
    sprite("Dropbox:candyForCurrency", WIDTH/2+260, HEIGHT/2+155, 75, 75)
    text("Backgrounds", WIDTH/2-300, HEIGHT/2)
    text("10", WIDTH/2+190, HEIGHT/2) -- cost for backgrounds
    sprite("Dropbox:candyForCurrency", WIDTH/2+260, HEIGHT/2+5, 75, 75)
    
    --amount of candy in basket in top right of screen
    text(amountOfCandyInBasket, WIDTH/2+300, HEIGHT/2+325)
    sprite("Dropbox:candyForCurrency", WIDTH/2+400, HEIGHT/2+325, 75, 75)
end

function StoreScene:touched(touch)
    -- Codea does not automatically call this method
    homeButton:touched(touch)
    buyButtonForSkips:touched(touch)
    buyButtonForBackgrounds:touched(touch)
    backgroundPreviewRed:touched(touch)
    backgroundPreviewGreen:touched(touch)
    backgroundPreviewBlue:touched(touch)
    
    if(homeButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        Scene.Change("mainmenu")
    elseif(buyButtonForSkips.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        if(amountOfCandyInBasket >= 15) then
            amountOfCandyInBasket = amountOfCandyInBasket - 15
            amountOfSkips = amountOfSkips + 1
            saveLocalData("candy", amountOfCandyInBasket)
        else
            alert("Not enough candy!", "Can't buy item")
        end
    elseif(buyButtonForBackgrounds.selected == true) then
        if(amountOfCandyInBasket >= 10) then
            amountOfCandyInBasket = amountOfCandyInBasket - 10
            saveLocalData("candy", amountOfCandyInBasket)
            -- need to make a variable for background in the main game
        else
            alert("Not enough candy!", "Can't buy item")
        end
    elseif(backgroundPreviewRed.selected == true) then
        backgroundPreview = "red"
        Scene.Change("backgrounds")
    elseif(backgroundPreviewGreen.selected == true) then
        backgroundPreview = "green"
        Scene.Change("backgrounds")
    elseif(backgroundPreviewBlue.selected == true) then
        backgroundPreview = "blue"
        Scene.Change("backgrounds")
    end
end