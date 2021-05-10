
% Main Program file to run RRT with Kalman Uncertainty for 100 instances

clc
clear all
start_state = [5, 50];
goal_region = [90  0 100   0  100 100  90 100];
obstacles = [  5 10 15 10 15 20  5 20; % obstacle 1
              10 40 20 40 20 50 10 50; % obstacle 2
              20 70 30 70 30 80 20 80; % ...etc...
              30 20 40 20 40 30 30 30; 
              40 50 50 50 50 60 40 60;
              50  5 60  5 60 15 50 15;
              55 80 65 80 65 90 55 90;
              60 40 70 40 70 50 60 50;
              70 20 80 20 80 30 70 30;
              75 65 85 65 85 75 75 75 ];


[path,path_length,video] = RRT(start_state, goal_region, obstacles);
pause(2)
P_final = propagate_KF_path(path,obstacles,video);

