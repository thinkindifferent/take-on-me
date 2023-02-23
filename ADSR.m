function [outADSR] = ADSR(noteValue)
%ADSR Summary of this function goes here
%Creates an ADSR envelope for a given note value
%   Detailed explanation goes here
A=linspace(0, 1, 0.05*(length(noteValue)+1));
D=linspace(1, 0.75, 0.1*(length(noteValue)+1));
S=linspace(0.75, 0.75, 0.7*(length(noteValue)+1));
R=linspace(0.75, 0, 0.15*(length(noteValue)+1));

outADSR=[A D S R];
end