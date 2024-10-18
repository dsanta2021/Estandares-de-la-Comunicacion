% Función para calcular la entropía de una imagen en escala de grises
function entropia = CalculaEntropia(imagen)
    % Obtener histograma de la imagen
    histograma = imhist(imagen);
    
    % Calcular la probabilidad de cada nivel
    probabilidad = histograma / sum(histograma);
    
    % Eliminar entradas con probabilidad cero
    probabilidad = probabilidad(probabilidad > 0);
    
    % Calcular la entropía (Fórumla tema 2)
    entropia = -sum(probabilidad .* log2(probabilidad));
end
