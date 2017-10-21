function output_img = filter2d_freq(input_img, filter)
    [M,N] = size(input_img);
    [A,B] = size(filter);
    filtersum = sum(sum(filter)); 
    if filtersum ~= 0
        filter = filter/filtersum;
    end
    
    % 根据原图和滤波器大小求出填充参数P,Q
    P = M+A-1;
    Q = N+B-1;
    % 对f添加必要数目的0，形成大小为P*Q的填充后的图像
    padding_f = zeros(P,Q);
    padding_f(1:M,1:N) = input_img;
    %中心化
    padding_f = centralized(padding_f);
    %计算输入图像中心化后的DFT -> F(u,v)
%     F = fft2(padding_f);
    F = dft2d(padding_f,0);
    %生成一个滤波器函数H(u,v)，大小为P*Q，中心在（P/2，Q/2)处
    padding_h = zeros(P,Q);
    padding_h(1:A,1:B) = filter;
    padding_h = centralized(padding_h);
%     H = fft2(padding_h);
    H = dft2d(padding_h,0);
    
    %用阵列相乘形成乘积G
    G = F.* H;
    %傅里叶逆变换求出处理后的图像
%     g_p = ifft2(G);
    g_p = dft2d(G,1);
    %为忽略由于计算不准确导致的寄生复分量，选择了实部
    g_p = real(g_p);
    %此时得到填充后的阵列g_p(x,y)
    g_p = centralized(g_p);
    % 从g(x,y)的左上象限提取M*N区域，得到最终处理结果g(x,y)
    % 对不同尺寸的滤波器要最终结果要进行相应平移，不能直接从(1,1)开始取
    start_posx = floor(A/2)+1;
    start_posy = floor(B/2)+1;
    output_img = g_p(start_posx:start_posx+M-1,start_posy:start_posy+N-1);
end