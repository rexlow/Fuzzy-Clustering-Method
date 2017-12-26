function [NCentres, M] = defcm(Centres, q)
% Fuzzy c-means clustering example using tiles data
%
% [NCentres, M] = defcm(Centres, q)
%
%  Centres = the current cluster centres (k-by-features)
%  q = membership power (2 is usual, close to 1 is hard clustering)
%
%  NCentres = the new cluster centres (k-by-features)
%  M = the membership matrix (n-by-k)
%
% Demonstrates FCM clustering. It plots the objects and
% the cluster centres. Re-iterate with the new centres 
% as input to continue convergence.
%
% Jantzen 08.11.99

% Prepare a Matlab array containing the data, see 'nnet';
% Column 1 is the 475Hz intensities;
% Column 2 is the 557Hz intensities;
% Column 3 is 1 for OK, -1 for not OK;
Tiles = [
   0.9580    0.0030   1
   1.0430    0.0010   1
   1.9070    0.0030   1 
   0.7800    0.0020   1
   0.5790    0.0010   1
   0.0030    0.1050  -1
   0.0010    1.7480  -1
   0.0140    1.8390  -1
   0.0070    1.0210  -1
   0.0040    0.2140  -1] ; 

% Data span several decades, take logarithms instead ;
Tiles(:, 1) = log(Tiles(:, 1)) ;
Tiles(:, 2) = log(Tiles(:, 2)) ;

% Plot the data;
clf ; hold off;
% subplot(221) ;
plot(Tiles(1:5, 1), Tiles(1:5, 2), 'ob') ;
axis([-8 2 -8 2]) ;
xlabel('log(intensity) 475 Hz') ;
ylabel('log(intensity) 557 Hz') ;
title('Tiles data: o = whole tiles, * = cracked tiles, x = centres') ;
hold on;
plot(Tiles(6:10, 1), Tiles(6:10, 2), '*b') ;
plot(Centres(:,1), Centres(:,2),'xr') ;

Object = Tiles(:,[1 2])' ;
Centres = Centres' ;
k = length(Centres(:,1)); % No of clusters ;
D = dist(Object, Centres); % distances from object to c-centres (n-by-k) ;
M = member(D, q) ; % Membership is a function of distance to centres ;
ClustSums = sum(M) ;
[NoOfObs, NoOfCtrs] = size(M) ;
z = M ./ (ones(NoOfObs,1) * ClustSums) ; % Prepare centre calculation ;
NCentres = Centres' ;
for i = 1:NoOfCtrs,
   w = z(:,i) * ones(1,2) ; % Weights ;
   NCentres(i,:) = sum(Object' .* w) ; % Means of objects are centres ;
end ;

