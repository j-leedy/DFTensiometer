function [T] = tension(L, F, gauge)
%Solve for spoke tension given a fundamental frequency, length, and gauge:
% 
%   USE: In order to use this function, you will need to know the length of
%   the spoke(s) in millimeters, their gauge, and the fundamental frequency
%   of the spoke as calculated by DFT analysis. This calculator is designed 
%   to work for stainless steel spokes only. If you are using butted spokes 
%   (single, double or triple), input the highest gauge value (as in eg. 
%   on a 14g/15g/14g spoke, input 15 for gauge).
%   
%   INPUTS: (Length [mm], Frequency [Hz], Gauge)
%   OUTPUTS: Tension (N)
%   
%   T = tension(L, F, gauge)

%ensure that gauge input is an integer
arguments
    L {mustBeNumeric}
    F {mustBeNumeric}
    gauge {mustBeInteger}
end

%Rough check of spoke length unit as only a <~ 20in wheel would have spokes
%this short
assert(L>100, 'Make sure spoke length is in millimeters!')

%round spoke length value DOWN to the nearest mm
L = floor(L);

%Solve for diameter 
D_g = [2.3 2.0 1.8 1.6 1.5;
       13 14 15 16 17]; %matrix matching gauge number to spoke diameter(mm)

for r = 1:length(D_g)
    if gauge == D_g(2,r)
        D = D_g(1,r);
    end

end

D = D/1000; %convert to meters

% Calculate mass/unit length
L = L/1000; %convert L to meters
rho = ((7.61e3 + 7.87e3)/2); %kg/m^3
Ac = pi*(D/2)^2; %cross sectional area (m^2)
m = Ac*rho; %kg/m

% Calculate tension
T = ((2*F*L)^2)*m;
end