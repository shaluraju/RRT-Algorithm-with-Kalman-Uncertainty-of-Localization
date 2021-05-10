
% This function checks whether the segment from (px1,py1) to (px2,py2) 
% is in collision with the set of obstacles described in the matrix 
% 'obstacles', which assumes the obstacles are rectangles whose vertices  
% are arranged in the sequence used in the script generate_obstacles.m

function collision_found = collision_check_segment(px1,py1,px2,py2,obstacles)

% returning 1 indicates collision
% returning 0 indicates no collision

collision_found = 0;  

num_obstacles = size(obstacles,1);

% compute the slope of the line segment
a = px2 - px1;
b = py2 - py1;
m = b/a;

for i_obs = 1:num_obstacles
    
    x1 = obstacles(i_obs,1); y1 = obstacles(i_obs,2);
    x2 = obstacles(i_obs,3); y2 = obstacles(i_obs,4);
    x3 = obstacles(i_obs,5); y3 = obstacles(i_obs,6);
    x4 = obstacles(i_obs,7); y4 = obstacles(i_obs,8);
    
    % check segment's y value at x1
    y_at_x1 = m*(x1-px1) + py1;
    t_y_at_x1 = (x1 - px1)/a;
    % check segment's y value at x2
    y_at_x2 = m*(x2-px1) + py1;
    t_y_at_x2 = (x2 - px1)/a;
    % check segment's x value at y1
    x_at_y1 = (y1-py1)/m + px1;
    t_x_at_y1 = (y1 - py1)/b;
    % check segment's x value at y3
    x_at_y3 = (y3-py1)/m + px1;
    t_x_at_y3 = (y3 - py1)/b;
    
    if ((y_at_x1 >= y1) && (y_at_x1 <= y3) && (t_y_at_x1 >= 0) && (t_y_at_x1 <= 1))
        collision_found = 1; break;
    elseif ((y_at_x2 >= y1) && (y_at_x2 <= y3) && (t_y_at_x2 >= 0) && (t_y_at_x2 <= 1))
        collision_found = 1; break;
    elseif ((x_at_y1 >= x1) && (x_at_y1 <= x2) && (t_x_at_y1 >= 0) && (t_x_at_y1 <= 1))
        collision_found = 1; break;
    elseif ((x_at_y3 >= x1) && (x_at_y3 <= x2) && (t_x_at_y3 >= 0) && (t_x_at_y3 <= 1))
        collision_found = 1; break;
    end
    
end