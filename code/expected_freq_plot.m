L_samples = linspace(150,300,150); %sample spoke lengths from 150mm to 300mm
Gauge = [13 14 15 16 17]; %standard gauge sizes

FreqsH = zeros(5,150); %initialize a matrix to store frequencies
FreqsL = zeros(5,150);

% Calculate expected frequencies at each gauge for every integer spoke
% length between 150mm and 300mm
for i = 1:length(Gauge)
    Gauge_t = Gauge(i);
    for r = 1:length(L_samples)
        [f,l] = bandpass_frequencies(Gauge_t,L_samples(r));
        FreqsH(i,r) = f;
        FreqsL(i,r) = l;
    end
end

% Plotting results
figure()
for i = 1:length(Gauge)
    plot(L_samples, FreqsH(i,:));hold on
end
xlabel('Spoke Length (mm)')
ylabel('Expected Frequency (Hz)')
legend('13g','14g','15g','16g','17g')
title('Expected Upper Frequency Bound of Stainless Steel Spokes')
hold off

%plot high v low freqs for 14g spokes
figure()
plot(L_samples,FreqsL(2,:)); hold on
plot(L_samples,FreqsH(2,:))
xlabel('Spoke Length (mm)')
ylabel('Expected Frequency (Hz)')
legend('Lower Bound 14g','Upper Bound 14g')
title('Lower vs Upper Frequency Bounds of 14g Spokes')
hold off

% %plot difference btw upper and lower bounds for all spoke lengths
% figure()
% for i = 1:length(Gauge)
%     plot(L_samples,(FreqsH(i,:)-FreqsL(i,:)))
%     hold on
% end
% hold off