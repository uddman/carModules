opts = bodeoptions;
opts.MagUnits = 'abs';
opts.Title.FontSize = 14;
opts.XLabel.FontSize = 14;
opts.YLabel.FontSize = 14;
opts.Grid = 'on';
%parametrar
K = 1.4378
Ti = 15.24

%Car model
numCar = [1 0];
denCar = [0.3478 1];
GCar = tf(numCar,denCar,'InputDelay',0.4425)

%Controler model
numCon = [K*Ti + Ti];
denCon = [1];
GCon = tf(numCon,denCon,'InputDelay',0)

%Kretsverfring
Gkrets = GCar*GCon;

bodeplot(Gkrets,opts);1
[amplitudeMargin fasMargin wpi wc] = margin(Gkrets)
e0 = 1/(1 + dcgain(Gkrets))

%dcgain(G);



%bodeplot(PSystem, PDist, opts)
%bodeplot(GCar,opts);
%
% Useful commads
%freqWc = 0;
%freqWPi = 0.5;
%abs(freqresp(P, freqWPi));
%angle(freqresp(P, freqWc));

% useful
%[amplitudeMargin fasMargin wc wsj] = margin(PSystem)
%poles = eig(PSystem);
%dcgain(PSystem);
%figure(2);
%sgrid
%pzmap(PSystem)
%grid on