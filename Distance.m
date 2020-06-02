function [ res ] = Distance( x1,y1,x2,y2,m)
%Calculer la force de gravitation
%   Detailed explanation goes here
if strcmp(m,'Euclidienne')
    res=sqrt((x1-x2)^2+(y1-y2)^2);
else
    res=abs(x1-x2)+abs(y1-y2);
end


end

