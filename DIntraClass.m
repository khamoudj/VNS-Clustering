function [ D ] = DIntraClass( CL,OB )
%Calcul de la distance intra classe
%   Detailed explanation goes here
lnO=length(OB);
D=0;
for i=1:lnO
    D = D + sqrt((OB(i,2) - CL(OB(i,5),2)) ^ 2 + (OB(i,3) - CL(OB(i,5),3)) ^ 2);
end

end

