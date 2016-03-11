opts = bodeoptions;
opts.MagUnits = 'abs';
opts.Title.FontSize = 14;
opts.XLabel.FontSize = 14;
opts.YLabel.FontSize = 14;
opts.Grid = 'on';

num = [1];
den = [0.05 1.1 2.05 1];
G = tf(num,den,'InputDelay',0)

Ti = 0.25

numC = [1*Ti 1];
denC = [1];
GC = tf(numC,denC,'InputDelay',0)

Gk = GC*G

bodeplot(G, opts)