function FrequencyData = myFFT1d(input_vector)
    % 把输入向量0扩展到2的n次方
    size = length(input_vector);
    n = floor(log2(size));
    if 2^n < size
        n = n+1;
    end
    M = 2^n;
    f = zeros(1,M);
    f(1:size) = input_vector;
 
    f1 = f;
    for i = 1:M
        index = getBitreversal(n,i - 1);
        f(i) = f1(index + 1);
    end

    REX = f;
    IMX = zeros(1,M);
    i = 0;% T Loop for log2(M)
    j = 0; %T loop for leach sub-DFT
    k = 0; %T Loop for each butterfly
    for i = 0 : n - 1
        lenNum = 0; 
        for j = 0 : 2^(n - (i + 1)) - 1
            for k = 0 : 2^i - 1
                R1 = REX(lenNum + 2^i + 1) * cos(2*pi*k*2^(n - (i + 1))/M);
                R2 = IMX(lenNum + 2^i + 1) * sin(2*pi*k*2^(n - (i + 1))/M);
                T1 = REX(lenNum + 2^i + 1) * sin(2*pi*k*2^(n - (i + 1))/M);
                T2 = IMX(lenNum + 2^i + 1) * cos(2*pi*k*2^(n - (i + 1))/M);
                REX(lenNum + 2^i + 1) = REX(lenNum + 1) - R1 - R2;
                IMX(lenNum + 2^i + 1) = IMX(lenNum + 1)  + T1 - T2;
                REX(lenNum + 1) = REX(lenNum + 1) + R1 + R2;
                IMX(lenNum + 1) = IMX(lenNum + 1) - T1 + T2 ;

                lenNum = lenNum + 1;
               endNum = lenNum + 2^i;    
            end
            lenNum = endNum;
        end
    end
    FrequencyData = REX + IMX;

end

