LeaderboardsScene = class()

local homeButton

function LeaderboardsScene:init()
    -- you can accept and set parameters here
    
    homeButton = Button("Dropbox:homeButton", vec2(WIDTH/2-400, HEIGHT/2+325))
    homeButton.draggable = false
end

function LeaderboardsScene:draw()
    -- Codea does not automatically call this method
    
    background(0, 0, 0, 255)
    homeButton:draw()
    
    fill(255, 255, 255, 255)
    fontSize(60)
    text("Leaderboards", WIDTH/2, HEIGHT/2+300) 
    
    fill(255, 255, 255, 255)
    fontSize(45)
    font("Futura-CondensedExtraBold")
    text("Your highscore: "..math.floor(amountOfEquationsRightInTotal), WIDTH/2, HEIGHT/2)
end

function LeaderboardsScene:touched(touch)
    -- Codea does not automatically call this method
    
    homeButton:touched(touch)
    
    if(homeButton.selected == true) then
        Scene.Change("mainmenu")
    end
end
