-- ***********************************************************************************************************************
-- THIS IS THE CODE FOR DETECTION AND REACTION TO A COLLISION
-- ***********************************************************************************************************************

function collision_handling(x1, y1, w1, h1, collision_object, points, collision_type) 

	for i=#collision_object, 1, -1 do
		
		x2 = collision_object[i].x		-- goal x position
		y2 = collision_object[i].y		-- goal y position
		w2 = collision_object[i].width	-- goal image width
		h2 = collision_object[i].height 	-- goal image height

		-- find out if collision occured
		collision_occured = 	x1 < x2 + w2 and
								x1 + w1 > x2 and
								y1 < y2 + h2 and
								y1 + h1 > y2
	
		-- react to collision
		if collision_occured then
			
			if collision_type == 1 then					-- player collision with goal
				table.remove(collision_object, i)		-- remove goal from table
				score = score + points  		    	-- add point(s) to score
			
			elseif collision_type == 2 then				-- player collision with enemy
				
				enemy_collision = true
				
				if collision_saved == false then		
					collision_saved  = true
					collision_start  = os.time()			-- get time
					score            = score - points		-- reduce score
				else
					enemy_duration = os.time() - collision_start
					
					if enemy_duration >= 2 then
						collision_saved = false
					end
				end
			
			elseif collision_type == 3 then				-- enemy collision with goal
				table.remove(collision_object, i)		-- remove goal from table
				score = score - points  		    	-- add point(s) to score
				
			end
			
		end
		
	end
	
end
