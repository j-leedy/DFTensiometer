function F = natural_frequency(sound_file_path, upper_bound, lower_bound)
% Find the natural frequency of a spoke pluck sound singal given the
% sound file and an upper and lower bound for filtering.
%
% inputs:
%   sound_file_path: string representing the path to the sound file
%
%   upper_bound: 1x1 double representing the upper bound frequency for the
%   band pass filter
%   
%   lower_bound: 1x1 double representing the lower bound frequency for the
%   band pass filter

% load in sound data, y, and sampling rate, Fs
[y,Fs] = audioread(sound_file_path);

% Find length of sound data
N = length(y);

% Create frequency space in Hz
frequencies = linspace(-Fs/2, Fs/2 - Fs/N, N) + Fs/(2*N)*mod(N, 2);

% Perform FFT on sound data
y_fft = fft(abs(y));

% Shift FFT to center frequencies at 0 Hz
y_fftshift = fftshift(abs(y_fft));

% Create bandpass filter. Signal outside of the band will be eliminated and
% set to zero. Bounds are set by lower_bound and upper_bound inputs
filter = zeros(length(frequencies), 1);
filter(frequencies >= lower_bound & frequencies <= upper_bound) = 1;

% Apply filter to shifted frequency domain sound data
filtered_y = y_fftshift.* filter;

% Return the frequency that has the highest magnitude in the filtered data
F = frequencies(filtered_y(:,1) == max(filtered_y(:,1)));

end