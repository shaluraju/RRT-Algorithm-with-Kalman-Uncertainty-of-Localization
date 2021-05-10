%
% this function checks whether the new state reached the goal
% if reached_goal = 1,  robot has reached the goal
function reached_goal = check_goal(x_node, y_node, goal)
reached_goal = 0;

if x_node > goal(1)
   reached_goal = 1;
   plot(x_node,y_node,'.b','markersize',20)

end