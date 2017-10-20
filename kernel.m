function y = kernel( x,lam )
%KERNEL Summary of this function goes here
%   Detailed explanation goes here
if(x<=lam)
    y=1;
else
    y=0;
end
end

