function [paddingM, paddingN] = paddingSize(input_img)
    % ��ԭͼ��С�����չΪ2���ݴη���ĳߴ�
    [M,N] = size(input_img);
    m = floor(log2(M));
    if 2^m < M
        m = m+1;
    end
    paddingM = 2^m;
    n = floor(log2(N));
    if 2^n < N
        n = n+1;
    end
    paddingN = 2^n;
end

