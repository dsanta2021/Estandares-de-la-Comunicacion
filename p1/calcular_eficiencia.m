% Función para calcular el rendimiento del codificador
function eficiencia = calcular_eficiencia(entropia, listaProbabilidades, codigosHuffman)
    % Calcular la longitud media de símbolo (L)
    numCodigos = length(codigosHuffman);
    longitudesCodigos = zeros(1, numCodigos);

    for i = 1:numCodigos
        longitudesCodigos(i) = length(codigosHuffman(i));
    end

    longitudMedia = sum(longitudesCodigos .* listaProbabilidades);

    % Calcular la eficiencia mediante la relación entropía/L
    eficiencia = entropia / longitudMedia;
end
