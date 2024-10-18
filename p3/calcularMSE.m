function mse = calcularMSE(videoOriginal, videoDecodificado)
    % Obtener dimensiones de los videos
    orginal = read(videoOriginal);
    decod = read(videoDecodificado);
    [N, M, numComponents, numFrames] = size(orginal);

    % Inicializar suma del error cuadrático
    sumSquaredError = 0;

    % Calcular MSE
    for frame = 1:numFrames
        for compo = 1:numComponents
            for fila = 1:N
                for colum = 1:M
                    sumSquaredError = sumSquaredError + (double (orginal(fila, colum, compo, frame) - decod(fila, colum, compo, frame) )^2 );
                end
            end
        end
    end

    mse = (1/(N* M* numComponents* numFrames)) * sumSquaredError;   

end