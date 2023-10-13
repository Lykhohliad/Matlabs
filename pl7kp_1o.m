%% pl7kp_1.m
% �������� ������� ����� ���� �� ���������� �����
clear all, close all, clc
% ��������� ��������� ����'���� ������������ ���������� ������� :
maple('eq:=pdsolve(diff(u(x,t),t,t)-a^2*diff(u(x,t),x,x)=0, u(x,t))');
maple 'q2:=subs([_F1=F1,_F2=F1, a=2],eq)'; % �������� ����������
u = maple('rhs(q2)');                      % u - ��������� ����  
U = @(x,t)eval(u);                         % eval - �������� �������� �����
Nx = 201; x = linspace(-10,10,Nx);         % ������ ���� �� x
Ni = 51; T = linspace(0,5,Ni); i = 1;      % ������ ���� �� t
M = zeros(Ni,Nx);                          % ������� ��� 3D-�������
for t = T
   y = U(x,t);
   plot(x,y,'LineWidth',2); axis([x(1),x(end), -0.5, 2.2]), grid on
   legend(strcat('u(x,',num2str(t),')')), pause(0.2)
   M(i,:) = y; i = i+1;   
end
close all, clear y u U
y = T;
[X,T] = meshgrid(x,y);
surfl(X,T,M), shading interp, colormap pink