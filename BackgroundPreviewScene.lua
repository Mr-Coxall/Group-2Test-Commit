-- BackgroundPreviewScene
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Dec - 2015
-- Created for: ICS2O
-- This is the background preview scene 

BackgroundPreviewScene = class()

local startTime
local perfectCircle = 150

function BackgroundPreviewScene:init()
    
    startTime = ElapsedTime
end

function BackgroundPreviewScene:draw()
    
    if(backgroundPreview == "red") then
        background(255, 0, 0, 255)
    elseif(backgroundPreview == "green") then
        background(0, 255, 0, 255)
    elseif(backgroundPreview == "blue") then
        background(0, 0, 255, 255)
    end   
    
    fontSize(100)
    font("Futura-CondensedExtraBold")
    fill(255, 255, 255, 255)
    text("2 + 2 = 4", WIDTH/2, HEIGHT/2+250)
    text("*PREVIEW*", WIDTH/2, HEIGHT/2)
    stroke(0, 0, 0, 255)
    strokeWidth(3)
    
    fill(255, 0, 0, 255)
    ellipse(200, 200, perfectCircle*2)
    fill(0, 255, 0, 255)
    ellipse(800, 200, perfectCircle*2)
    
    if(startTime + 3 < ElapsedTime) then
        Scene.Change("store")
    end
end

function BackgroundPreviewScene:touched(touch)

end