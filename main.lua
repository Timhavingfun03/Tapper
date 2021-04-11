----- text
function love.load()
--Music & Sound
src1 = love.audio.newSource("GameMusic.mp3", "stream")
src2 = love.audio.newSource("Quack.mp3", "static")
src3 = love.audio.newSource("Victory.mp3", "static")

scr1Loop = src1:setLooping(true)
src1:play()

---Basics
money = 0
bonus = 1

---button
button = {}
button.x = 400
button.y = 300
button.size = 90

---Store
store1 = {}
store1.x = 65
store1.y = 200
store1.size = 50

store2 = {}
store2.x = 65
store2.y = 400
store2.size = 50

---Winbotton
winbotton = {}
winbotton.x = 100
winbotton.y = 100

--Fontsices
VeryBigFont = love.graphics.newFont(150)
BigFont = love.graphics.newFont(69)
Font = love.graphics.newFont(60)
MediumFont = love.graphics.newFont(50)
smal = love.graphics.newFont(20)
smaller = love.graphics.newFont(15)

end

function love.update()
    if love.keyboard.isDown("right") then
        money = 0
    end

    if love.keyboard.isDown("left") then
        money = money + 100
    end
end
--mousepressed
    function love.mousepressed( x, y, b, istouch )
        if b == 1 then
            if distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
                src2:play()
                money = money + bonus
            end
        end
--Store
         if  money > 99 then  
            if distanceBetween(store1.x, store1.y, love.mouse.getX(), love.mouse.getY()) < store1.size then
                money = money - 100
                bonus = bonus + 1
            end
        end
        if  money > 999 then  
            if distanceBetween(store2.x, store2.y, love.mouse.getX(), love.mouse.getY()) < store2.size then
                money = money - 1000
                bonus = bonus + 10
            end
        end
    end
---

--Math
    function distanceBetween(x1, y1, x2, y2)
        return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
    end

function love.draw()
    ---Button
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle("fill", button.x, button.y, 100, button.size)
    love.graphics.setColor(255, 0, 255)
    love.graphics.setFont(Font)
    love.graphics.print("Press", 320, 265)

---Bonus
    love.graphics.setFont(Font)
    love.graphics.setColor(255, 0, 0)
    love.graphics.print("Bonus:", 0, 65)
    love.graphics.setColor(255, 0, 255)
    love. graphics.print(bonus, 200, 65)
---Money
    love.graphics.setColor(255, 0, 0)
    love.graphics.setFont(BigFont)
    love.graphics.print("Money:")
    love.graphics.setColor(255, 0, 255)
    love.graphics.print(money, 250, 5)
    ---
---store
    love.graphics.setFont(BigFont)
    love.graphics.circle("fill", store1.x, store1.y, 50, store1.size)
    love.graphics.setColor(255, 0, 0)
    love.graphics.setFont(smal)
    love.graphics.print("100", 43, 185, 0, 1)
    love.graphics.setFont(smaller)
    love.graphics.print("Bonus + 1", 25, 205, 0, 1)

    love.graphics.setColor(255, 0, 0)
    love.graphics.setFont(BigFont)
    love.graphics.circle("fill", store2.x, store2.y, 50, store2.size)
    love.graphics.setColor(0, 0, 255)
    love.graphics.setFont(smal)
    love.graphics.print("1000", 35, 380, 0, 1)
    love.graphics.setFont(smaller)
    love.graphics.print("Bonus + 10", 22, 400, 0, 1)
---Description
love.graphics.setFont(smal)
love.graphics.setColor(20, 20, 20, 20)
love.graphics.print("Press the botton to gain money.", 0, 550)
love.graphics.print("Use the money to by a bonus on your money gaining skills", 0, 570)

---Endscreen
if money > 1000000 then
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", 0, 0, 800, 600)
    love.graphics.setColor(0, 255, 0)
    love.graphics.setFont(VeryBigFont)
    love.graphics.print("You win!", winbotton.x, winbotton.y)
    love.graphics.setFont(MediumFont)
    love.graphics.print("You now have a lot of money", 30, 300)
    src1Loop = src1:setLooping(false)
    src1:stop()
    src3:play()
end

end