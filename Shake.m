function [ Classes,Objets ] = Shake( CL,OB )
%Mutation aléatoire
%   Detailed explanation goes here
lnC=length(CL);
lnO=length(OB);

for i=1:lnC
    D=0;
    ind=0;
    for j=1:lnO
        if (OB(j,5)==i) && (Distance(OB(j,2),OB(j,3),CL(i,2),CL(i,3),'Euclidienne')>D)
            D=Distance(OB(j,2),OB(j,3),CL(i,2),CL(i,3),'Euclidienne');
            ind=j;
        end
    end
    if ind~=0
        CLind=i;
        for k=1:lnC
            if (k~=i) && (Distance(OB(ind,2),OB(ind,3),CL(k,2),CL(k,3),'Euclidienne')<D)
                D=Distance(OB(ind,2),OB(ind,3),CL(k,2),CL(k,3),'Euclidienne');
                CLind=k;
            end
        end

        if i~=CLind
            OB(ind,5)=CLind;
            CL(CLind,2)=(CL(CLind,2)*CL(CLind,5)+OB(ind,2))/(CL(CLind,5)+1);
            CL(CLind,3)=(CL(CLind,3)*CL(CLind,5)+OB(ind,3))/(CL(CLind,5)+1);
            CL(CLind,5)=CL(CLind,5)+1;

            CL(i,2)=(CL(i,2)*CL(i,5)-OB(ind,2))/(CL(i,5)+1);
            CL(i,3)=(CL(i,3)*CL(i,5)-OB(ind,3))/(CL(i,5)+1);
            CL(i,5)=CL(i,5)-1;
        end
    end
    
    
end
Classes=CL;
Objets=OB;

end

