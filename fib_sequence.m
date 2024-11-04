function [num] = fib_sequence(n)

num=1;
preNum=0;
if (n==0)
    num=0;
end

for i=2:1:n
    current_num=num+preNum;
    preNum=num;
    num=current_num;
end
end
