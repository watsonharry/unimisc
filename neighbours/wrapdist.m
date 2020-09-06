function r = wrapdist(pos)

N = size(pos,2);
s = zeros(3,N);
r = zeros(1,N);

for index = 1:N
    
    s(1,:) = abs(pos(1,:) - pos(1,index));
    s(2,:) = abs(pos(2,:) - pos(2,index));
    s(3,:) = abs(pos(3,:) - pos(3,index));
    off = s > 0.5;
    s(off) = 1 - s(off);
    d = s(1,:).^2 + s(2,:).^2 + s(3,:).^2;
    d(1,index)=2;
    [~,r(index)] = min(d);
    
end
end