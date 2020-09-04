tic
tiempo = -0.5:1/1e4:0.5;frecuenciaInformacion = 10;
frecuenciaModulacion = 1e3;

informacion = sinc(2*pi*tiempo*frecuenciaInformacion);
portadora = cos(2*pi*tiempo*frecuenciaModulacion);

senalModulada = portadora.*informacion;

espectroInformacion = fft(informacion);
espectroPortadora = fft(portadora);
espectroSenal = fft(senalModulada);


senalDemodulada = senalModulada.*portadora;
espectroSenalDemodulada = fft(senalDemodulada);

figure(1)
subplot(3,3,1)
plot(abs(espectroInformacion)); hold on; title('Señal de Información en Frecuencia')
hold off; xlim([0 100]);
subplot(3,3,2)
plot(abs(espectroSenal));
xlim([900 1100]); hold off; title('Señal Modulada')
subplot(3,3,3)
plot(abs(espectroSenalDemodulada));title('Señal Demodulacion')
xlim([1900 2100]); hold off;
subplot(3,3,4)
plot(tiempo, informacion)
subplot(3,3,5)
plot(tiempo, senalModulada)
subplot(3,3,6)
plot(tiempo, senalDemodulada)
subplot(3,3,7:9)
plot(abs(espectroSenalDemodulada));title('Señal Demodulacion');
xlim([0 5000])
figure(2)
lowpass(senalDemodulada,0.25);


toc