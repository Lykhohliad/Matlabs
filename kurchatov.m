function x = kurchatov (f,x1,x2,tol,maxIter)
% ������� ��� ����'������ ������� f(x)=0 ������� ��������� � �����. 
% ����������� x1, x2 �� ������� tol.
% ���������:
% f - ������� �������;
% x1, x2 - ��� ���������� ����������;
% tol - �������, ������'�������, ���� �� �� �������, �� tol = 1e-4.
% maxIter - ����������� ������� �������� � ����� ���������,
%				������'�������, ���� �� �� �������, �� maxIter = 1e6.
% ����������:
% x - ���������� ����'���� �������, ���� �� ���������, ��� 
%		NaN, ���� �.

switch nargin
	case [1 2]
		x = NaN;
		warning('kurchatov: ���������� ������� ���������')
		return
	case 3
		tol = 1e-4;   maxIter = 1e6;
	case 4
		maxIter = 1e6;
end
for i = 1:maxIter
	x = x2 - f(x2)*2*(x2-x1)/(f(2*x2-x1)-f(x1));
	if abs(x-x2)<tol
		return
	end
	x1 = x2;  x2 = x;
end
x = NaN;
warning('newton: ����� ����������')
end