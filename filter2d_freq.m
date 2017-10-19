function output_img = filter2d_freq(input_img, filter)
    [M.N] = size(input_img);
    [A,B] = size(filter);
    % 根据原图和滤波器大小求出填充参数P,Q
    P = M+A-1;
    Q = N+B-1;
    % 对f添加必要数目的0，形成大小为P*Q的填充后的图像
    
    %中心化
    
    %计算输入图像中心化后的DFT -> F(u,v)
    
    %生成一个滤波器函数H(u,v)，大小为P*Q，中心在（P/2，Q/2)处
    
    %用阵列相乘形成乘积G
    
    %傅里叶逆变换求出处理后的图像
    
    %为忽略由于计算不准确导致的寄生复分量，选择了实部
    %此时得到填充后的阵列g(x,y)
    
    % 从g(x,y)的左上象限提取M*N区域，得到最终处理结果g(x,y)
    
end