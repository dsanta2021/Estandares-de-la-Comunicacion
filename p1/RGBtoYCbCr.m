% Función para obtener las componentes Y, Cb y Cr de una imagen
function [YCbCr] = RGBtoYCbCr(RGB)
    % Leer la imagen
    img = imread(RGB);
    RGB = double(RGB);
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);

    % Aplicar las expresiones de conversión 
    Y = 0.2126 * R + 0.7152 * G + 0.0722 * B + 16;
    Cb = 0.5389 * (B - Y) + 128;
    Cr = 0.6350 * (R - Y) + 128;

    % Combinar las tres componentes en un solo vector de imágenes 1x3
    YCbCr = uint8(cat(3, Y, Cb, Cr));

    % Mostrar la imagen original y las componentes Y, Cb, Cr en una única figura
    figure;
    subplot(2, 2, 1), imshow(img), title('Imagen Original');
    subplot(2, 2, 2), imshow(Y), title('Y Component');
    subplot(2, 2, 3), imshow(uint8(Cb)), title('Cb Component');
    subplot(2, 2, 4), imshow(uint8(Cr)), title('Cr Component');
end

