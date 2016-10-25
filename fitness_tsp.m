% Funkcia na vypocet ceskovej vzdialenosti medzi mestami
% Pop - populacia s retazcami (postupnost navstivenych miest)
% M - matica vzdialenosti 

function vzdialenost=fitness_tsp(Pop,M)

[n,m]=size(Pop);
vzdialenost=zeros(1,n);
for j=1:n,
    r=1; s=Pop(j,1)+1;
    sumvzdial=M(r,s);
    for k=1:m-1,
        r=Pop(j,k)+1; s=Pop(j,k+1)+1;
        sumvzdial=sumvzdial+M(r,s);
    end
    r=Pop(j,m)+1; s=1;
    vzdialenost(j)=sumvzdial+M(r,s);
end
