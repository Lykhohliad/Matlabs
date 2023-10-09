% mk1_081.m
clear all, clc

f = @(x)(sinh(0.5.*x)+2);

a = 6; b = 8; h = 0.2; n = 10;
x = linspace(a,b,n+1);  %  ���������� ������ ����
y = f(x);             %  ���������� ������� �� ����

P = polyfit(x,y,n); % ������ ��������������� ������ (��)
dP = polyder(P);      % ���������� ������� �� ��

while 1               % �������� �������� t � [a,b]
    t = input('? t=');
    if a <= t & t <= b
        break
    end
end
dPt = polyval(dP, t);     % �������� �� � ����� t
dft = 0.5.*cosh(0.5.*t);  % njxyt �������� f'(t) 
disp(strcat('������� �� ��=',num2str(dPt),...
     '  ����� ��������=',num2str(dft)))

it = h .* trapz(y);  %  �.�������� � ��������� ������ h
is = quad(f, a, b); %  �.ѳ������ ��� ������� f(x) �� ������ [a,b]
disp(strcat('�������� �� �.��������=',num2str(it),...
     '  �� ѳ������=',num2str(is)))