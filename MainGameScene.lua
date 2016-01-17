-- MainGameScene
-- FinalAppGroup2-2015

-- Created by: Luke Vandenberghe 
-- Created on: Dec - 2015
-- Created for: ICS2O
-- This is the main game scene  

MainGameScene = class()

--Variables
local list = {}
local myBoxX = WIDTH/2
local myBoxY = 600
local myBoxSizeX = 530
local myBoxSizeY = 100
local perfectCircle= 150
local letGoX=-1
local letGoY=-1
local stayingInOneSpot=0
local myBoxXPrevious=myBoxX
local myBoxYPrevious=myBoxY
local letGoXPrevious=0
local letGoYPrevious=0
local number1 
local number2 
local equation = math.random(1,2)
local equationType = ""
local equationAnswer 
local equationAnswerIncorrect
local correctEquation = equationAnswer 
local incorrectEquation 
local correctCounter = 0
local incorrectCounter = 0
local printAnswerOnce=0
local previousEquation
local x
local y
local boxVector
local boxVectorPrevious = 150
local topLineScreenMsg=""
local firstTimeThroughInit = 1
local homeButton 
local equationCounter = 0
local finalWorldEquationType = math.random(1,4)
local trackingAnswers = {}
local skipButton

function MainGameScene:init()
    
    --home button to leave the game
    homeButton = Button("Dropbox:homeButton", vec2(WIDTH/2-400, HEIGHT/2+325))
    skipButton = Button("Dropbox:mainGameSkipButton", vec2(WIDTH/2, HEIGHT/2-300))
   
     -- make the equation not change as you drag it
     if (firstTimeThroughInit == 1) then
        firstTimeThroughInit = 0 
        else 
        return
     end
    
    --insert a list into the table
    table.insert(list,self)
    
    --call the function change the equation which is down below
    MainGameScene.changeTheEquation()
end

