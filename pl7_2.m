%%pl7_2.m
% �������� 3-D �������
clear all, close all, clc

[X Y] = meshgrid(linspace(-1,1,251));
XY = X.^2+Y.^2;                  % ���������� �������� �������
C = XY<=1;                       % ������� �����
XYZ = zeros(size(XY));           % ������� �������
XYZ(C) = 1 - XY(C);              % ������ ������������
Z = sqrt(XYZ);                   % ���������� ������� z(x,y)
mesh(X,Y,Z), pause, close all
surfl(X,Y,Z), shading interp, colormap pink