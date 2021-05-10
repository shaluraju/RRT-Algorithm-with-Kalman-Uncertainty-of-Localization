function [path, path_length, video] = RRT(start_state, goal_region, obstacles)
generate_obstacles
%legend('RRT tree','Path Identified')
%--------------------------------------------------------------------------
% tree has a structure of 3 by 2n, where n is the number of nodes
% first node consists of nodes
% second and third rows form the edge with two nodes at the end of the edge
%--------------------------------------------------------------------------
tree(1,1:2) = start_state;
tree(2:3,1:2) = [0, 0; 5, 50]; %x1,y1; x2,y2
i = 1;
%tic
while 1
    [x,y] = Random_State(); % random state
    [x_near,y_near] = Nearest_Neighbour([x,y], tree); % nearest node to that state
    [x_node,y_node] = Find_New_Node([x,y], [x_near,y_near]); % new node within epsilon limit

    
    if collision_check_point(x_node,y_node,obstacles) < 1 ...
           && collision_check_segment(x_node, y_node, x_near, y_near, obstacles) < 1
       
       tree = update_tree(x_node, y_node, x_near, y_near, tree);       
       plot(x_node,y_node,'.k','MarkerSize',6)
       plot([x_node,x_near],[y_node,y_near],'.k','linestyle','-');
       F(i) = getframe(gcf);
       i = i+1;
       pause(0.08)       
    end
    reached_goal = check_goal(x_node, y_node, goal_region);
    if reached_goal == 1
        break
    end
end

video = VideoWriter("RRT_Map_building.avi", "Uncompressed AVI");
open(video)
writeVideo(video,F)

path = findpath(start_state,tree,video);
tree = [];
path_length = round(findpath_length(path),2);

%sprintf("Path Length is: %d meters", path_length)
%toc
end