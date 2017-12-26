function z = dist(V, M)
%
% Euclidean distance
% z = dist(V, M)
%
% V column vector of coordinates for a test object
% M matrix of coordinates for training objects, one
%   column per object
% z vector of distances from V to all objects in M
%
% Finds the Euclidean distance from a test point V
% to all training points M in the feature space.
% V can be a matrix of test objects, in which case
% z is a matrix of distances from all test objects
% in V to all training objects in M.

% Jantzen 13.03.99

SzM = size(M);
SzV = size(V) ;
z = ones(SzV(2),SzM(:,2)) ;
for i = 1:SzV(2),   
   V2 = V(:,i) ;
   Dif = (V2*ones(1,SzM(2))) - M ;
   d = sqrt(sum(Dif.^2));
   z(i,:) = d ;
end ;
   