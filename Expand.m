function [ Classes,Objets ] = Expand( CL,OB )
%Augmenter le rayon de la classe la plus solide
%   Detailed explanation goes here
lnC=length(CL);
lnO=length(OB);
NewV=0;
for j=1:lnO
    if OB(j,5)==1
        NewV=NewV+Distance(OB(j,2),OB(j,3),CL(1,2),CL(1,3),'Euclidienne');
    end        
end
V=NewV/((CL(1,5)-1)^2);
ExpandInd=1;

for i=2:lnC
    NewV=0;
    for j=1:lnO
        if OB(j,5)==i
            NewV=NewV+Distance(OB(j,2),OB(j,3),CL(i,2),CL(i,3),'Euclidienne');
        end        
    end
    NewV=NewV/((CL(i,5)-1)^2);
    if NewV<V
        ExpandInd=i;
        V=NewV;
    end    
end

NewRay=V*(CL(i,5)-1)*3/2;
for i=1:lnO
    if (i~=ExpandInd)&&(Distance(OB(i,2),OB(i,3),CL(ExpandInd,2),CL(ExpandInd,3),'Euclidienne')<NewRay)
        exind=OB(i,5);
        ind=ExpandInd;
        OB(i,5)=ind;

        CL(ind,2)=(CL(ind,2)*CL(ind,5)+OB(i,2))/(CL(ind,5)+1);
        CL(ind,3)=(CL(ind,3)*CL(ind,5)+OB(i,3))/(CL(ind,5)+1);
        CL(ind,5)=CL(ind,5)+1;
        
        CL(exind,2)=(CL(exind,2)*CL(exind,5)-OB(i,2))/(CL(exind,5)+1);
        CL(exind,3)=(CL(exind,3)*CL(exind,5)-OB(i,3))/(CL(exind,5)+1);
        CL(exind,5)=CL(exind,5)-1;        
    end
end
Classes=CL;
Objets=OB;
end

