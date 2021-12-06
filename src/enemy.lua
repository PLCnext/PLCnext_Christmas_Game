-- ***********************************************************************************************************************
-- THIS IS THE CODE FOR THE SNOWMAN
-- ***********************************************************************************************************************

enemy = {} -- create enemy table
 
function enemy:load()

	-- arrow keys image
	enemy_image  = love.graphics.newImage("assets/img/Snowman_small.png")
	
	self.x         = love.graphics.getWidth()/2  - enemy_image:getWidth()/2
	self.y         = 3*love.graphics.getHeight()/4 - enemy_image:getHeight()/2
	self.width	   = enemy_image:getWidth()
	self.height    = enemy_image:getHeight()
	self.speed 	   = 150
	self.direction = "up"
	
end

-- ***********************************************************************************************************************

function enemy:update(dt)
	
	if self.direction == "up" then
		self.y = self.y - self.speed * dt
	elseif self.direction == "down" then
		self.y = self.y + self.speed * dt
	end
	
	if self.y <= love.graphics.getHeight()/4 and remaining_time > 0 then
		self.direction = "down"
	elseif self.y >= 3*love.graphics.getHeight()/4 and remaining_time > 0 then
		self.direction = "up"
	end	
	
	table.insert(self, enemy)

	
end

-- ***********************************************************************************************************************

function enemy:draw()
	
	-- draw enemy
	love.graphics.draw(enemy_image, self.x, self.y)
	
end