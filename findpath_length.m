% Gven the path its length is calculated
function path_length = findpath_length(path)

path_length = 0;
rows = size(path,1);

for i = 1: rows-1
    
    d = sqrt( (path(i,1)-path(i+1,1))^2 + (path(i,2)-path(i+1,2))^2);
    path_length = round((path_length + d),2);
end
end
    
