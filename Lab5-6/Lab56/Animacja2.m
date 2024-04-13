l1 = 0.2;
h = 0.5;
syms alfa beta l2

% Współrzędne punktów
O = [0, 0, 0];
P = [0, 0, h];
R = [l1 * cos(alfa) * sin(beta) , l1 * sin(alfa) * sin(beta),l1 * cos(beta) + h];
Q = [(l2+l1) * cos(alfa) * sin(beta) , (l2+l1) * sin(alfa) * sin(beta) , (l2+l1) * cos(beta) + h];

[alfa1 beta1 l21]=vpasolve(Q(1)==0.4,Q(2)==0.5,Q(3)==1,[alfa beta l2])
[alfa2 beta2 l22]=vpasolve(Q(1)==-0.7,Q(2)==0.3,Q(3)==0.2,[alfa beta l2],[;;1])

R1 = [l1 * cos(alfa1) * sin(beta1) , l1 * sin(alfa1) * sin(beta1),l1 * cos(beta1) + h];
Q1 = [(l21+l1) * cos(alfa1) * sin(beta1) , (l21+l1) * sin(alfa1) * sin(beta1) , (l21+l1) * cos(beta1) + h];

R2 = [l1 * cos(alfa2) * sin(beta2) , l1 * sin(alfa2) * sin(beta2),l1 * cos(beta2) + h];
Q2 = [(l22+l1) * cos(alfa2) * sin(beta2) , (l22+l1) * sin(alfa2) * sin(beta2) , (l22+l1) * cos(beta2) + h];

% Tworzenie animacji zmieniającej wartość kąta alfa
frames = 100; % Liczba klatek animacji

% Początkowy kąt alfa, beta i długość l
start_alfa = alfa1;
start_beta = beta1;
start_l = l21;

% Krok zmiany kąta alfa, beta i długości l
step_alfa = (alfa2 - alfa1) / frames;
step_beta = (beta2 - beta1) / frames;
step_l = (l22 - l21) / frames;

% Rysowanie początkowej klatki animacji
figure;
plot3(O(1), O(2), O(3), 'ro', 'MarkerSize', 20, 'MarkerFaceColor', 'r');
hold on;
plot3(P(1), P(2), P(3), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
%plot3(R1(1), R1(2), R1(3), 'mo', 'MarkerSize', 10, 'MarkerFaceColor', 'm');
%plot3(Q1(1), Q1(2), Q1(3), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
axis([-1 1 -1 1 0 1]);
pause(10);
% Pętla animacji zmieniająca wartość kąta alfa, beta i długości l
for i = 1:frames
    % Aktualizacja kąta alfa, beta i długości l
    current_alfa = start_alfa + i * step_alfa;
    current_beta = start_beta + i * step_beta;
    current_l = start_l + i * step_l;
    
    % Aktualizacja pozycji punktów zależnie od aktualnych wartości kąta alfa, beta i długości l
    R_current = [l1 * cos(current_alfa) * sin(current_beta), l1 * sin(current_alfa) * sin(current_beta), l1 * cos(current_beta) + h];
    Q_current = [(current_l + l1) * cos(current_alfa) * sin(current_beta), (current_l + l1) * sin(current_alfa) * sin(current_beta), (current_l + l1) * cos(current_beta) + h];
    
    
    
    
    % Pauza między klatkami
    pause(0.05);
    
    % Usunięcie poprzedniej klatki animacji i narysowanie nowej

        cla;
        plot3(O(1), O(2), O(3), 'ro', 'MarkerSize', 20, 'MarkerFaceColor', 'r');
        hold on;
        plot3(P(1), P(2), P(3), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
        plot3(R_current(1), R_current(2), R_current(3), 'mo', 'MarkerSize', 10, 'MarkerFaceColor', 'm');
        plot3(Q_current(1), Q_current(2), Q_current(3), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
        plot3([O(1), P(1)], [O(2), P(2)], [O(3), P(3)], 'r-', 'LineWidth', 2);
        plot3([P(1), R_current(1)], [P(2), R_current(2)], [P(3), R_current(3)], 'g-', 'LineWidth', 2);
        plot3([R_current(1), Q_current(1)], [R_current(2), Q_current(2)], [R_current(3), Q_current(3)], 'b-', 'LineWidth', 2);
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        grid on;
        axis([-1 1 -1 1 0 1.5]);

        % Uaktualnienie wyświetlanej klatki
        drawnow;
        
end
