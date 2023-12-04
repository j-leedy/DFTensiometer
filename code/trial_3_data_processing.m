close all; clear; clc

load data/'Trial 3'/trial3_data.mat
bad = bad(:,1);
best = best(:,1);
worst = worst(:,1);
background = background(:,1);

t = linspace(0,length(bad)/fs,length(bad));

%% Plot sound waves 

% (commented for now)
%{
figure(); plot(t,bad)
title('Low Tension Pluck Time Domain')
figure(); plot(t,worst)
title('Very Low Tension Pluck Time Domain')
figure(); plot(t,best)
title('High Tension Pluck Time Domain') 
%}

%% FFTs
fft_bad = fft(bad);
fft_worst = fft(worst);
fft_best = fft(best);

N = length(best);
F = linspace(-pi, pi-2/N*pi, N) + pi/N*mod(N,2);
    F = (F*fs)/(2*pi);

%plot(F,fftshift(abs(fft_bad)))
%figure();plot(F,fftshift(abs(fft_best)))
figure();plot(F,fftshift(abs(fft_worst)))

%% Filter Stage 1
% First filter: remove fft of background noise recording from pluck ffts

filter1 = 400*fft(abs(background));

fft_bad = fft_bad - filter1;
fft_worst = fft_worst - filter1;
fft_best = fft_best - filter1;
%%

figure()
plot(F,fftshift(abs(fft_bad)));
figure();plot(F,fftshift(abs(fft_best)))
figure();plot(F,fftshift(abs(fft_worst)))

%% Fiter Stage 2
% Second filter: Bandpass filter to elimate large spikes around center of
% DFT

[~, cutoffs_best] = sort(abs(fft_best),'descend');
fft_best(cutoffs_best(1:500)) = 0;
figure()
plot(F,fftshift(abs(fft_best))); legend()
