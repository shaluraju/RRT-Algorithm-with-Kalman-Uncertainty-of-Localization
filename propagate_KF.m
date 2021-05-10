
% Calculates the Error covariance, given state space matrices
function p_k = propagate_KF(A, H_k, Q, R_k, Pk)

E = (A* Pk* A' + Q)^-1;
F = H_k' * R_k^-1 * H_k;
p_k = (E + F)^-1;

end