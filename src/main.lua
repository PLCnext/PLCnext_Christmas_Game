-- ***********************************************************************************************************************
-- THIS IS THE MAIN CODE FOR THE GAME
-- ***********************************************************************************************************************
 
-- needed helper files
require("game_info")
require("countdown")
require("player")
require("enemy")
require("goals")
require("collision")
require("game_time")

-- initialize best score
best_score  		= {}
best_score.value 	= 0

-- ***********************************************************************************************************************

function love.load()
	
	-- fonts
	fonts = {}
	fonts.info  = love.graphics.newFont(25)
	fonts.score = love.graphics.newFont(18)
	fonts.start_counter = love.graphics.newFont(50)
	fonts.game_end = love.graphics.newFont(25)
	
	-- background image
	background_image = {}
	background_image.file   = love.graphics.newImage("assets/img/PLCnext_Logo_cut.png")
	background_image.width  = background_image.file:getWidth()
	background_image.height = background_image.file:getHeight()
	background_image.x      = love.graphics.getWidth()  - background_image.width
	background_image.y      = love.graphics.getHeight() - background_image.height
	
	-- initialize 
	game_info_shown	= false
	collision_start = 0
	
	-- call load functions
	game_info:load()
	goals:load() 
	player:load()
	enemy:load()
	countdown:load()
	game_time:load()
	
end

-- ***********************************************************************************************************************

function love.update(dt)

	-- call of function for game information
	if game_info_shown == false then
		game_info:update(dt)
	
	-- when game information are known
	else
		-- show countdown
		countdown:update(dt) 
	
		-- when the playing time started ...
		if time_until_start < 0 then
	
			-- call functions for game time
			game_time:update(dt)
		
			-- call player function
			player:update(dt)	
			
			-- call enemy function
			enemy:update(dt)
			enemy_collision = false
		
			-- call goals function
			goals:update(dt)
	
			-- react to collision with goal of type 1
			collision_handling(	player.x,   -- player x position
						player.y, 			-- player y position
						player.width,		-- player image width
						player.height,		-- player image height
						goals.type1, 		-- collision object
						1,					-- number of points
						1					-- collision type 1: collision between player and goal
					   ) 	 
		
			-- react to collision with goal of type 2
			collision_handling(	player.x, 	-- player x position
						player.y, 			-- player y position
						player.width,		-- player image width
						player.height,		-- player image height
						goals.type2, 		-- collision object
						2,					-- number of points
						1					-- collision type 1: collision between player and goal
					   )

			-- react to collision with enemy 
			collision_handling(	player.x, 		-- player x position
						player.y, 				-- player y position
						player.width,			-- player image width
						player.height,			-- player image height
						enemy, 					-- collision object
						1,						-- number of points
						2						-- collision type 2: collision between player and enemy
					   )
					   
			-- react to collision between enemy and goal of type 1
			collision_handling(	enemy.x, 		-- player x position
						enemy.y, 				-- player y position
						enemy.width,			-- player image width
						enemy.height,			-- player image height
						goals.type1, 			-- collision object
						1,						-- number of points
						3						-- collision type 3: collision between enemy and goal
					   ) 
			
			-- react to collision between enemy and goal of type 2
			collision_handling(	enemy.x, 		-- player x position
						enemy.y, 				-- player y position
						enemy.width,			-- player image width
						enemy.height,			-- player image height
						goals.type2, 			-- collision object
						2,						-- number of points
						3						-- collision type 3: collision between enemy and goal
					   ) 
			
			-- find out if best score has been exceeded
			if remaining_time == 0.0 and score > best_score.value then
				best_score.value  = score
			end
		
			-- retry after game end
			if remaining_time <= 0 and love.keyboard.isDown("return") then 
				goals:load() 
				player:load()
				enemy:load()
				countdown:load()
				game_time:load()
			end
		end
	end
				
end

-- ***********************************************************************************************************************

function love.draw()
	
	-- background definition
	love.graphics.setBackgroundColor(0/255, 0/255, 0/255) -- black
	
	-- background image
	love.graphics.draw(background_image.file, background_image.x, background_image.y)
	
	-- call of function for game information
	game_info:draw()
	
	-- when information are known, show countdown
	if game_info_shown == true then
		
		-- show countdown
		countdown:draw()
		
		-- when the playing time started ...
		if time_until_start < 0 then 	
		
			-- call player function
			player:draw()
			
			-- call enemy function
			enemy:draw()
			
			-- call goals function
			goals:draw()
			
			-- call of funtion for game time
			game_time:draw()
		
			-- print current score
			love.graphics.setFont(fonts.score)
			love.graphics.setColor(255/255, 255/255, 255/255) -- white
			love.graphics.print("SCORE : " .. score, 10, 10)
			
			-- print best score
			love.graphics.setColor(0/255, 153/255, 161/255) -- blue green
			love.graphics.printf("BEST SCORE : " .. best_score.value, 820 , 10, 160, 'right')
			
			-- set color to white
			love.graphics.setColor(255/255, 255/255, 255/255, 255/255)	
		
		end
	end
	
end
