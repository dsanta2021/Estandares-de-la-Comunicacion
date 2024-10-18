function [score, DMOS] = prd(ref_audio, ev_audio)
%% Carga de los archivos de audio.
[reference, fs1] = audioread(ref_audio);
[degraded, fs2] = audioread(ev_audio);
reference = abs(reference);
degraded = abs(degraded);

%% Almacenamiento de la longitud de la grabación.
ref_len = length(reference)/fs1;

%% Remuestreo para poder realizar la comparativa con igual fs.
if fs1~=fs2
    degraded = resample(degraded,fs1,fs2);
end
%% Obtención del PRD
score = 100 * sqrt(sum(((reference - degraded).^2))/sum(reference.^2));

m = (1-5)/100;
n = 5;
DMOS = m * score + n;

end

 