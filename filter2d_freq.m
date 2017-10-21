function output_img = filter2d_freq(input_img, filter)
    [M,N] = size(input_img);
    [A,B] = size(filter);
    filtersum = sum(sum(filter)); 
    if filtersum ~= 0
        filter = filter/filtersum;
    end
    
    % ����ԭͼ���˲�����С���������P,Q
    P = M+A-1;
    Q = N+B-1;
    % ��f��ӱ�Ҫ��Ŀ��0���γɴ�СΪP*Q�������ͼ��
    padding_f = zeros(P,Q);
    padding_f(1:M,1:N) = input_img;
    %���Ļ�
    padding_f = centralized(padding_f);
    %��������ͼ�����Ļ����DFT -> F(u,v)
%     F = fft2(padding_f);
    F = dft2d(padding_f,0);
    %����һ���˲�������H(u,v)����СΪP*Q�������ڣ�P/2��Q/2)��
    padding_h = zeros(P,Q);
    padding_h(1:A,1:B) = filter;
    padding_h = centralized(padding_h);
%     H = fft2(padding_h);
    H = dft2d(padding_h,0);
    
    %����������γɳ˻�G
    G = F.* H;
    %����Ҷ��任���������ͼ��
%     g_p = ifft2(G);
    g_p = dft2d(G,1);
    %Ϊ�������ڼ��㲻׼ȷ���µļ�����������ѡ����ʵ��
    g_p = real(g_p);
    %��ʱ�õ����������g_p(x,y)
    g_p = centralized(g_p);
    % ��g(x,y)������������ȡM*N���򣬵õ����մ�����g(x,y)
    % �Բ�ͬ�ߴ���˲���Ҫ���ս��Ҫ������Ӧƽ�ƣ�����ֱ�Ӵ�(1,1)��ʼȡ
    start_posx = floor(A/2)+1;
    start_posy = floor(B/2)+1;
    output_img = g_p(start_posx:start_posx+M-1,start_posy:start_posy+N-1);
end