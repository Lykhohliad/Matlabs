%% pl7_1n.m
% �������� ������� ����� ���� �� ���������� �����
clear all, close all, clc
% ��������� ��������� ����'���� ������������ ���������� ������� :
maple('eq:=pdsolve(diff(u(x,t),t,t)-a^2*diff(u(x,t),x,x)=0, u(x,t))');
maple 'q2:=subs([_F1=F1,_F2=F1, a=2],eq)'; % �������� ����������
u = maple('rhs(q2)');                      % u - ��������� ����  
U = @(x,t)eval(u);                         % eval - �������� �������� �����
xb = -10; xe = 10; Nx = 201; 
x = linspace(xb,xe,Nx);                    % ������ ���� �� x
tb = 0; te = 5; Nt = 51;
T = linspace(tb,te,Nt);                    % ������ ���� �� t
save pl7_1n Nx Nt                          % ����� Nx,Nt � *.mat ����
fp = fopen('pl7_1n.bin','wb');             % �������� �������� �����
n = fwrite(fp,x,'double');                 % ���������� x ��� ��������
disp(n==Nx);
n = fwrite(fp,T,'double');                 % ���������� T ��� ��������
disp(n==Nt);
SNi1 = int2str(Nt/2); SNi2 = int2str(Nt);  % ������ ����-�����
for i = 1:Nt                               % ����� ����� �������
   t = T(i); y = U(x,t);                   % �������� ����'���� � ����� t
   n = fwrite(fp,y,'double');              % ���������� u(:,t) ��� ��������
   plot(x,y,'LineWidth',2); axis([x(1),x(end), -0.5, 2.2]), grid on
   legend(strcat('u(x,',num2str(t),')'))
   M(i) = getframe;                        % �������� ������ � ����� �����
   switch int2str(i)                       % ����-���� ��� t = tb,(tb+te)/2, te 
       case {'1',SNi1,SNi2}
           pause
   end
end
fclose(fp);                                % �������� �������� �����
movie(M);                                  % �������