function MainGameScene:draw() 
    
    --backround (only temporary) more backrounds need to be added
    if(worldSelected == "+") then
        sprite("Dropbox:chocolateScene", WIDTH/2, HEIGHT/2) 
    elseif(worldSelected == "-") then
        sprite("Dropbox:lollipopScene", WIDTH/2, HEIGHT/2)
    elseif(worldSelected == "*") then
        sprite("Dropbox:jellyBeanScene", WIDTH/2, HEIGHT/2)
    elseif(worldSelected == "/") then
        sprite("Dropbox:gummyBearScene", WIDTH/2, HEIGHT/2)
    elseif(worldSelected == "?") then
        sprite("Dropbox:sugarMountain", WIDTH/2, HEIGHT/2)
    end
    -- invisible box color (text is stuck onto the invisible box to make it draggable)
    fill(255, 0, 226, 0)
    stroke(249, 0, 193, 0)
    
    --invisible box size and location
    rectMode(CENTER)
    rect(myBoxX, myBoxY, myBoxSizeX, myBoxSizeY)
      
   --this code makes it so everytime you get another equation it spawns in then same spot the last equation was at. 
   if ( myBoxX == myBoxXPrevious ) then
        stayingInOneSpot=stayingInOneSpot+1
        if (stayingInOneSpot > 30 )then
            letGoX = myBoxX
            letGoY = myBoxY
            stayingInOneSpot=0    
        end
    end
    
    --variables
    myBoxXPrevious=myBoxX
    myBoxYPrevious=myBoxY
    
    -- Incorrect circle    
    fill(255, 0, 44, 255)
    stroke(255, 27, 0, 255)
    ellipse(200,200, perfectCircle*2)
    
    --correct circle
    stroke(79, 255, 0, 255)
    fill(41, 255, 0, 255)
    ellipse(800, 200, perfectCircle*2)
    
    --equation text font, size, and colour
    fontSize(100)
    font("Futura-CondensedExtraBold")
    fill(255, 255, 255, 255)
    
    -- This code allows you track your progress throughout the game. 
    -- i is a variable used to determine whether the previous equation the user answered was right or wrong
    -- In this code when the user gets it right a green box appears and if the user gets it wrong a red box appears
    for i =1,#trackingAnswers do
        if (trackingAnswers[i] == 1) then
            fill(52, 255, 0, 255)
            stroke(0, 0, 0, 255)
            strokeWidth(2)
            rect(630+i*35,735,25,25) 
        elseif(trackingAnswers[i] == 0) then
             fill(255, 0, 36, 255)
             stroke(0, 0, 0, 255)
             strokeWidth(2)
             rect(630+i*35,735,25,25) 
        end
    end
      
    
    -- this code detects whether the invisible box is in contact with the circle.
    --In this code a if the equation is dragged in the circle it will change the scene
    -- It also detects whether the equation is right or wrong.
    
    -- for correct circle
    if ( letGoX ~= -1 ) then
        if ( letGoX >= 700 and letGoY <=300 and letGoX <= 900 and letGoY >= 100 ) then
            if (letGoX ~= letGoXPrevious and letGoY ~=letGoYPrevious ) then
                if (equation==1) then
                    correctCounter = correctCounter + 1
                    table.insert (trackingAnswers,1)
                    Scene.Change("right")
                elseif(equation==2) then
                    incorrectCounter = incorrectCounter + 1
                    table.insert (trackingAnswers,0)
                    Scene.Change("wrong")
                end
                
                letGoXPrevious=letGoX
                letGoYPrevious=letGoY
            end
            
        end
    
        --for incorrect circle
        if ( letGoX >= 100 and letGoY <=300 and letGoX <= 300 and letGoY >= 100 ) then
            if (letGoX ~= letGoXPrevious and letGoY ~=letGoYPrevious ) then
                if (equation==1) then
                    incorrectCounter = incorrectCounter + 1
                    table.insert (trackingAnswers,0)
                    Scene.Change("wrong")
                elseif(equation==2) then
                    correctCounter = correctCounter + 1
                    table.insert (trackingAnswers,1)
                    Scene.Change("right")              
                end
                
                letGoXPrevious=letGoX
                letGoYPrevious=letGoY
            end
            
        end
    end 
    
    --this is the colour of the equation
    if(worldSelected == "?") then
        fill(0, 0, 0, 255)
    else
        fill(255, 255, 255, 255)
    end
    
    --this code displays the equation the user has to drag
    --It randomly generates a wrong equation or a right equation
     if (equation == 1) then
        text (" "..number1.." "..equationType.." "..number2.." = "..equationAnswer, myBoxX, myBoxY)
     elseif (equation == 2) then 
        text (" "..number1.." "..equationType.." "..number2.." = "..equationAnswerIncorrect, myBoxX, myBoxY)
    end  
    
        --this counts how many equations you got right or wrong
        fontSize(30)
        text("Answers You Got Correct: "..correctCounter, 800, 500)
        text("Answers You Got Incorrect: "..incorrectCounter, 200,500)
        text("Progress...",550, 735)
          
    -- this displays the amount of skips above the skip button 
        fill(255, 255, 255, 255)
        text("Skips: "..math.floor(amountOfSkips), WIDTH/2, HEIGHT/2-230)
    --this draws the home and skip button 
        homeButton:draw()
        skipButton:draw()
end

function MainGameScene:touched(touch)
   
    --variables
    local myBoxX0=0
    local myBoxY0=0
   
      -- this code allows you to touch and drag the text  
     if self:hit( touch ) then
        if touch.state == BEGAN then
            myBoxX0 = myBoxX
            myBoxY0 = myBoxY
            self.go = true
        elseif touch.state == MOVING then
            myBoxX = myBoxX+touch.deltaX
            myBoxY = myBoxY+touch.deltaY
            local boxVector = vec2(myBoxX-myBoxX0,myBoxY-myBoxY0):len()
            if  boxVector >= boxVectorPrevious and self.go then
                new = MainGameScene(myBoxX0,myBoxY0)
                self.go = false
                new.size = 0
            end
        elseif touch.state == ENDED or touch.state == CANCELLED then
            local boxVector = vec2(myBoxX-myBoxX0,myBoxY-myBoxY0):len()
            if  boxVector < boxVectorPrevious then
            end
        end

    end
   
    --this allows you to touch the home and skip button
    homeButton:touched(touch)
    skipButton:touched(touch)
    
    --this code makes it so if you touch the home button you move back to the difficulty scene.    
    if(homeButton.selected == true) then
        sound(SOUND_HIT, 1851, 0.50)
        Scene.Change("levels")
    elseif(skipButton.selected == true) then
        if(amountOfSkips <= 0) then
            sound(SOUND_HIT, 24665, 0.50)
        elseif(amountOfSkips > 0) then
            sound(SOUND_HIT, 1851, 0.50)
            Scene.Change("skip")
        end
    end
