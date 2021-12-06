-- ***********************************************************************************************************************
-- THIS IS THE CODE FOR THE PLAYER
-- ***********************************************************************************************************************

player = {}	-- create player table 


-- ***********************************************************************************************************************

function player:load()

	-- get images for the player and store them in a table
	player_images = {}
	player_images.front = love.graphics.newImage("assets/img/PC_Christmas_Front_small.png")
	player_images.right = love.graphics.newImage("assets/img/PC_Christmas_Right_small.png")
	player_images.left  = love.graphics.newImage("assets/img/PC_Christmas_Left_small.png")
	player_images.back  = love.graphics.newImage("assets/img/PC_Christmas_Front_small.png")

	-- player initialization
	self.x 	= 100					-- start x position
	self.y 	= 100					-- start y position
	self.height	= player_images.front:getHeight()	-- get image height
	self.width	= player_images.front:getWidth()	-- get image width
	self.speed 	= 500					-- movement speed factor
	self.direction	= "down"
	
end

-- ***********************************************************************************************************************

function player:update(dt)

	-- player movement control
	if love.keyboard.isDown("right") and remaining_time > 0 then	
		self.x = self.x + self.speed * dt
		player.direction = "right"
		
	elseif love.keyboard.isDown("left") and remaining_time > 0 then
		self.x = self.x - self.speed * dt
		player.direction = "left"
		
	elseif love.keyboard.isDown("down") and remaining_time > 0 then
		self.y = self.y + self.speed *dt
		player.direction = "down"
		
	elseif love.keyboard.isDown("up") and remaining_time > 0 then
		self.y = self.y - self.speed * dt
		player.direction = "up"
	
	end
	
	
	-- prevent player to move out of screen
	if self.x < 0 then
		self.x = 0
	
	elseif self.y < 0 then
		self.y = 0
		
	elseif self.x + self.width > love.graphics.getWidth() then
		self.x = love.graphics.getWidth() - self.width
			
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height	
	end
	
	if enemy_collision and (player.direction == "right" or player.direction == "down") then
		self.x = self.x - 200
	elseif enemy_collision and (player.direction == "left" or player.direction == "up") then
		self.x = self.x + 200
	end
	
end

-- ***********************************************************************************************************************

function player:draw()
	
	-- show respective player image
	local img = player_images.front
	
	if self.direction == "right" then
		img = player_images.right
		
	elseif self.direction == "left" then
		img = player_images.left
		
	elseif self.direction == "down" then
		img = player_images.front
		
	elseif self.direction == "up" then
		img = player_images.back
	end
	
	love.graphics.draw(img, self.x, self.y)
	
end
