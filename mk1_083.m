4function mk1_083
    clear all, clc

    f = @(x)(x.*x.*(x-2)+3); % ���� ������� f(x)

    % ����� �������� ������ ��������� �������
    e = 1;
    while e
        close all  % ��������� ��������� ������
        a = input('? a=');  % ���� �������� ��� �������� ������� 
        b = input('? b=');  % ������
        h = input('? h=');  % ����
        X = [a : h : b];    % ���� �� x
        plot(X, f(X)); grid on
        e = input('? ���������� ����� �������� � �������� (1-�� | 0-�) =');
    end

    X = input('? �������� ���������� [x0,x1]=\n');
    close all
    x0 = X(1); x = X(2);

    max_i = 50; e = 1e-8;  % ��������� ���������
    [x, i, err] = m_sec(f, x0, x, max_i, e);
    disp(strcat('��� ��������� m_sec=',int2str(err)))
    if err == 0
        disp('����� ����� :');
        disp(strcat('��������=',num2str(i),...
             ' �������=',num2str(e),...
             ' �����=',num2str(x)))
        disp(strcat('f(x)    =',num2str(f(x))))
    end

    [x,fx,err] = fminbnd(@(x)(f(x).^2),x0-0.3,x0+0.3,...
                            optimset('TolX',e,'Display','off'));
    disp(strcat('��� ��������� fminbnd=',int2str(err)))
    disp(strcat('����� x=',num2str(x)))
    disp(strcat('f(x)    =',num2str(fx)))
end

function [x, i, err] = m_sec(f, x0, x, max_i, tol)
% ����� ����� ��� ����������� ������  f(x)=0
    if nargin < 5 % ����������� ������� ������� ���������
        err = -4; return
    elseif max_i <= 2 % ����������� �������� max_i
        err = -3; return
    elseif tol <= 0 | tol >= 1 % ������� �� � ������� (0,1)
        err = -2; return
    end

    f1 = f(x0);
    for i = 2 : max_i
        f0 = f1; f1 = f(x); % ���� �������� - ���� ���������� f
        o = (x-x0)./(f1-f0).* f1;
        x0 = x; x = x - o;
        if abs(o) < tol 
            break
        end
    end
    if i == max_i  % ����� �� �������� � ������� tol
        err = -1;
    else
        err = 0;   % ����� �������� � ������� tol
    end
end