% music3.m
% 4/12/22
% Description: Generates spectograms and audio files for 3 songs of choice
%% FurElise={'E5' 'DS5' 'E5' 'DS5' 'E5' 'B4' 'D5' 'C5'}
%% Praeludium={'C4' 'E4' 'G4' 'C5' 'E5' 'G4' 'C5' 'E5'} x4
%% ThousandMiles={'C5' 'C4' 'C5' 'B4' 'C4' 'B4' 'G4'}
%% Assume BPM=200 *=0.3 second long
clear all;
while true
	prompt = "Fur Elise(1) or Praeludium(2) or ThousandMiles(3)?";
	choice = input(prompt);
	switch choice
		case 1
			clear all;
			Fs=8000;
			dur = 0.3*Fs;
           		z = zeros(1,200);
			E5 = sin(2*pi* [1:dur]/Fs * 659); %% E5
			DS5= sin(2*pi* [1:dur]/Fs * 622); %% DS5
			B4 = sin(2*pi* [1:dur]/Fs * 493); %% B4
			D5 = sin(2*pi* [1:dur]/Fs * 587); %% D5
			C5 = sin(2*pi* [1:dur]/Fs * 523); %% C5
			FurElise = [E5 z DS5 z E5 z DS5 z E5 z B4 z D5 z C5];
			soundsc(FurElise,Fs)
spectrogram(FurElise,256,250,256,Fs,'yaxis');title('Spectrogram Beethoven by MRA')
audiowrite('FurEliseSine.wav',FurElise,Fs); % Write the audio
		case 2
			clear all;
			Fs=8000;
			dur = 0.3*Fs;
           		z = zeros(1,200);
			C4 = sin(2*pi* [1:dur]/Fs * 261); %% C4
			E4= sin(2*pi* [1:dur]/Fs * 329); %% E4
			G4 = sin(2*pi* [1:dur]/Fs * 391); %% G4
			C5 = sin(2*pi* [1:dur]/Fs * 523); %% C5
			E5 = sin(2*pi* [1:dur]/Fs * 659); %% E5
		  Praeludium = [C4 z E4 z G4 z C5 z E5 z G4 z C5 z E5 z C4 z E4 z G4 z C5 z E5 z G4 z C5 z E5 z C4 z E4 z G4 z C5 z E5 z G4 z C5 z E5 z C4 z E4 z G4 z C5 z E5 z G4 z C5 z E5];
			soundsc(Praeludium,Fs)
      spectrogram(Praeludium,256,250,256,Fs,'yaxis');title('Spectrogram Bach by MRA')			
      audiowrite('PraeludiumSine.wav',Praeludium,Fs); % Write the audio
    case 3
			clear all;
			Fs=8000;
			dur = 0.3*Fs;
      z = zeros(1,200);
      C5 = sin(2*pi* [1:dur]/Fs * 523); %% C5
			C4 = sin(2*pi* [1:dur]/Fs * 261); %% C4
			B4 = sin(2*pi* [1:dur]/Fs * 493); %% B4
			G4 = sin(2*pi* [1:dur]/Fs * 391); %% G4
			ThousandMiles = [C5 z C4 z C5 z B4 z C4 z B4 z G4];
			soundsc(ThousandMiles,Fs)
			spectrogram(ThousandMiles,256,250,256,Fs,'yaxis');title('Spectrogram Carlton by MRA')
			audiowrite('ThousandMiles.wav',ThousandMiles,Fs); % Write the audio
	end
end
