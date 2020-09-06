%% Stochastic Methods | Harry Watson | ppyhw2


%% TASK 4.1 GENERATING DISTRIBUTIONS

clc
close all
clear

r = rand(1,1000); %generate 1000 random numbers between 0 and 1
histogram(r,100) %produce a historgram of the numbers

i = linspace(0,1,length(r)); %generate array of linearly increasing values
for n = 1:length(r)
    if r(n) < i(n)
        r(n) = i(n); %if corresponding random number is less than, equalise 
    end
end

figure
histogram(r,100)

%% TASK 4.2 MONTE CARLO INTEGRATION

clc
close all
clear

f1=@(x)exp(-abs(x)).*cos(x); %function to be integrated

x = linspace(-pi/2,pi/2,10000); %x value array

%random scatter plot points
rx = pi*(rand(1,length(x))-0.5);
ry = rand(1,length(x));

%give visual representation
scatter(rx,ry,'y*')
hold on
plot(x,f1(x))
xlim([-pi/2 pi/2])
ylim([0 1])

%monte carlo integration
Nu = 0; %variable storing number of points under curve

for n = 1:length(x)
    if f1(rx(n)) > ry(n)
        Nu = Nu + 1;
    end
end

intmc = (Nu/length(x))*pi;

%In-built functional evaluation
intf = integral(f1,-pi/2,pi/2);

%% TASK 4.3 VOLUME SAMPLING

clc
close all
clear

p = 1000;

R = 10;
r = 5;
rp = (R-r)/2 + r;
u = linspace(0,2*pi,p);
v = linspace(0,2*pi,p);

[u,v] = meshgrid(u,v);

x = (rp+(rp-r).*cos(v)).*cos(u);
y = (rp+(rp-r).*cos(v)).*sin(u);
z = r.*sin(v);

rx = 20*(rand(1,p)-0.5);
ry = 20*(rand(1,p)-0.5);
rz = 10*(rand(1,p)-0.5);

%visualise
mesh(x,y,z)
view(45,65)
hold on
scatter3(rx,ry,rz)

%monte carlo integration
Nu = 0;
f = @(x,y,z) (sqrt(x.^2+y.^2)-(R+r)/2).^2+z.^2;
result = f(rx,ry,rz)-((R-r)/2)^2;
idxs = result <= 0;
Nu = sum(idxs);
intmc = (Nu/p)*20*20*10;