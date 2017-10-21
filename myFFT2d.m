function output_img = myFFT2d( input_img,flag )
    % 0扩展到2的n次方
    [M,N] = size(input_img);
    m = floor(log2(M));
    if 2^m < M
        m = m+1;
    end
    M = 2^m;
    n = floor(log2(N));
    if 2^n < N
        n = n+1;
    end
    N = 2^n;
    output_img = zeros(M,N);
    
    % 判断正反变换
    if flag == 1
        input_img = conj(input_img);
    end

    for v=0:M-1
        % row operation
        row_item = input_img(v+1,:);
        dft_row = myFFT1d(row_item);
        output_img(v+1,:) = dft_row;
    end
    for u=0:N-1
        col_item = output_img(:,u+1);
        dft_col = myFFT1d(col_item);
        output_img(:,u+1) = dft_col;
    end
    if flag == 1
        output_img = conj(output_img);
    end
end

