
%read original audio
[x,fs]=audioread('audio.wav');
N=length(x);
noisy_audio=fft(x,N);
f=(-N/2:N/2-1)*fs/N;

%plotting against f in hz by shifting zero to the center of spectrum
figure(1);
plot(f,abs(fftshift(noisy_audio))/N);
title('audio before filtering');

%filtering audio 
filtered_audio=filter(Hd_1,x);
filtered_audio_transform=fft(filtered_audio);

%plotting filtered audio
figure(2);
plot(f,abs(fftshift(filtered_audio_transform))/N);
title('audio after filtering');
%audio after filtration
sound(filtered_audio,fs);

%save audio after filtration
audiowrite('filteredh.wav',filtered_audio,fs);

%plotting frequency response of the filter
freqz(Hd_1);

%plotting impulse response of the filter
impz(Hd_1);

%save filtered audio after doubling speed
audiowrite('doublefilteredh.wav',filtered_audio,2*fs);

%read filtered audio after doubling speed
[new_filtered_audio,fsnew]=audioread('doublefilteredh.wav');
N=length(new_filtered_audio);
New_filtered_audio=fft(new_filtered_audio,N);

%plotting filtered audio after doubling speed
f=(-N/2:N/2-1)*fsnew/N;
figure(3);
plot(f,abs(fftshift(New_filtered_audio))/N);
title('audio after doubling speed');



