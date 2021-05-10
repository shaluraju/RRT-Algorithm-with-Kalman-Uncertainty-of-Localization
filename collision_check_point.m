
% This function checks whether the point (p_x,p_y) is in collision
% with the set of obstacles described in the matrix 'obstacles',
% which assumes the obstacles are rectangles whose vertices are 
% arranged in the sequence used in the script generate_obstacles.m

function collision_found = collision_check_point(p_x,p_y,obstacles)

% returning 1 indicates collision
% returning 0 indicates no collision

collision_found = 0;  

num_obstacles = size(obstacles,1);

for i_obs = 1:num_obstacles
    
    x1 = obstacles(i_obs,1); y1 = obstacles(i_obs,2);
    x2 = obstacles(i_obs,3); y2 = obstacles(i_obs,4);
    x3 = obstacles(i_obs,5); y3 = obstacles(i_obs,6);
    x4 = obstacles(i_obs,7); y4 = obstacles(i_obs,8);
    
    if (((p_x >= x1-1) && (p_x <= x2+1)) && ((p_y >= y1-1 && p_y <= y3+1))) 
        collision_found = 1;
    end
        
end