figure
v = 0:5;
u = 1:6;
for i= 1:6
    u(i) = pol(v(i));
end

plot(v, u)
