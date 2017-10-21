function output_img = myFFT2d( input_img,flag )
    % 0��չ��2��n�η�
    [M,N] = paddingSize(input_img);
    m = floor(log2(M));
    output_img = zeros(M,N);
    
    % �ж������任
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

