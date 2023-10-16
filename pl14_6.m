f='100*(x(2)-x(1)^2)^2+(1-x(1))^2'; % опис функц 
GRAD='[100*(4*x(1)^3-4*x(1)*x(2))+2*x(1)-2; 100*(2*x(2)-2*x(1)^2)]'; % описание градиента
%OPTIONS = optimset(OPTIONS,'gradobj','on'); % подключение опции градиентного поиска 
[x,fval] = fminunc({f,GRAD},[-1.9, 2],optimset('Gradobj','on'))
