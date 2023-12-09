L_samples = linspace(150,300,150); %sample spoke lengths from 150mm to 300mm
Gauge = [13 14 15 16 17]; %standard gauge sizes

Freqs = zeros(5,150); %initialize a matrix to store frequencies

% Calculate expected frequencies at each gauge for every integer spoke
% length between 150mm and 300mm
for i = 1:length(Gauge)
    Gauge_t = Gauge(i);
    for r = 1:length(L_samples)
        [f,l] = bandpass_frequencies(Gauge_t,L_samples(r));
        Freqs(i,r) = f;
    end
end

% Plotting results
figure()
for i = 1:length(Gauge)
    plot(L_samples, Freqs(i,:));hold on
end
xlabel('Spoke Length (mm)')
ylabel('Upper Bound of Expected Freq. (Hz)')
legend('13g','14g','15g','16g','17g')
hold off
    
