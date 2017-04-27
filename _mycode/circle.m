clear;

k = 6;

edgeList = dlmread('d:\research\comdetect\fb\0.edges',' ');
edgeList = edgeList + 1; % turn 0-indexing to 1-indexing;
W = sparse(edgeList(:, 1), edgeList(:, 2), 1);
n = max(size(W));
% W(n,n) = 0;

VV = GCSpectralClust1(W,k);
% VV = GCLFK(W,[3:-0.5:0.1]);
rc=0.2;
coords = zeros(n,3);
colours=hsv(k);

% Generate centers of clusters
angles = linspace(0,2*pi,k+1);
f = @(theta) [cos(theta),sin(theta)];
r = arrayfun(@(i)f(angles(i)),1:k+1,'UniformOutput',false);
pt = reshape(cell2mat(r),[2 k+1]);

% assign coordinates for each node
i=1;
for t=(VV(:,k)).'
[x, y]=cirrdnPJ(pt(1,t),pt(2,t),rc);
coords(i,1) = x;
coords(i,2) = y;
coords(i,3) = t;
i= i+1;
end


%%%%%%%%%%%%
% Drawing 

axis equal
hold on


% draw lines between nodes
gplot(W,coords(:,1:2));

% draw the nodes themselves
for point=coords'
   plot(point(1), point(2), 'Color', colours(point(3),:), 'Marker', 'x');
end

% draw a circle around clusters
for t=1:k
[x,y,z] = cylinder(rc,200);
plot(x(1,:)+pt(1,t),y(1,:)+pt(2,t),'r')
end 


%%%%%
% Helper Functions

% Generate points around x1, y1
function [x,y]=cirrdnPJ(x1,y1,rc)
a=2*pi*rand;
r=sqrt(rand);
x=(rc*r)*cos(a)+x1;
y=(rc*r)*sin(a)+y1;
end