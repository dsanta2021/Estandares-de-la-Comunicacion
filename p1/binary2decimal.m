% Función para convertir un código binario a decimal
function decimalValues = binary2decimal(codigosBinarios)
    % Convierte códigos binarios a valores decimales

    numCodigos = length(codigosBinarios);
    decimalValues = zeros(1, numCodigos);

    for i = 1:numCodigos
        decimalValues(i) = bin2dec(codigosBinarios{i});
    end
end
