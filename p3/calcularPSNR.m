function psnr = calcularPSNR(bits, mse)

    psnr = 10*log10(((2^bits - 18)^2) / (mse));

end

