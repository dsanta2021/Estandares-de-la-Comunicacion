close all, clear all;
%% Indique los nombres de archivo tanto del audio a evaluar como del audio de referencia.
ref_audio = 'speech.wav';
ev_audio = 'speech_LQ.wav';

score2 = prd(ref_audio,ev_audio);