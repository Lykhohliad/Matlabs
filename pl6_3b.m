%% М-файл pl6_3b.m
clear all, close all, clc
f1 = @(x)(x.*x);      % анонімна функція
f2 = inline('2.*x');  % inline-функція
f1(5), feval(f1, 5)

% для виклику у вигляді feval(@f1, 5) - синтаксична помилка !
%feval('f1', 5)        % у директорії пошуку є М-функція f1.m
feval(@sin, pi), feval('sin', pi)
f2(5), feval(f2, 5)

% для виклику у вигляді feval(@f2, 5) - синтаксична помилка !
%feval('f2', 5)        % у директорії пошуку є М-функція f2.m
%  P1(f1, 1)   -  помилка при виклику зовнішньої функції
%  P1(@f1, 2)  -  синтаксична помилка !
%  P1('f1', 3) -  виклик зі зверненням до М-функція f1.m !
P1(f2, 1)             % виклик зовнішньої функції
%  P1(@f2, 2)  -  синтаксична помилка !
%  P1('f2', 3) -  виклик зі зверненням до М-функція f2.m !

function e = P1(f,x)   %  зовнішня функція
   e = f(x);   % виклик функції, заданої вхідним аргументом
end