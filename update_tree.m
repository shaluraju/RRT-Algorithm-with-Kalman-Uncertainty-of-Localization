
% This FUnction updates tree
% by adding node and edge to it
function tree = update_tree(x,y,x_near,y_near,tree)

a = [x,y];
b = [x_near,y_near];
c = [a;a;b];
tree = cat(2,tree,c);

end