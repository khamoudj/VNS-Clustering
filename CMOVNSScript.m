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


Parcours=[1000];
BestClasses=Classes;
BestObjets=Objets;
BestF=FitnessFunction( Classes,Objets );
PrevStructure=0;
PrevClasses=Classes;
PrevObjets=Objets;
cpt=0;
while(cpt<1000)
    cpt=cpt+1;
    Improvment=false;
    F=FitnessFunction( Classes,Objets );
    
    %La première structure de voisinage
    [CurrentClasses,CurrentObjets]=Expand(Classes,Objets);
    CurrentF=FitnessFunction( CurrentClasses,CurrentObjets );
    if CurrentF>F
        PrevStructure=1;
        PrevClasses=Classes;
        PrevObjets=Objets;
        Classes=CurrentClasses;
        Objets=CurrentObjets;
        Improvment=true;
    else
        %La deuxième structure de voisinage
        [CurrentClasses,CurrentObjets]=Reduce(Classes,Objets);
        CurrentF=FitnessFunction( CurrentClasses,CurrentObjets );
        if CurrentF>F
            PrevStructure=2;
            PrevClasses=Classes;
            PrevObjets=Objets;
            Classes=CurrentClasses;
            Objets=CurrentObjets;
            Improvment=true;
        else
            %La troisième structure de voisinage
            if PrevStructure==1
                [CurrentClasses,CurrentObjets]=Reduce(PrevClasses,PrevObjets);
                CurrentF=FitnessFunction( CurrentClasses,CurrentObjets );
                if CurrentF>F
                    PrevStructure=-2;
                    PrevClasses=Classes;
                    PrevObjets=Objets;
                    Classes=CurrentClasses;
                    Objets=CurrentObjets;
                    Improvment=true;
                end
            else
               if PrevStructure==2
                    [CurrentClasses,CurrentObjets]=Expand(PrevClasses,PrevObjets);
                    CurrentF=FitnessFunction( CurrentClasses,CurrentObjets );
                    if CurrentF>F
                        PrevStructure=-1;
                        PrevClasses=Classes;
                        PrevObjets=Objets;
                        Classes=CurrentClasses;
                        Objets=CurrentObjets;
                        Improvment=true;
                    end
               else
                   %Mutation
                   [CurrentClasses,CurrentObjets]=Shake(Classes,Objets);
                    CurrentF=FitnessFunction( CurrentClasses,CurrentObjets );
                    Classes=CurrentClasses;
                    Objets=CurrentObjets;
                    PrevStructure=-9;
                    if CurrentF>F
                    	Improvment=true;
                    end
                end 
            end
            
        end
    end
    Parcours(cpt)=PrevStructure;
end
   
Plot
