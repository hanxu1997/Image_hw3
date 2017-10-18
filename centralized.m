function output_img = centralized( input_img )
    [M,N] = size(input_img);
    output_img=zeros(M,N);
    for x=1:M
        for y=1:N
            output_img(x,y) = input_img(x,y)*(-1)^(x+y);
        end
    end
end

