function [ v0 ] = indice12(pendulo,simetria)
%ESTA FUNCI�N FORMA EL VECTOR V0 PARA EL ALGORITMO DE OPTIMIZACI�N, A
%PARTIR DE LOS INDICES ACTUALES DE LAS FUNCIONES DE PERTENENCIA
%   Detailed explanation goes here
N_IN=length(pendulo.input);
v0=[];
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
            v0=horzcat(v0,pendulo.input(i).mf(j).params(5:7)); %Se toman los �ndices (nT, n1 y n2) de las F.P
    end
    
    
end

end

