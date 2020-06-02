function [ CL,OB ] = InitialyzeCO(DataTab,MU)
%Initialisation de la table classe et la table objets
%   Distinguer les planetes et les sattelites
lng=length(DataTab);
ClOrOb=15;
DT=DataTab;
for i=1:lng
    ClOrOb=ClOrOb+1;
    ClOrOb=mod(ClOrOb,22);
    if ClOrOb==0
        DT{i,1}=-1;
    end
        
end

%Selection des planetes
c=0;
for i=1:lng
    if DT{i,1}==-1
        c=c+1;
        CL(c,1)=c;
        CL(c,2)=DT{i,5};
        CL(c,3)=DT{i,8};
        CL(c,4)=DT{i,12};
        CL(c,5)=1;
        CL(c,6)=1;
        CL(c,7)=1;        
    end        
end


%Selection des satellites
c=0;
for i=1:lng
    if DT{i,1}~=-1
        c=c+1;
        OB(c,1)=c;
        OB(c,2)=DT{i,5};
        OB(c,3)=DT{i,8};
        OB(c,4)=DT{i,12};
        OB(c,5)=1;
        OB(c,6)=1;
    end        
end

%Uniformalistaion des valeurs
M2=abs(mean(OB(:,2)));
M3=abs(mean(OB(:,3)));
lnC=length(CL);
lnO=length(OB);
for i=1:lnO
    OB(i,2)=OB(i,2)*M3;
    OB(i,3)=OB(i,3)*M2;
end
for i=1:lnC
    CL(i,2)=CL(i,2)*M3;
    CL(i,3)=CL(i,3)*M2;
end

%Solution de départ
lnC=length(CL);
lnO=length(OB);
Gain=0;
NewGain=0;
Ind=0;
for i=1:lnO
    Ind=1;
    Gain=Distance(OB(i,2),OB(i,3),CL(1,2),CL(1,3),'Euclidienne');
    for j=2:lnC
        NewGain=Distance(OB(i,2),OB(i,3),CL(j,2),CL(j,3),'Euclidienne');
        if NewGain<Gain
           Gain=NewGain;
           Ind=j;
        end
    end
    OB(i,5)=Ind;
    OB(i,6)=MU/(Gain^2);
    CL(Ind,5)=CL(Ind,5)+1;
    
end

for j=1:lnC
    CL(j,6)=CL(j,5)*MU;
    CL(j,7)=CL(j,6)*213.6;
end
for j=1:lnO
    masse=CL(OB(j,5),6);
    dist2=(OB(j,2)-CL(OB(j,5),2))^2+(OB(j,3)-CL(OB(j,5),3))^2;
    OB(j,6)=masse/dist2;    
end

end
