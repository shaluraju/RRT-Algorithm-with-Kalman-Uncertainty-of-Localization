
%--------------------------------------------------------------
% Finds the nearest node when a tree with nodes and edges were given
% tree = [xi, yi
%         xi, yi
%         xi-1, yi-1]
%--------------------------------------------------------------
function [x_near, y_near] = Nearest_Neighbour(x_random,tree)

% checking minimum distance from the random state with all nodes
d = ones(1,numel(tree)/3) * 10000;
    for i = 1:1: numel(tree)/3
        if mod(i,2) ~= 0
            x = (x_random(1)- tree(1,i))^2;
            y = (x_random(2)- tree(1,i+1))^2;
            d(i) = sqrt(x+y);
            
        end
    end

    [~, y_min] = find(d == min(d)); % index of nearest node
    x_near = tree(1,y_min(1));
    y_near = tree(1,y_min(1)+1);
end