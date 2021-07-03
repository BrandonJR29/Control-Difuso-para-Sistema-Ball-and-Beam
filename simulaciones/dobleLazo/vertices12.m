function [ x0 ] = vertices12(pendulo,simetria)
%ESTA FUNCI�N FORMA EL VECTOR X0 PARA EL ALGORITMO DE OPTIMIZACI�N, A
%PARTIR DE LOS V�RTICES ACTUALES DE LAS FUNCIONES DE PERTENENCIA
%   Detailed explanation goes here
N_IN=length(pendulo.input);
x0=[];
for i=1:N_IN
    if (simetria)
        if rem(length(pendulo.input(i).mf),2)==0 % Si el n�mero de las FP son pares:
            N_FP=length(pendulo.input(i).mf)/2;
        else %Si el n�mero de F.P es impar:
            N_FP=floor(length(pendulo.input(i).mf)/2)+rem(length(pendulo.input(i).mf),2); 
        end
    else
        N_FP=length(pendulo.input(i).mf);
    end
    for j=1:N_FP
        if (j==1)
            x0=horzcat(x0,pendulo.input(i).mf(j).params(3:4)); %Se considera la primera F.P trapezoidal abierta y se toman los v�rtices "c" y "d" �nicamente.
        else
            if (j==N_FP)
                x0=horzcat(x0,pendulo.input(i).mf(j).params(1:2));  %Se considera la �ltima F.P trapezoidal abierta y se toman los v�rtices "a" y "b" �nicamente.
            else
                x0=horzcat(x0,pendulo.input(i).mf(j).params(1:4)); %Se incluyen todos los v�rtices pra cualquier otra F.P 
            end
        end
    end
    
    
end

end

