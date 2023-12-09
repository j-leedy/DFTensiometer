function [F_upper,F_lower] = bandpass(gauge,L)
%BANDPASS creates a unique band pass filter for use in the DFTensio app.
%   Given inputs of spoke gauge and length(mm), this function will 
%   reverse-calculate the expected range of frequencies using Park Tool's
%   TS-1 tensiometer conversion chart. The upper and lower bounds
%   calculated can be passed into the 'natural_frequency.m' function, which
%   will do the filtering.

%ensuring L is a number, gauge is integer
arguments
    gauge {mustBeInteger}
    L {mustBeNumeric}
end

%check that spoke length is in mm
assert(L >= 100, "Make sure spoke length is in millimeters!")

L = L/1000; %convert to meters

% matrix containing most common spoke gauges, associated diameters, and
% high and low readings for tension from the TS-1 conversion chart (kg-f)
tensions = [2.3 2.0 1.8 1.6 1.5;
            13 14 15 16 17;
            54 53 53 54 52;
            172 173 167 160 166];

% identify spoke diameter and upper and lower tension bounds based on user
% input of gauge
for r = 1:length(tensions)
    if gauge == tensions(2,r)
        D = tensions(1,r);
        upper = tensions(4,r);
        lower = tensions(3,r);
    end
end

upper = upper * 9.80665; %convert to N
lower = lower * 9.80665;

% Calculate mass/unit length
D = D/1000; %convert to meters
L = L/1000; %convert L to meters
rho = ((7.61e3 + 7.87e3)/2); %kg/m^3
Ac = pi*(D/2)^2; %cross sectional area (m^2)
m = Ac*rho; %kg/m

% Calculate upper and lower frequency bounds IOT make a unique band pass
% for the user's wheel
F_upper = (1/2*L)*sqrt(upper/m); 
F_lower = (1/2*L)*sqrt(lower/m);

end