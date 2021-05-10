
function P_final = propagate_KF_path(path,obstacles,video)
 
A = [1 0 0 0; % [x_dot, y_dot, x, y]'
     0 1 0 0;
     1 0 1 0;
     0 1 0 1];
elements = [1 1 1 1];
P = diag(elements);
Q = diag(elements);

for i = 1: numel(path)/2
    H = [1 0 0 0; 0 1 0 0]; % [x_dot; y_dot]
    R = diag([1 1]);         

    p_x = path(i,1);
    p_y = path(i,2);
    %Checking for the obstacles in range
    positive_x = collision_check_point(p_x+5,p_y,obstacles);
    positive_y = collision_check_point(p_x,p_y+5,obstacles);
    negative_x = collision_check_point(p_x-5,p_y,obstacles);
    negative_y = collision_check_point(p_x,p_y-5,obstacles);
    
    if positive_x == 1 || negative_x == 1
        H = [1 0 0 0; 0 1 0 0; 0 0 1 0];
        R = diag([1 1 1]);
    elseif positive_y == 1 || negative_y == 1
        H = [1 0 0 0; 0 1 0 0; 0 0 0 1];
        R = diag([1 1 1]);   
    elseif positive_x == 1 || negative_x == 1 && positive_y == 1 || negative_y == 1
        H = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
        R = diag([1 1 1 1]);
    end
    P_k = propagate_KF(A,H,Q,R,P);
    ellipse(sqrt(P_k(3,3)), sqrt(P_k(4,4)), 0 , p_x, p_y, 'r');
    F(i) = getframe(gcf);
    
    P = P_k;    
end
writeVideo(video,F)
pause(1)
close(video)
P_final = P_k;
end