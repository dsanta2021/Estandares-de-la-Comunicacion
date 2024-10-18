% Entrada:
% --------
% 'Pi' es el vector de probabilidades de los símbolos (ej. Pi=[0.4 0.2 0.2 0.1 0.1])
% También puede introducirse Pi como vector de ocurrencias de cada símbolo (ej. Pi=[45 5 6 80 23])
%
% Salida:
% -------
% 'codigo' matriz con el código para cada símbolo en formato cadena de
% ceros y unos.
% 'compresion' variable que almacena la tasa de compresión del código.
% -------------------------------------------------------------------------
function [codigo, compresion] = huffman (Pi)
    Pi = Pi(:)/sum(Pi); % Normaliza las probabilidades y las coloca como vector columna.
    arbol = huff(Pi);
    codigo = char(asignar_codigos(arbol, length(Pi)));
    compresion = ceil(log(length(Pi))/log(2))/ (sum(codigo' ~= ' ')*Pi);
end

function y = asignar_codigos(arbol, n_simbolos)
    % Autor: Herminio Noguera Ruiz.
    % Asignación de códigos a cada símbolo.
    global y
    y = cell(n_simbolos, 1);
    asignar_codigos2(arbol, []);
end

function asignar_codigos2(arbol, dum)
    % Autor: Herminio Noguera Ruiz.
    % Función llamada por asignar_codigos.
    % Usa recursividad para ir asignando códigos.
    global y
    if isa(arbol, 'cell')
     asignar_codigos2(arbol{1}, [dum 0]);
     asignar_codigos2(arbol{2}, [dum 1]);
    else
     y{arbol} = setstr(48+dum);
    end
end


function arbol = huff(Pi)
    % -------------------------------------------------------------------------
    % Autor: Herminio Noguera Ruiz.
    % Esta función crea el árbol de Huffman.
    % Simula una estructura de árbol usando estructura de celdas anidadas.
    %
    % 'Pi' es el vector con las probabilidades o número de apariencias de los
    % simbolos fuente.
    % 'arbol' es el árbol de Huffman.
    % -------------------------------------------------------------------------
    arbol = cell(length(Pi),1); % Genera la estructura de celdas.
    for i = 1:length(Pi) % Rellena las celdas según el número
     arbol{i} = i; % de símbolos en el alfabeto.
    end
    while size(arbol)-2 % Se repite hasta que solo haya dos ramas.
        [Pi,i] = sort(Pi); % Ordena las probabilidades de forma ascendente.
        arbol = arbol(i); % Reordena el árbol.
        arbol{2} = {arbol{1},arbol{2}}; % Une las ramas 1 y 2
         arbol(1)=[]; % y reduce.
        Pi(2) = Pi(1)+Pi(2); % Une probabilidades.
         Pi(1)=[];
    end
end