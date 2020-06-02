hold on
IdxLastClass=0;
IdxPredLastClass=0;

for i=1:length(Classes)
    if Classes(i,5)>0
        % plot(Objets(Objets(:,5)==i,2),Objets(Objets(:,5)==i,3),'.','color',rand(1,3));
        plot3(Objets(Objets(:,5)==i,2),Objets(Objets(:,5)==i,4),Objets(Objets(:,5)==i,3),'.','color',rand(1,3));
        IdxPredLastClass=IdxLastClass;
        IdxLastClass=i;
    end    
end


%plot(Classes(Classes(:,5)>20,2),Classes(Classes(:,5)>20,3),'-red');
Classes(IdxPredLastClass,2)
Classes(IdxPredLastClass,3)
Classes(IdxLastClass,2)
Classes(IdxLastClass,3)
hold off
title('Learning set B1-1');
xlabel('Time');
ylabel('Temperature');
zlabel('Vibration');