function I = crit_fun(POP)
    lim = 30;
    [r,s] = size(POP);
    options = simset('SrcWorkspace','current');
    for i=1:r
        Kp = POP(i,1);
        Ki = POP(i,2);
        Kd = POP(i,3);
        sim('sim_cv5_1',[],options);
        I(i) = sum(abs(e));
    end
    
end