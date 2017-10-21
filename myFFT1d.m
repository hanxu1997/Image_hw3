function FrequencyData = myFFT1d(input_vector)
    % ����������0��չ��2��n�η�
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
    % �����ѭ��������log2(M)�����ϵĴ���
    for u = 1 : n
        pos = 0;
         % �м��ѭ��: ÿһ�����Ϻϳɵõ��ķ������
        for g = 1 : 2^(n - u)
            % ���ڲ�ѭ�����ϳ�ÿ��������Ҫ�ĵ��μ������
            for b = 1 : 2^(u-1)
                W = exp((-j)*(2*pi*(b-1)*2^(n - u)/M));
                % ��������ת����W������Ҫ����(u,M)
                % ÿ�ν��ף�M��ֵ��Ҫ���룬�൱����u��ʱ��M->M/2^(n-u)
                % ����ÿ�ε������㣬��ת����ָ����+1: *(b-1)
                even = f(pos + 1);
                odd = f(pos + 2^(u-1) + 1);
                f(pos + 1) = even + odd * W;
                f(pos + 2^(u-1) + 1) = even - odd * W;
                
                pos = pos + 1;
                newpos = pos + 2^(u-1);    
            end
            pos = newpos; % ת����һ��
        end
    end
    FrequencyData = f;
end

