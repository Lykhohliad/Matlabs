function mk2_081
    clear all, close all, clc

    a = 0; b = 3; hv = 0.2;
    % ������� X - ���� ��������� ����'����
    n = 16; X = linspace(a, b, n); 
    Y = zeros(1, n);  % "���������" ������� ����'����

    % ������� ���� �� ��������� ���������� ������� O(h^2)=1�-4
    h = 0.01;
    % �������� ����� (Y - �.�����-�����, YY - ode23)
    Y(1) = 1; YY = Y;
    for k = 2 : n
    % ��������� ����'���� �� ������� �������� ���������
        kp = k - 1; y = Y(kp);
        y = runge_k2(@f, X(kp), X(k), h, y);
        Y(k) = y;
        ye = Y(kp);
        [x, y] = ode23(@f, [X(kp) X(k)], ye);
        % � y ������ ������ �������� (� ����� X(k))
        m = length(y); YY(k) = y(m);
    end

    % ������ ������� ���������� ����'����
    plot(X, Y, 'b:', X, YY, 'k-')
    title('������ ����: u''=(2+0.23x)u+sin(x+2u^2), u(0)=1')
    xlabel('x'), ylabel('u(x)')
    legend('�.�-� O(h^2)','ode23','Location','Best')
    grid on
end

function v = f(x, u)
% ���� ������� ����� ������� ������� u'=f(x,u)
    v = (2 + 0.23.*x).*u + sin(x + 2.*u.*u);
end

function y = runge_k2(f, xbeg, xend, h, y)
% ���� ������� �.�����-����� 2-�� ������� �������
%  ����� ��������� :
%   f    - ����� ������� f(x,u);
%   xbeg - ������� ��������� ������������;
%   xend - ����� ��������� ������������;
%   h    - ���������� ���� ������������;
%   y    - �������� ������� � ����� x=xbeg;
%  ������ ��������� :
%   y    - �������� ������� � ����� x=xend.
    hh = 0.5 .* h; ht = h; 
    x = xbeg;
    while x < xend
        K1 = f(x, y);
        xp = x; x = x + ht;
        if x > xend
            x = xend; ht = x - xp;
            hh = 0.5 .* ht;
        end
        K2 = f(x, y + ht .* K1);
        y = y + hh .* (K1 + K2);
    end
end