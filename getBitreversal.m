function reversal_result = getBitreversal(digit, num)
    bitnum = dec2bin(num,digit);
    temp = bitnum;
    for i = 1:digit
        item = temp(digit-i+1);
        bitnum(i) = item;
    end
    reversal_result = bin2dec(bitnum);
end