function output_img = dft2d( input_img,flag )
    if flag == 1
        input_img = conj(input_img);
    end
    [M,N] = size(input_img);
    output_img = zeros(M,N);
    for v=0:M-1
        % row operation
        row_item = input_img(v+1,:);
        dft_row = dft1d(row_item);
        output_img(v+1,:) = dft_row;
    end
    for u=0:N-1
        col_item = output_img(:,u+1);
        dft_col = dft1d(col_item);
        output_img(:,u+1) = dft_col;
    end
    if flag == 1
        output_img = conj(output_img);
    end
end

