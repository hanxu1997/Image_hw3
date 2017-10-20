function output_img = scaling(input_img)  
    if isa(input_img,'double')&&(max(input_img(:))>1||min(input_img(:))<0)  
        input_img=mat2gray(input_img);   
    end
    %if the class of input_img is double and it's not in the range [0,1],scale input_img to the range[0,1]
    output_img=im2uint8(mat2gray(double(input_img)));   
end  
      