
function [BVALUE] = bvalue(gradamp,delta,DELTA)
%Bvalue -calculates b-value
%all inputs should be given in SI-units
%gradamp: Amplitude of diffusion gradient, T/m
%delta: Diffusion gradient time
%DELTA: time between start of dephasing and start of rephasing

y = 42.576e6; %gyromagnetic ratio, 42.576MHz/T

BVALUE = (2*pi*y*gradamp*delta)^2*(DELTA-delta/3);

end