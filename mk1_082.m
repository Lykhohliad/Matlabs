function mk1_082
    clear all, clc

    n = 6; A = wilkinson(n); A = A * A';
    for i = 1:n
        A(i,i) = A(i,i) + 24.*(i-1);
    end

    while 1
        b = input('? ������-�������� ����� ������� ����\n');
        [i, j] = size(b);
        if i == n & j == 1 % �������� ��������� � �� b � col-������
            break
        end
    end

    disp('������� ����'), A
    disp('������ ������ ������ ����'), b

    x = fact_LU(A, b);
    disp('����''���� ���� LU-�������'), x

    X = rref([A, b]); X = X(:, n+1);
    disp('����''���� ���� ����������� �� ��������� �����'), X
end

function x = fact_LU(A, b)
% ����'���� ���� A*x=b LU-�������
    [L, U, P] = lu(A);
    x = U \ (L \ (P * b));
end