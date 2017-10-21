function FrequencyData = myFFT1d(input_vector)
    % 把输入向量0扩展到2的n次方
    size = length(input_vector);
    n = floor(log2(size));
    if 2^n < size
        n = n+1;
    end
    M = 2^n;
    f = zeros(1,M);
    f(1:size) = input_vector;
 
    f1 = f;
    for i = 1:M
        index = getBitreversal(n,i - 1);
        f(i) = f1(index + 1);
    end

    f = double(f);
    % 最外层循环：共有log2(M)次向上的处理
    for u = 1 : n
        pos = 0;
         % 中间层循环: 每一次向上合成得到的分组个数
        for g = 1 : 2^(n - u)
            % 最内层循环：合成每个分组需要的蝶形计算次数
            for b = 1 : 2^(u-1)
                W = exp((-j)*(2*pi*(b-1)*2^(n - u)/M));
                % 奇数项旋转因子W两个重要参数(u,M)
                % 每次降阶，M的值都要减半，相当于在u阶时，M->M/2^(n-u)
                % 组内每次蝶形运算，旋转因子指数都+1: *(b-1)
                even = f(pos + 1);
                odd = f(pos + 2^(u-1) + 1);
                f(pos + 1) = even + odd * W;
                f(pos + 2^(u-1) + 1) = even - odd * W;
                
                pos = pos + 1;
                newpos = pos + 2^(u-1);    
            end
            pos = newpos; % 转到下一组
        end
    end
    FrequencyData = f;
end

