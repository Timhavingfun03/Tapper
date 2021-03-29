----- text
function love.load()
---Bricks
money = 0
Lv = 1
---

---button
button = {}
button.x = 400
button.y = 300
button.size = 90
---


myFont = love.graphics.newFont(69)

end

function love.update()
---Lvsystem
    if (money > 100) 
    then Lv = 2  
    end

    if (money > 500) 
    then Lv = 3  
    end

    if (money > 2000) 
    then Lv = 4  
    end

    if (money > 6000) 
    then Lv = 2  
    end

    if (money > 10000) 
    then Lv = 6  
    end

    if love.keyboard.isDown("right") then
        money = 0
    end

end
--mousepressed
    function love.mousepressed( x, y, b, istouch )
        if b == 1 then
            if distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
                money = money + Lv
            end
        end
    end

--Math
    function distanceBetween(x1, y1, x2, y2)
        return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
    end

function love.draw()
    
    love.graphics.circle("fill", button.x, button.y, 100, button.size)


    love.graphics.setFont(myFont)
    love.graphics.print("Money:")
    love.graphics.setColor(255, 0, 255)
    love.graphics.print(money, 250, 5)
end