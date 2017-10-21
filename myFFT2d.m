function output_img = myFFT2d( input_img,flag )
    [m,n] = size(input_img);
    % 0扩展到2的n次方
    [M,N] = paddingSize(input_img);
    output_img = zeros(M,N);
    item = zeros(M,N);
    item(1:m,1:n) = input_img;
    input_img = item;
    % 判断正反变换
    if flag == 1
        input_img = conj(input_img);
    end

    for v=1:M
        % row operation
        row_item = input_img(v,:);
        dft_row = myFFT1d(row_item);
        output_img(v,:) = dft_row;
    end
    for u=1:N
        col_item = output_img(:,u);
        dft_col = myFFT1d(col_item);
        output_img(:,u) = dft_col;
    end
    if flag == 1
        output_img = conj(output_img);
    end
end

