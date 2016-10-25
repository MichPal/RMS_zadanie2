function vzdialenost = fitness_dist (POP,B)

[r,s] = size(B);
[r_por,s_por] = size(POP);

vzdialenost=[];
for a = 1:r_por
    
    vzd = 0;
    for i = 1:r-1
        
        suma = 0;  
        for j = 1:s
            suma = suma + (B(POP(a,i),j)-B(POP(a,i+1),j))^2;
        end
        vzd = vzd + sqrt(suma);  
        
    end
    vzdialenost = [vzdialenost vzd];
    
end