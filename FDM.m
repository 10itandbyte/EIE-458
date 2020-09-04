tic
tiempo = -0.5:1/1e4:0.5;frecuenciaInformacion = 10;
frecuenciaModulacion = 1e3 ;frecuenciaModulacionDos = 1.09e3;...
    frecuenciaModulacionTres = 1.18e3;


informacion = sinc(2*pi*tiempo*frecuenciaInformacion);
informacionDos = sinc(2*pi*tiempo*frecuenciaInformacion);
informacionTres = sinc(2*pi*tiempo*frecuenciaInformacion);

portadora = cos(2*pi*tiempo*frecuenciaModulacion);
portadoraDos = cos(2*pi*tiempo*frecuenciaModulacionDos);
portadoraTres = cos(2*pi*tiempo*frecuenciaModulacionTres);

senalModulada = portadora.*informacion;
senalModuladaDos = portadoraDos.*informacionDos;
senalModuladaTres = portadoraTres.*informacionTres;

espectroInformacion = fft(informacion);
espectroPortadora = fft(portadora);

espectroSenal = fft(senalModulada);
espectroSenalDos = fft(senalModuladaDos);
espectroSenalTres = fft(senalModuladaTres);

figure(1)
subplot(1,2,1)
plot(abs(espectroInformacion)); hold on; xlim ([0 100])
title('Señal frecuencia base')
subplot(1,2,2)
plot(abs(espectroSenal)); hold on;
plot(abs(espectroSenalDos)); hold on;
plot(abs(espectroSenalTres)); hold off; xlim([800 1400]);
title('Señales multiplexadas')


toc