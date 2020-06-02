function [ NewClasses,NewObjets ] = EarthMoon( CL,OB,MU,Ratio )
%Equilibre terre lune
%   Detailed explanation goes here
equilibrium=false;
lnC=length(CL);
lnO=length(OB);
cpt=0;
while(equilibrium==false)
    equilibrium=true;
    
    for i=1:lnO
        ind=OB(i,5);
        masse=CL(ind,6);
        dist2=Ratio*((OB(i,2)-CL(ind,2))^2+(OB(i,3)-CL(ind,3))^2);
        F=masse/dist2;        
        for j=1:lnC
            masse=CL(j,6);
            dist2=Ratio*((OB(i,2)-CL(j,2))^2+(OB(i,3)-CL(j,3))^2);
            NewF=masse/dist2;
            if (NewF>F)&&(CL(j,7)>sqrt(dist2))
                F=NewF;
                ind=j;
            end
        end
        if ind~=OB(i,5)
            equilibrium=false;
            cpt=cpt+1;
            exind=OB(i,5);
            OB(i,5)=ind;
            
            CL(ind,2)=(CL(ind,2)*CL(ind,5)+OB(i,2))/(CL(ind,5)+1);
            CL(ind,3)=(CL(ind,3)*CL(ind,5)+OB(i,3))/(CL(ind,5)+1);
            CL(ind,5)=CL(ind,5)+1;
            CL(ind,6)=CL(ind,6)+MU;
            
            CL(exind,2)=(CL(exind,2)*CL(exind,5)-OB(i,2))/(CL(exind,5)+1);
            CL(exind,3)=(CL(exind,3)*CL(exind,5)-OB(i,3))/(CL(exind,5)+1);
            CL(exind,5)=CL(exind,5)-1;
            CL(exind,6)=CL(exind,6)-MU;
        end
    end
end
cpt=cpt
NewClasses=CL;
NewObjets=OB;
end

