function [T] = tension(L, F, gauge)
%Solve for spoke tension given a fundamental frequency, length, and gauge
%   USE: In order to use this function, you will need to know the length of
%   the spoke(s), their gauge, length (mm), and the fundamental frequency
%   acquired through calculation. This calculator is designed to work for
%   stainless steel spokes only. If you are using butted spokes (single, 
%   double or triple), input the highest gauge value (as in eg. on a
%   14g/15g/14g spoke, input 15 for gauge).

%ensure that gauge input is an integer
arguments
    L {mustBeNumeric}
    F {mustBeNumeric}
    gauge {mustBeInteger}
end

%Rough check of spoke length unit
assert(L>100, 'Make sure spoke length is in millimeters!')

%round spoke length value DOWN to the nearest mm
L = floor(L);

%Solve for diameter 
D_g = [2.3 2.0 1.8 1.6 1.5;
       13 14 15 16 17];

for r = 1:length(D_g)
    if gauge == D_g(2,r)
        D = D_g(1,r);
    end

end

% Calculate mass/unit length
L = L/1000; %convert L to meters
rho = ((7.61e3+7.87e3)/2); %kg/m^3
m = D*rho; %kg/m

% Calculate tension
T = 4*(F^2)*(L^2)*m;

end