end

function MainGameScene:changeTheEquation()
    
    -- This code allows you to choose the the type of equations you want to answer 
    -- This code allows you to choose the difficulty of the equations you want to answer
    -- there is an addiition subtraction multiplication division and a final world that has a mix of the equations
    --you can also play easy medium hard and in the code I changed the value of numbers for each difficulty
    --In the code I do if statements that detect what option you chose
    --depending on the option I changed the value of each variable
    
        -- The addition easy game
    if (worldSelected == "+" and levelDifficultySelected  == "Easy") then
        number1 = math.random (0,9)
        number2 = math.random (0,9)
        equationAnswer = (number1 + number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "+"
        -- The addition easy medium game
    elseif (worldSelected  == "+" and levelDifficultySelected  == "Medium") then
        number1 = math.random (10,99)
        number2 = math.random (10,99)
        equationAnswer = (number1 + number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "+"
        --The addition hard game
    elseif (worldSelected  == "+" and levelDifficultySelected  == "Hard") then
        number1 = math.random (100,999)
        number2 = math.random (100,999)
        equationAnswer = (number1 + number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "+"
    end
    
    -- The subtraction easy game
    if (worldSelected  == "-" and levelDifficultySelected  == "Easy") then
        number1 = math.random (0,9)
        number2 = math.random (0,9)
        if (number1<number2) then
            temp=number2
            number2=number1
            number1=temp
        end
        equationAnswer = (number1 - number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "-"
        --The subtraction medium game
    elseif (worldSelected  == "-" and levelDifficultySelected  == "Medium") then
        number1 = math.random (10,99)
        number2 = math.random (10,99)
        if (number1<number2) then
            temp=number2
            number2=number1
            number1=temp
        end
        equationAnswer = (number1 - number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "-"
        --The subtraction hard game
    elseif (worldSelected  == "-" and levelDifficultySelected  == "Hard") then
        number1 = math.random (100,999)
        number2 = math.random (100,999)
        if (number1<number2) then
            temp=number2
            number2=number1
            number1=temp
        end
        equationAnswer = (number1 - number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "-"
    end
    
        --The multiplication easy game
    if (worldSelected  == "*" and levelDifficultySelected  == "Easy") then
        number1 = math.random (0,3)
        number2 = math.random (0,3)
        equationAnswer = (number1 * number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "*"
        --The multiplication medium game
    elseif (worldSelected  == "*" and levelDifficultySelected  == "Medium") then
        number1 = math.random (3,5)
        number2 = math.random (3,5)
        equationAnswer = (number1 * number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "*"
        --The multiplication hard game
    elseif (worldSelected  == "*" and levelDifficultySelected  == "Hard") then
        number1 = math.random (5,7)
        number2 = math.random (5,7)
        equationAnswer = (number1 * number2)
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "*"
    end
    
        --The division easy game
    if (worldSelected  == "/" and levelDifficultySelected  == "Easy") then
        equationAnswer = math.random (1,3)
        number2 = math.random (1,3)
        number1 = equationAnswer*number2
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "/"
        --The division Medium game
    elseif (worldSelected  == "/" and levelDifficultySelected  == "Medium") then
        equationAnswer = math.random (3,5)
        number2 = math.random (3,5)
        number1 = equationAnswer*number2
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "/"
        --The division hard game
    elseif (worldSelected  == "/" and levelDifficultySelected  == "Hard") then
        equationAnswer = math.random (5,7)
        number2 = math.random (5,7)
        number1 = equationAnswer*number2
        equationAnswerIncorrect = equationAnswer + math.random(1,3)
        equationType = "/"
    end
    
        --The mixed easy game
    if (worldSelected  == "?" and levelDifficultySelected  == "Easy") then
        if (finalWorldEquationType == 1) then
            number1 = math.random (0,9)
            number2 = math.random (0,9)
            equationAnswer = (number1 + number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "+"
        elseif (finalWorldEquationType == 2) then
            number1 = math.random (0,9)
            number2 = math.random (0,9)
            if (number1<number2) then
                temp=number2
                number2=number1
                number1=temp
            end
            equationAnswer = (number1 - number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "-"
        elseif (finalWorldEquationType == 3) then
            number1 = math.random (0,3)
            number2 = math.random (0,3)
            equationAnswer = (number1 * number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "*"
        elseif (finalWorldEquationType == 4) then
            equationAnswer = math.random (1,3)
            number2 = math.random (1,3)
            number1 = equationAnswer*number2
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "/"
        end
             --The mixed Medium game
    elseif (worldSelected  == "?" and levelDifficultySelected  == "Medium") then
        if (finalWorldEquationType == 1) then
            number1 = math.random (10,99)
            number2 = math.random (10,99)
            equationAnswer = (number1 + number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "+"
        elseif (finalWorldEquationType == 2) then 
            number1 = math.random (10,99)
            number2 = math.random (10,99)
            if (number1<number2) then
                 temp=number2
                 number2=number1
                 number1=temp
            end
            equationAnswer = (number1 - number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "-"
        elseif (finalWorldEquationType == 3) then
            number1 = math.random (3,5)
            number2 = math.random (3,5)
            equationAnswer = (number1 * number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "*"
        elseif (finalWorldEquationType == 4) then
            equationAnswer = math.random (3,5)
            number2 = math.random (3,5)
            number1 = equationAnswer*number2
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "/"
        end
         --The mixed hard game
    elseif (worldSelected  == "?" and levelDifficultySelected  == "Hard") then
        if (finalWorldEquationType == 1) then
            number1 = math.random (100,999)
            number2 = math.random (100,999)
            equationAnswer = (number1 + number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "+"
        elseif (finalWorldEquationType == 2) then
            number1 = math.random (100,999)
            number2 = math.random (100,999)
            if (number1<number2) then
                temp=number2
                number2=number1
                number1=temp
            end
            equationAnswer = (number1 - number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "-"
        elseif (finalWorldEquationType == 3) then
            number1 = math.random (5,7)
            number2 = math.random (5,7)
            equationAnswer = (number1 * number2)
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "*"
        elseif (finalWorldEquationType == 4) then
            equationAnswer = math.random (5,7)
            number2 = math.random (5,7)
            number1 = equationAnswer*number2
            equationAnswerIncorrect = equationAnswer + math.random(1,3)
            equationType = "/"
        end
        
    end
    
    --This code randomizes the equations you have to answer in the final world    
    if (worldSelected  == "?") then
        finalWorldEquationType = math.random(1,4)
    end 
   
    --this code randomly chooses a correct or incorrect equation to answer
    equation = math.random(1,2)
  
    --this determines the location of the equation and the incvisible box
    myBoxX = WIDTH/2
    myBoxY = 600 
    
end

function MainGameScene:hit(point)
  
    --this code creates an invisible box where it detcets whether you are touching inside of it or not
    if point.x > (myBoxX - myBoxSizeX/2) and
       point.x < (myBoxX + myBoxSizeX/2) and
       point.y > (myBoxY - myBoxSizeY/2) and
       point.y < (myBoxY + myBoxSizeY/2) then
        return true
    end        
    return false
end


-- The functions from here to the bottom of the tab are functions that reset the game when you leave it or finish
-- the code inside the functions that are here to the bottom resets all the necessary variables.
-- the variables getting reset are all necessary to play a new game

function MainGameScene:getCorrectCounter()
    return correctCounter
end

function MainGameScene:getNumber1()
    return number1
end

function MainGameScene:getNumber2()
    return number2
end

function MainGameScene:getEquationType()
    return equationType
end

function MainGameScene:getEquationAnswer()
    return equationAnswer
end


function MainGameScene:changeCounter()
    
    MainGameScene:changeTheEquation()
    correctCounter = 0
    incorrectCounter = 0
    trackingAnswers={}
end

function MainGameScene:isGameOver()
     if (correctCounter + incorrectCounter >= 10) then
         return true    
    end
    return false
end