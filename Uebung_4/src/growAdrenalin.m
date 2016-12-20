a    = [0.2 0.1];
b    = 0.025;
f0   = 1;
xt   = 1;
res  = zeros((48/0.01), 2);
    
for i=1:1:2
for t=1:0.01:48
    
    % growth
    ft = a(1) + b * (cos(pi*(t-8)/12));
    xt = (xt + ft) - (a * xt);    
    res(t,i) = xt(1,i);
end

end
