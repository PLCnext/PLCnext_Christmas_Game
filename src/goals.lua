-- ***********************************************************************************************************************
-- THIS IS THE CODE FOR THE GOALS
-- ***********************************************************************************************************************

goals = {}	-- create goals table


-- ***********************************************************************************************************************

function goals:load()
	
	math.randomseed(os.time())
	
	self.type1 = {}
	self.type2 = {}
	self.type3 = {}
	self.type4 = {}
	
	-- get goal images
	goal_images = {}
	goal_images.type1 = love.graphics.newImage("assets/img/axc_40px.png")
	goal_images.type2 = love.graphics.newImage("assets/img/rfc_70px.png")
	
end

-- ***********************************************************************************************************************

function goals:update(dt)
	
	-- create new goals of type 1 to random time at random position
	if remaining_time > 0 then 
		if math.random() < 0.01 then
			local goal = {}
			goal.width  = goal_images.type1:getWidth()
			goal.height = goal_images.type1:getHeight()
			goal.x = math.random(0, love.graphics.getWidth()  - goal.width)
			goal.y = math.random(20, love.graphics.getHeight() - goal.height - 30)
			table.insert(self.type1, goal)
		end
	
		-- create new goals of type 2 to random time at random position
		if math.random() < 0.005 then
			local goal = {}
			goal.width  = goal_images.type2:getWidth()
			goal.height = goal_images.type2:getHeight()
			goal.x = math.random(0, love.graphics.getWidth()  - goal.width)
			goal.y = math.random(20, love.graphics.getHeight() - goal.height - 30)
			table.insert(self.type2, goal)
		end
	end
	
end

-- ***********************************************************************************************************************

function goals:draw()

	-- draw goals of type 1
	for i=1, #self.type1, 1 do
		local goal = self.type1[i]
		love.graphics.draw(goal_images.type1, goal.x, goal.y)
	end
	
	-- draw goals of type 2
	for i=1, #self.type2, 1 do
		local goal = self.type2[i]
		love.graphics.draw(goal_images.type2, goal.x, goal.y)
	end
	
end
