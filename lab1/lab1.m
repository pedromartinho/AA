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
 
