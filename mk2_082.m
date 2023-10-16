function mk2_082
    clear all, close all, clc
    
    %��������� ��������� sol_init ���������� ����� �� m �����,
    %�������� ����������� �� ������ [a, b] � ��������� y=[1; 2]
    a = 0; b = 2; m = 51;
    xx = linspace(a, b, m); yy = [1; 2];
    sol_init = bvpinit(xx, yy);
    
    % ����'����� ������ :
    sol = bvp4c(@F, @G, sol_init);
    
    % ��������� ���������� �� ������� ����:
    N = 101; x = linspace(a, b, N);
    Y = deval(sol, x);

    % �������� 2-� ��������� :
    subplot(1,2,1)     % ��� u(x)
    plot(x, Y(1,:),'k -')
    axis([-0.1 2.1 -1.1 2.1])
    title('����''������ �� ��� ���')
    xlabel('x'), ylabel('u(x)')
    legend('u(x)','Location','Best'), grid on
    
    subplot(1,2,2)     % ��� u'(x)
    plot(x, Y(2,:),'r :')
    axis([-0.1 2.1 -1.1 2.1])
    title('������� �� ����''���� ��')
    xlabel('x'), ylabel('u''(x)')
    legend('u''(x)','Location','Best'), grid on  
end

function dydf = F(x, y)
% ���� ������� ����� ������� ������� U'=F(x,U)
    dydf = [y(2); cos(2.*x) + (4.6.*x + 1).*y(1)];
end

function bc = G(ya, yb)
% ���� �������� ����
    bc = [ya(2)+2.*ya(1); yb(2)-2];
end