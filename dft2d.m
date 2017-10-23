function output_img = dft2d( input_img,flag )
    if flag == 1
        input_img = conj(input_img);
    end
    [M,N] = size(input_img);
    output_img = zeros(M,N);
    for v=1:M
        % row operation
        row_item = input_img(v,:);
        dft_row = dft1d(row_item);
        output_img(v,:) = dft_row;
    end
    for u=1:N
        col_item = output_img(:,u);
        dft_col = dft1d(col_item);
        output_img(:,u) = dft_col;
    end
    if flag == 1
        output_img = output_img / (M*N);
        output_img = conj(output_img);
    end
end

