function [ D ] = DInterClass( CL )
%Calcul de la distance inter classes
%   Detailed explanation goes here
lnC=length(CL);
D=0;
for i=1:lnC
    for j=1:lnC
        if i~=j
            D = D + sqrt((CL(i,2) - CL(j,2)) ^ 2 + (CL(i,3) - CL(j,3)) ^ 2);
        end        
    end
end

end

