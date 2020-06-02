clear

DataTab=LoadData();
MasseSysSolaire=2987831; %* (10^21)
MU= MasseSysSolaire / length(DataTab);
MaxDistSS=444286000000;
[Classes,Objets]=InitialyzeCO(DataTab,MU);
MaxDist=Distance(min(Objets(:,2)),min(Objets(:,3)),max(Objets(:,2)),max(Objets(:,3)),'Euclidienne');
Ratio=10*MaxDistSS/MaxDist;%Trn12
%Ratio=1*MaxDistSS/MaxDist;%Trn11
%Ratio=100*MaxDistSS/MaxDist;%Trn31
[Classes,Objets]=EarthMoon(Classes,Objets,MU,Ratio);
[Classes,Objets]=EarthApple(Classes,Objets,MU,Ratio);
%Temperature normalization
for i=1:length(Objets)
    Objets(i,4)=Objets(i,4)*10000/18;
end


Plot


