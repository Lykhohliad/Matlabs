% ���� 7. ������� ����'������ ��������� ������� ������� ���������
% ����� ����������� � ������� kurchatov(f,x1,x2,tol,maxiter)

f = @(x) 0.25*x-3*sin(x);			% ������� ������� f(x) = 0

xx=0:0.25:10;					% ѳ��� ��� �������
yy = f(xx);						% �������� f �� ����
plot(xx,yy,'bo-','LineWidth',1.5)		% ������ ������� f(x)
hold on
plot([0 xx(end)],[0 0],'k','LineWidth',1.5)		% ³�� �� (������������� ���)
grid on
legend('y = 0.25*x-3*sin(x)')
hold off

x1 = input('��������� ���������� x1 = ');
x2 = input('��������� ���������� x2 = ');
x = kurchatov(f,x1,x2);
if ~isnan(x)
	disp(['����''���� � = ',num2str(x)])
else
	disp('���...')
end