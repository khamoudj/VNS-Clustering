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
    [CurrentClasses,CurrentObjets]=Reduce(Classes,Objets);
    CurrentF=FitnessFunction( CurrentClasses,CurrentObjets );
    if CurrentF>F
        PrevStructure=1;
        PrevClasses=Classes;
        PrevObjets=Objets;
        Classes=CurrentClasses;
        Objets=CurrentObjets;
        Improvment=true;
    else
        [CurrentClasses,CurrentObjets]=Shake(Classes,Objets);
        CurrentF=FitnessFunction( CurrentClasses,CurrentObjets );
        Classes=CurrentClasses;
        Objets=CurrentObjets;
    end
    
    Parcours(cpt)=PrevStructure;
end
    
Plot
