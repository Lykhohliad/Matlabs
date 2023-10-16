%% pl7kp_1n.m
% �������� ������� ����� ���� �� ���������� �����
clear all, close all, clc
load pl7_1n                                % ������ ��� � *.mat �����
disp([Nx Nt]);
fp = fopen('pl7_1n.bin','rb');             % �������� �������� �����
[x,n] = fread(fp,Nx,'double');             % ������ ���� x
disp(n==Nx); x = x';
[T,n] = fread(fp,Nt,'double');             % ������ ���� T
disp(n==Nt); T = T';
M = zeros(Nt,Nx);                          % ������� ��� 3D-�������
for i = 1:Nt
   [y,n] = fread(fp,Nx,'double');          % ������ u(:,t)
   M(i,:) = y';
end
fclose(fp);                                % �������� �������� �����
y = T; [X,T] = meshgrid(x,y); clear y      % meshgrid-���� ��� 3-D �������
surfl(X,T,M), shading interp, colormap pink
xlabel('x'), ylabel('t'), zlabel('u(x,t)')