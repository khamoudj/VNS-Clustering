function [ NewClasses,NewObjets ] = EarthApple( CL,OB,MU,Ratio )
%Equilibre terre lune
%   Detailed explanation goes here
lnC=length(CL);
lnO=length(OB);
for i=1:lnC
    CL(i,7)=CL(i,6)/21360;
end
equilibrium=false;
cpt=0;
while(equilibrium==false)
    equilibrium=true;
    
    for i=1:lnC
        if CL(i,5)>0
            ind=i;
            masse=0;
            F=0;
            dist2=0;
            for j=1:lnC
                if (CL(j,5)>0) && (i~=j) && (Distance(CL(i,2),CL(i,3),CL(j,2),CL(j,3),'Euclidienne')<CL(j,7))
                    masse=CL(j,6);
                    dist2=(CL(i,2)-CL(j,2))^2+(CL(i,3)-CL(j,3))^2;
                    NewF=masse/dist2;
                    if NewF>F
                        F=NewF;
                        ind=j;
                    end                    
                end            
            end
            
            if (ind~=i)
               equilibrium=false;
               cpt=cpt+1;
               CL(ind,2)=(CL(ind,2)*CL(ind,5)+CL(i,2)*CL(i,5))/(CL(ind,5)+CL(i,5));
               CL(ind,3)=(CL(ind,3)*CL(ind,5)+CL(i,3)*CL(i,5))/(CL(ind,5)+CL(i,5));
               CL(ind,5)=CL(ind,5)+CL(i,5);
               CL(ind,6)=CL(ind,5)*MU;
               CL(ind,7)=Ratio*CL(ind,6)/213;
               
               CL(i,5)=0;
               CL(i,6)=0;
               CL(i,7)=0;
                    
               for k=1:lnO
                    if OB(k,5)==i
                        OB(k,5)=ind;
                    end
               end
            end
            
            
            
        end                
    end
    
    
end



cpt=cpt
NewClasses=CL;
NewObjets=OB;
end

