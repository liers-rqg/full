function[xm,fv]=PSO(fitness,N,c1,c2,w,M,D)
%%%%%%������ʼ������%%%%%%
%c1ѧϰ����1
%c2ѧϰ����2
%w����Ȩ��
%M����������
%D�����ռ�ά��
%��ʼ��Ⱥ�������Ŀ
%%%%%��ʼ��Ⱥ��ĸ���%%%%%
format long;
for i=1:N
    for j=1:D
        x(i,j)=randn;
        y(i,j)=randn;
    end
end
%%%%%%�ȼ������������Ӧ�ȣ���ʼ��Pi��Pg%%%%%%%
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
%%%%%������ѭ��%%%%%
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
%%%%%%%����������
disp('*******************')
disp('Ŀ�꺯��ȡ��Сֵʱ���Ա�����')
xm=pg'
disp('Ŀ�꺯����Сֵ��')
fv=fitness(pg)
disp('**************************************')