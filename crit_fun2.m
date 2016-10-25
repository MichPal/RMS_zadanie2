function I = crit_fun2(POP,a,b,c)
l=0.4;
m=0.2;
g=9.81;
B=0.01;
J=m*l^2;

K=-1/g;
w=sqrt(g/l);
b=B;
    lim = 30;
    [r,s] = size(POP);
    options = simset('SrcWorkspace','current');
    for i=1:r
        Kp = POP(i,1);
%         Ki = POP(i,2);
        Kd = POP(i,2);
        sim('uloha1_sim',[],options);
        I(i) = sum(abs(e))+a*sum(abs(dy)+b*sum(u)+c*sum(du));
    end
    
end