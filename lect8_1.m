f = @(x,y) (-2.*x.*y.^2)./(1+x.^2) + (x.^2)./(1+y.^2*x);		% Права частина рівняння
x0 = 0;							% Початковий момент часу
X = 2;							% Кінцевий момент часу
y0 = 0.5;							% ПУ
h = 0.01;						% Крок сітки за часом
t = x0:h:X;					% Часова сітка
Y = zeros(size(t));			% Вектор майбутнього розв'язку
Y(1) = y0;						% Початкове значення розв'язку береться з ПУ
for i = 1:length(t)-1
	F = @(z) z-Y(i)-(t(i+1)-t(i))*(f(t(i+1),z));
									% Функція для розв'язання рівняння, яке визначає
									% Y(i+1) (неявна схема)
	Y(i+1) = fzero(F,Y(i));	% Відшукання Y(i+1) в ході неявної схеми
end
plot(t,Y,'g-','LineWidth',1.5) 
grid
legend('Ейлер,неявний метод')