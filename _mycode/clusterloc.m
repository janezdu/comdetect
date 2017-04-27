close all;
clear all;

m=10;

A = rand(2);
% m = 20;
angles = linspace(0,2*pi,m);
f = @(theta) [cos(theta),sin(theta)];
r = arrayfun(@(i)f(angles(i)),1:m,'UniformOutput',false);
pt = reshape(cell2mat(r),[2 m]);

% line(pt(1,:),pt(2,:));
hold on
plot(pt(1,:),pt(2,:),'ro')


function [x, y]=cirrdnPJ(x1,y1,rc)
%the function, must be on a folder in matlab path
    a=2*pi*rand;
    r=sqrt(rand);
    x=(rc*r)*cos(a)+x1;
    y=(rc*r)*sin(a)+y1;
end



%multiply points with A
% r = arrayfun(@(i)A*pt(:,i),1:m,'UniformOutput',false);
% r{:}