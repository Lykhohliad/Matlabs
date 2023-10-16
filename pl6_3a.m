function pl6_3a      % зовнішня функція
clear all, close all, clc
f1 = @(x)(x.*x);      % анонімна функція
f2 = inline('2.*x');  % inline-функція
f1(5), feval(f1, 5)

% для виклику у вигляді feval(@f1, 5) - синтаксична помилка !
% feval('f1', 5)        % у директорії пошуку є М-функція f1.m
feval(@sin, pi), feval('sin', pi)
f2(5), feval(f2, 5)

% для виклику в виді feval(@f2, 5) - синтаксична помилка !
%feval('f2', 5)        % у директорії пошуку є М-функція f2.m
P1(f1, 1)             % виклик підфункції
%  P1(@f1, 2)  -  синтаксична помилка !
%  P1('f1', 3) -  виклик зі зверненням до М-функції f1.m !
P1(f2, 1)             % виклик підфункції
%  P1(@f2, 2)% -  синтаксична помилка !
%  P1('f2', 3) -  виклик зі зверненням до М-функції f2.m !
end

function e = P1(f,x)   %  опис  підфункції
   e = f(x);           % виклик функції, заданої вхідним аргументом
end

