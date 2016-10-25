clc
clear
figure(2)
% Upravit al,bl,cl - vahy, porzi UI prednasku 4-16
al=0.1;
bl=0.001;
cl=0.001;

n = 2;                                  % pocet premennych
max_rozsah = .1;
rozsah=ones(1,n);               
gennum = 10;                           % pocet generacii
S=[zeros(1,n);max_rozsah*rozsah];             % definicny obor

POP = genrpop (30,S);
% I = crit_fun(POP);
I = crit_fun2(POP,al,bl,cl);

% 
    for a=1:gennum
        Fitnessa(a) = min(I);
        a
        A = selbest(POP,I,ones(1,3));         % 3 najlepsi do vyslednej populacie bez zmeny
        B = selbest(POP,I,ones(1,13));      % 9 najlepsich do pracovnej skupiny
        
        C = crosgrp(B,14);                  % 8 potomkov z prechadzajuceho vyberu
        D = [B;C];                          % pracovna skupina (17)

        amp =[ones(1,3)];
        D = muta(D,.15,amp*(max_rozsah*0.1),S);            % aditivna mutacia
        D = mutx(D,.15,S);                  % nahodna/obycajna mutacia

        POP = [A;D];                        % Vysledna populacia
%         I=crit_fun(POP);
        I=crit_fun2(POP,al,bl,cl);
    end
    Najlepsi_vysledok = selbest(POP,I,1);    % Najlepsia kombinacia premennych
    Kp = Najlepsi_vysledok(1);
%     Ki = Najlepsi_vysledok(2);
    Kd = Najlepsi_vysledok(2);
    lim = 30;
    
    l=0.4;
    m=0.2;
    g=9.81;
    B=0.01;
    J=m*l^2;

    K=-1/g;
    w=sqrt(g/l);
    b=B;
    
    sim('uloha1_sim')
    Fitnessa_vys = Fitnessa;
%     Optimum = crit_fun(Najlepsi_vysledok);
    Optimum = crit_fun2(Najlepsi_vysledok,al,bl,cl);
    disp(sprintf('Vysledok:\nKp = %2.3f\nKd = %2.3f\nI = %2.3f\n',Kp,Kd,Optimum));
    
    figure(1)
    plot([1:gennum],Fitnessa_vys,'b','Linewidth',1.5);
    title('Priebeh fitness funkcie');
    
    figure(2)
    plot(t,y,'g','Linewidth',1.5);hold on;
    title('Prechodová charakteristika výstupu');
    legend('y','w');
   
