function Codigos = asignarCodigosHuffman(listaSimbolos, listaProbabilidades)
    % Verificar que las longitudes de las listas son iguales
    if length(listaSimbolos) ~= length(listaProbabilidades)
        error('Las longitudes de listaSimbolos y listaProbabilidades deben ser iguales.');
    end

    % Crear un vector para almacenar los códigos Huffman
    Codigos = strings(size(listaSimbolos));

    % Crear una estructura para almacenar la información de cada símbolo
    symbolsInfo = struct('symbol', num2cell(listaSimbolos), 'probability', num2cell(listaProbabilidades));

    % Ordenar symbolsInfo por probabilidades en orden ascendente
    [~, indices] = sort(cell2mat({symbolsInfo.probability}));
    symbolsInfo = symbolsInfo(indices);

    % Crear códigos Huffman
    for i = 1:length(listaSimbolos)
        symbolsInfo(i).code = huffmanCode(i, length(listaSimbolos));
        Codigos(i) = symbolsInfo(i).code;
    end
end

function code = huffmanCode(index, totalSymbols)
    % Generar código Huffman para el símbolo en la posición index
    code = string(dec2bin(index - 1, ceil(log2(totalSymbols))));
end

