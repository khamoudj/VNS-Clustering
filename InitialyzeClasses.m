function [ Cl ] = InitialyzeClasses( DataTab,lng)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
c=0;
for i=1:lng
    if DataTab{i,1}==-1
        c=c+1;
        Cl(c,1)=c;
        Cl(c,2)=DataTab{i,6};
        Cl(c,3)=DataTab{i,8};
        Cl(c,4)=DataTab{i,12};
        Cl(c,5)=1;
        Cl(c,6)=1;
        Cl(c,7)=1;        
    end
        
end
end

