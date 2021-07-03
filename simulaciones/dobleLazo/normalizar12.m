function [xout] = normalizar12(pendulo,xin,simetria)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
xout=xin; %El vector de v�rtices de salida inicialmente es igual al de entrada.

min=-1; %El m�nimo del rango deseado para los efectos de trabajo del algoritmo.
max=1; %El m�ximo del rango deseado para los efectos de trabajo del algoritmo.
N_IN=length(pendulo.input); %N�mero de entradas del sistema.

offset=0; %Se inicializa el puntero del n�mero de v�rtices.
for i=1:N_IN
    N_FP=length(pendulo.input(i).mf); %Se obtiene el n�mero de F.P de la entrada (i).
    if (simetria==true)
        if rem(N_FP,2)==0 % Si el n�mero de FP es par:
            N_V_FP=N_FP/2*4-2;
        else
            N_V_FP=(floor(N_FP/2)+rem(N_FP,2))*4-4;
        end
    else
        N_V_FP=N_FP*4-4;
    end
        
    if (pendulo.input(i).range(1)~=min)||(pendulo.input(i).range(2)~=max)
        for j=offset+1:offset+N_V_FP
               xout(j)=(xout(j)-pendulo.input(i).range(1))/(pendulo.input(i).range(2)-pendulo.input(i).range(1)); %Se mapea al rango [0,1] (normalizaci�n)calar las componen
               xout(j)=xout(j)*(max-min)+min; % Se escala al rango [-1,1] (escalamiento).
        end
    end
    offset=offset+N_V_FP;    
       
end

end
