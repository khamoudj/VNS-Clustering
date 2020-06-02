function [ Classes,Objets ] = Reduce( CL,OB )
%Diminuer le rayon de la classe la plus solide
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
ReduceInd=1;

for i=2:lnC
    NewV=0;
    for j=1:lnO
        if OB(j,5)==i
            NewV=NewV+Distance(OB(j,2),OB(j,3),CL(i,2),CL(i,3),'Euclidienne');
        end        
    end
    NewV=NewV/((CL(i,5)-1)^2);
    if NewV>V
        ReduceInd=i;
        V=NewV;
    end    
end

NewRay=V*(CL(i,5)-1)/2;
for i=1:lnO
    if (i==ReduceInd)&&(Distance(OB(i,2),OB(i,3),CL(ReduceInd,2),CL(ReduceInd,3),'Euclidienne')>NewRay)
        NewInd=0;
        D=NewRay*1000;
        for j=1:lnC
            if (i~=j) && ((Distance(OB(i,2),OB(i,3),CL(j,2),CL(j,3),'Euclidienne')<D))
                NewInd=j;
                D=Distance(OB(i,2),OB(i,3),CL(j,2),CL(j,3),'Euclidienne');
            end
        end
        
        exind=OB(i,5);
        ind=NewInd;
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

