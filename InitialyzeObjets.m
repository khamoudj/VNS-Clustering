function [ Objets ] = InitialyzeObjets( AllData,lng)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
c=0;
for i=1:lng
    if AllData{i,1}~=-1
        c=c+1;
        Objets(c,1)=c;
        Objets(c,2)=AllData{i,5};
        Objets(c,3)=AllData{i,8};
        Objets(c,4)=AllData{i,12};
        Objets(c,5)=1;
        Objets(c,6)=1;

    end        
end
end