%------------------------------------------------------------------------
% given the random state, it checks the distance between the random state 
% and nearnest and generates the new node within the max distance limit
%-------------------------------------------------------------------------
function [x_node,y_node] = Find_New_Node(rand_state, Nearest_node)

epsilon = 2; % Max Distance
delta_y = rand_state(2)-Nearest_node(2);
delta_x = rand_state(1)-Nearest_node(1);
d = sqrt(delta_x^2 + delta_y^2);
theta = atand(delta_y/delta_x);

if d > epsilon
    
    if delta_y > 0 && delta_x > 0
        x_node = Nearest_node(1) + epsilon*cosd(theta);
        y_node = Nearest_node(2) + epsilon*sind(theta);
        
    elseif delta_y < 0 && delta_x < 0
        x_node = Nearest_node(1) - epsilon*cosd(theta);
        y_node = Nearest_node(2) - epsilon*sind(theta);
   
    elseif delta_y < 0 && delta_x > 0
        x_node = Nearest_node(1) + abs(epsilon*cosd(theta));
        y_node = Nearest_node(2) - abs(epsilon*sind(theta));
        
    elseif delta_y > 0 && delta_x < 0
        x_node = Nearest_node(1) - abs(epsilon*cosd(theta));
        y_node = Nearest_node(2) + abs(epsilon*sind(theta));
        
    elseif delta_y == 0 || delta_x == 0
        x_node = Nearest_node(1) - abs(epsilon*cosd(theta));
        y_node = Nearest_node(2) + abs(epsilon*sind(theta));
    end
    
else
    
   if delta_y > 0 && delta_x > 0      
        x_node = Nearest_node(1) + abs(delta_x);
        y_node = Nearest_node(2) + abs(delta_y);
        
    elseif delta_y < 0 && delta_x < 0
        x_node = Nearest_node(1) - abs(delta_x);
        y_node = Nearest_node(2) - abs(delta_y);
   
    elseif delta_y < 0 && delta_x > 0
        x_node = Nearest_node(1) + abs(delta_x);
        y_node = Nearest_node(2) - abs(delta_y);
        
    elseif delta_y > 0 && delta_x < 0
        x_node = Nearest_node(1) - abs(delta_x);
        y_node = Nearest_node(2) + abs(delta_y);
        
   elseif delta_y == 0 || delta_x == 0
       x_node = Nearest_node(1) + delta_x;
       y_node = Nearest_node(2) + delta_y;
   end
end

end




