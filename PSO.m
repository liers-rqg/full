function[xm,fv]=PSO(fitness,N,c1,c2,w,M,D)
%%%%%%给定初始化条件%%%%%%
%c1学习因子1
%c2学习因子2
%w惯性权重
%M最大迭代次数
%D搜索空间维度
%初始化群体个体数目
%%%%%初始化群体的个体%%%%%
format long;
for i=1:N
    for j=1:D
        x(i,j)=randn;
        y(i,j)=randn;
    end
end
%%%%%%先计算各个粒子适应度，初始化Pi和Pg%%%%%%%
for i=1:N
    p(i)=fitness(x(i,:));
    y(i,:)=x(i,:);
end
pg=x(N,:);
for i=1:(N-1)
    if fitness(x(i,:))<fitness(pg)
        pg=x(i,:)
    end
end
%%%%%进入主循环%%%%%
for t=i:M
    for i=1:N
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
        x(i,:)=x(i,:)+v(i,:);
        if fitness(x(i,:))<p(i)
            p(i)=fitness(x(i,:))
            y(i,:)=x(i,:)
        end
    end
    Pbest(t)=fitness(pg)
end
%%%%%%%给出计算结果
disp('*******************')
disp('目标函数取最小值时的自变量：')
xm=pg'
disp('目标函数最小值：')
fv=fitness(pg)
disp('**************************************')