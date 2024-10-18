function codHuff = CalcularCodHuffman(prob)
    if prob(1) > prob(2)
        codHuff = ["1", "0"];
    else
        codHuff = ["0", "1"];
    end
end
