-- Main
-- FinalAppGroup2-2015

-- Created by: Zacharias Octavious 
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the main starting point 


-- set debug to false for exporting 
DEBUG_GAMECENTER = true

--global variables
worldSelected = ""
levelDifficultySelected = ""
amountOfCandyInBasket = nil 
amountOfSkips = nil
amountOfEquationsRightInTotal = nil

-- Use this function to perform your initial setup
function setup()
    
    supportedOrientations(LANDSCAPE_ANY)
    displayMode(FULLSCREEN_NO_BUTTONS) --FULLSCREEN_NO_BUTTONS when exporting
    noFill()
    noSmooth()
    noStroke()
    pushStyle()

    amountOfCandyInBasket = readLocalData("candy", 0)
    amountOfSkips = readLocalData("skips", 3)
    amountOfEquationsRightInTotal = readLocalData("highscore", 0)
    
    -- create the scenes
    Scene("companylogo", CompanyLogoScene)
    Scene("gamelogo", GameLogoScene)
    Scene("mainmenu", MainMenuScene)
    Scene("settings", SettingsScene)
    Scene("credits", CreditsScene)
    Scene("maingame", MainGameScene)
    Scene("store", StoreScene)
    Scene("backgrounds", BackgroundPreviewScene)
    Scene("skip", MainGameSkipScene)
    Scene("achievements", AchievementsScene)
    Scene("leaderboards", LeaderboardsScene)
    Scene("worlds", WorldsScene)
    Scene("levels", LevelDifficultyScene)
    Scene("right", MainGameRight)
    Scene("wrong", MainGameWrong)
    Scene("totalscore", MainGameTotalScoreScene)
        --tutorial scenes
    Scene("tutorialmainmenu", TutorialMainMenuScene)
    Scene("tutorialworlds", TutorialWorldsScene)
    Scene("tutoriallevels", TutorialLevelDifficultyScene)
    Scene("tutorialmaingame", TutorialMainGameScene)
    Scene("tutorialright", TutorialMainGameRightScene)
    Scene("tutorialwrong", TutorialMainGameWrongScene)
    Scene("tutorialover", TutorialOverScene)
    
    Scene.Change("companylogo")
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)
    
    Scene.Draw()
end

function touched(touch)
    
    Scene.Touched(touch)
end