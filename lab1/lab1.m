%% Alinea 3.a.
% Análise do gráfico obtido
L1 = load('data/data1.mat')
aux = ones(1,20)'
X = [aux L1.x]
Y = [aux L1.y]
beta = inv(X'*X)*X'*Y
x = (-1:0.1:0.9)'
plot(L1.x,L1.y,'*')
hold on
plot(x,[aux x]*beta(:,2))
hold off

%% Alinea 3.b.
% beta são os coeficientes e o SEE é o erro obtido
f = [aux x]*beta(:,2)
y = sort(L1.y)
SSE = sum((y-f).^2)

%% Alinea 4.a.
L2 = load('data/data2.mat')
aux2 = ones(1,50)'
X2 = [aux2 L2.x L2.x.^2]
Y2 = [aux2 L2.y L2.y.^2]
beta2 = inv(X2'*X2)*X2'*Y2
x2 = (-1:0.04:0.96)'
plot(L2.x,L2.y,'*')
hold on
plot(x2,[aux2 x2 x2.^2]*beta2(:,3))
hold off

%% Alinea 4.b.
% beta são os coeficientes e o SEE é o erro obtido
f2 = [aux2 x2 x2.^2]*beta2(:,3)
y2 = sort(L2.y)
SSE2 = sum((y2-f2).^2)

%% Alinea 5.a.
L2a = load('data/data2a.mat')
aux2a = ones(1,51)'
X2a = [aux2a L2a.x L2a.x.^2]
Y2a = [aux2a L2a.y L2a.y.^2]
beta2a = inv(X2a'*X2a)*X2a'*Y2a
x2a = (-1:0.04:1.0)'
plot(L2a.x,L2a.y,'*')
hold on
plot(x2a,[aux2a x2a x2a.^2]*beta2a(:,3))
hold off

%% Alinea 5.b.
% beta são os coeficientes e o SEE é o erro obtido
f2a = [aux2a x2a x2a.^2]*beta2a(:,3)
y2a = sort(L2a.y)
SSE2a = sum((y2a-f2a).^2)

% 2 - Regularization

%% 2.
L3 = load('data/data3.mat')
[B,FitInfo] = lasso(L3.X,L3.Y)
lassoPlot(B,FitInfo,'PlotType','Lambda','XScale','log')
lgd = legend('\beta_{1}','\beta_{2}','\beta_{3}')
hold on
p=3
p = p+1
[n,m] = size(L3.X)
X = ones(n,p)
Y = L3.Y

for i=1:n
    for j=1:p
        X(i,j) = L3.X(i,1).^(j-1);
    end
end

Beta = inv(X'*X)*X'*Y

z = (-1:0.04:0.96)
%z = (-1:0.1:0.9); 

Z = ones(n,p)
z=z'
for i=1:n
    for j=1:p
        Z(i,j) = z(i,1).^(j-1)
    end
end

plot([0.002,0.002,0.002],Beta(2:4),'*')
hold off

% 3. On paper

% 4.

lab = FitInfo.Lambda(51:100)
I = eye(50)
beta2a = inv(X'*X+lab')*X'*Y
