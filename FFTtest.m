PointNum = 256;
PointBitNum = 8;
 
fs = 1024*2;
t = 0:1:PointNum - 1;
%for u = 1:1:PointNum;
sampletab = cos(2*pi*543*t/fs) + cos(2*pi*100*t/fs) + 0.2 + cos(2*pi*857*t/fs) + cos(2*pi*222*t/fs);
%end
zeros(1,PointNum);
sampletab1 = sampletab;
index = 0;
for i = 1:PointNum
    k = i - 1;
    index = bitreverse(PointBitNum,i - 1);
    sampletab(i) = sampletab1(index + 1);
end
%sampletab1
%sampletab
REX = sampletab;
IMX = zeros(1,PointNum);
i = 0;% T Loop for Log2N stages
j = 0; %T loop for leach sub-DFT
k = 0; %T Loop for each butterfly
stages = log2(PointNum);
for i = 0 : stages - 1
    lenNum = 0; 
    for j = 0 : 2^(stages - (i + 1)) - 1
        for k = 0 : 2^i - 1
            R1 = REX(lenNum + 2^i + 1) * cos(2*pi*k*2^(stages - (i + 1))/PointNum);
            R2 = IMX(lenNum + 2^i + 1) * sin(2*pi*k*2^(stages - (i + 1))/PointNum);
            T1 = REX(lenNum + 2^i + 1) * sin(2*pi*k*2^(stages - (i + 1))/PointNum);
            T2 = IMX(lenNum + 2^i + 1) * cos(2*pi*k*2^(stages - (i + 1))/PointNum);
            REX(lenNum + 2^i + 1) = REX(lenNum + 1) - R1 - R2;
            IMX(lenNum + 2^i + 1) = IMX(lenNum + 1)  + T1 - T2;
            REX(lenNum + 1) = REX(lenNum + 1) + R1 + R2;
            IMX(lenNum + 1) = IMX(lenNum + 1) - T1 + T2 ;
 
            lenNum = lenNum + 1;
           endNum = lenNum + 2^i;    
        end
        lenNum = endNum;
    end
end
 
 
subplot(3,1,1);
fft(sampletab1, PointNum);
x1 = abs(fft(sampletab1, PointNum));
plot([0 : PointNum/2 - 1], x1(1:PointNum/2));
grid on
subplot(3,1,2);
% [REX IMX]
% am = sqrt(abs(REX.*REX) + abs(IMX.*IMX));
am = REX + IMX;
am = abs(am);
 
plot(0:1:PointNum/2 - 1, am(1:PointNum/2));
grid on
 
