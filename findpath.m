%-------------------------------------------------------------------------
% This function finds the path from the given tree
% Last node from goal region is picked as child and its parent is
% identified and the parent is treated as child and search for its parent
% is continued until the start state is reached
%-------------------------------------------------------------------------
function [path,video] = findpath(start, tree, video)
cols = size(tree,2);
child = tree(2,cols-1:cols);
parent = tree(3,cols-1:cols);
path = child;
path = cat(1,path,parent);

while parent ~= start
    x = find(tree == parent(1));
    for i = 1: numel(x)
        remainder = round(mod(x(i),3));
        idx = (x(i)-remainder)/3 + 1;
        if (idx+1 <= size(tree,2)) & tree(2,idx:idx+1) == parent
            parent = tree(3, idx:idx+1);
            path = cat(1,path,parent);
        end
    end
end
path = flip(path); % flips the matrix to have the path from start to goal
for j = 1: size(path,1)
    plot(path(j,1),path(j,2),'.r','linestyle','-','LineWidth',6);
    F(j) = getframe(gcf);

end
writeVideo(video,F)

end