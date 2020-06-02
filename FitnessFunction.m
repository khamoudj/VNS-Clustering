function [ F ] = FitnessFunction( CL,OB )
%Calcul de la fonction objectif
%   Detailed explanation goes here
F = 2 * DInterClass(CL) / ((length(CL) - 1) * DIntraClass(CL, OB));

end

