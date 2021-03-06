function output_vector = dft1d( input_vector)
    M = length(input_vector);
    output_vector = zeros(1,M);
    input_vector = double(input_vector);
    for u = 0:M-1
        for x = 0:M-1
            f_x = input_vector(x+1);
            item = (-1i)*2*pi*u*x/M;
            Wn = exp(item);
            output_vector(u+1) =  output_vector(u+1) + f_x * Wn; 
        end
    end
    %output_vector = output_vector/M;
    % 删除此句结果和FFT结果一致
end

