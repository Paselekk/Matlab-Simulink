% Definicja promienia koła
%l1 = 0.1 pk1; 0.1 pk2
%h = 1 pk1; 0.2pk2
%l2=2;
%alfa=190*pi/180;
%beta=45*pi/180;
% Definicja kątów


l1 = 0.2;
h = 0.5;
syms alfa beta l2

% Współrzędne punktów
O = [0, 0, 0];
P = [0, 0, h];
R = [l1 * cos(alfa) * sin(beta) , l1 * sin(alfa) * sin(beta),l1 * cos(beta) + h];
%Q = [l2 * cos(alfa) * sin(beta) + R(1) , l2 * sin(alfa) * sin(beta) + R(2), l2 * cos(beta) + R(3)];
Q = [(l2+l1) * cos(alfa) * sin(beta) , (l2+l1) * sin(alfa) * sin(beta) , (l2+l1) * cos(beta) + h];

[alfa1 beta1 l21]=vpasolve(Q(1)==0.4,Q(2)==0.5,Q(3)==1,[alfa beta l2])
[alfa2 beta2 l22]=vpasolve(Q(1)==-0.7,Q(2)==0.3,Q(3)==0.2,[alfa beta l2],[;;1])


R1 = [l1 * cos(alfa1) * sin(beta1) , l1 * sin(alfa1) * sin(beta1),l1 * cos(beta1) + h];
Q1 = [(l21+l1) * cos(alfa1) * sin(beta1) , (l21+l1) * sin(alfa1) * sin(beta1) , (l21+l1) * cos(beta1) + h];

R2 = [l1 * cos(alfa2) * sin(beta2) , l1 * sin(alfa2) * sin(beta2),l1 * cos(beta2) + h];
Q2 = [(l22+l1) * cos(alfa2) * sin(beta2) , (l22+l1) * sin(alfa2) * sin(beta2) , (l22+l1) * cos(beta2) + h];
% Rysowanie punktów
figure;
plot3(O(1), O(2), O(3), 'ro', 'MarkerSize', 20, 'MarkerFaceColor', 'r');
hold on;
plot3(P(1), P(2), P(3), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
plot3(R1(1), R1(2), R1(3), 'mo', 'MarkerSize', 10, 'MarkerFaceColor', 'm');
plot3(Q1(1), Q1(2), Q1(3), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

plot3(R2(1), R2(2), R2(3), 'mo', 'MarkerSize', 10, 'MarkerFaceColor', 'm');
plot3(Q2(1), Q2(2), Q2(3), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

% Łączenie punktów liniami
plot3([O(1), P(1)], [O(2), P(2)], [O(3), P(3)], 'r-', 'LineWidth', 2);
plot3([P(1), R1(1)], [P(2), R1(2)], [P(3), R1(3)], 'g-', 'LineWidth', 2);
plot3([R1(1), Q1(1)], [R1(2), Q1(2)], [R1(3), Q1(3)], 'b-', 'LineWidth', 2);

plot3([P(1), R2(1)], [P(2), R2(2)], [P(3), R2(3)], 'g-', 'LineWidth', 2);
plot3([R2(1), Q2(1)], [R2(2), Q2(2)], [R2(3), Q2(3)], 'b-', 'LineWidth', 2);
% 
% Ustawienia osi
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
axis([-1 1 -1 1 0 1]);
 
% Dodanie tytułu
title('Punkty O, P, R i Q w układzie XYZ w dwóch pozycjach');

% „Sterowanie”
% Obliczenia różnicy pomiędzy sterowanymi parametrami w początkowym i końcowym położeniu manipulatora.
S_alfa=alfa2-alfa1;
S_beta=beta2-beta1;
S_z=l22-l21;

%S_alfa=alfa1;
%S_beta=beta1;
%S_z=l21;
% Przyjęte maksymalne prędkości silników
V_ang=0.1;
V_lin=0.1;
% Określenie kierunku obrotu silników przy maksymalnych prędkościach
Vd_alfa=sign(S_alfa)*V_ang;
Vd_beta=sign(S_beta)*V_ang;
Vd_z=sign(S_z)*V_lin;

% Parametry czasowe
t0=0; % start
tk=100; % koniec
t=t0:0.1:tk;
tz=5; % czas rozpędzania i hamowania silników
% Czas potrzebny do wykonania zadania
T_alfa=(S_alfa/Vd_alfa)-tz;
T_beta=(S_beta/Vd_beta)-tz;
T_z=(S_z/Vd_z)-tz;
% Praca silników - prędkości
V_alfa=(Vd_alfa/tz).*(heaviside(t-t0).*(t-t0)-heaviside(t-t0-tz).*(t-t0-tz)-heaviside(t-t0-tz-T_alfa).*(t-t0-tz-T_alfa)+heaviside(t-t0-2*tz-T_alfa).*(t-t0-2*tz-T_alfa));
V_beta=(Vd_beta/tz).*(heaviside(t-t0).*(t-t0)-heaviside(t-t0-tz).*(t-t0-tz)-heaviside(t-t0-tz-T_beta).*(t-t0-tz-T_beta)+heaviside(t-t0-2*tz-T_beta).*(t-t0-2*tz-T_beta));
V_z=(Vd_z/tz).*(heaviside(t-t0).*(t-t0)-heaviside(t-t0-tz).*(t-t0-tz)-heaviside(t-t0-tz-T_z).*(t-t0-tz-T_z)+heaviside(t-t0-2*tz-T_z).*(t-t0-2*tz-T_z));

% Przyspieszenia
A_alfa=(Vd_alfa/tz).*(heaviside(t-t0)-heaviside(t-t0-tz)-heaviside(t-t0-tz-T_alfa)+heaviside(t-t0-2*tz-T_alfa));
A_beta=(Vd_beta/tz).*(heaviside(t-t0)-heaviside(t-t0-tz)-heaviside(t-t0-tz-T_beta)+heaviside(t-t0-2*tz-T_beta));
A_z=(Vd_z/tz).*(heaviside(t-t0)-heaviside(t-t0-tz)-heaviside(t-t0-tz-T_z)+heaviside(t-t0-2*tz-T_z));

% Przemieszczenia
Q_alfa=(Vd_alfa/(2*tz)).*(heaviside(t-t0).*((t-t0).^2)-heaviside(t-t0-tz).*((-t+t0+tz).^2)-heaviside(t-t0-tz-T_alfa).*((-t+t0+tz+T_alfa)).^2+heaviside(t-t0-2*tz-T_alfa).*((-t+t0+2*tz+T_alfa).^2));
Q_beta=(Vd_beta/(2*tz)).*(heaviside(t-t0).*((t-t0).^2)-heaviside(t-t0-tz).*((-t+t0+tz).^2)-heaviside(t-t0-tz-T_beta).*((-t+t0+tz+T_beta)).^2+heaviside(t-t0-2*tz-T_beta).*((-t+t0+2*tz+T_beta).^2));
Q_z=(Vd_z/(2*tz)).*(heaviside(t-t0).*((t-t0).^2)-heaviside(t-t0-tz).*((-t+t0+tz).^2)-heaviside(t-t0-tz-T_z).*((-t+t0+tz+T_z)).^2+heaviside(t-t0-2*tz-T_z).*((-t+t0+2*tz+T_z).^2));

figure;
title("V")
plot(t,V_alfa,'LineWidth',2.0);
hold on;
plot(t,V_beta,'LineWidth',2.0);
plot(t,V_z,'LineWidth',2.0);
xlim([0 40])


legend('V alfa','V beta','V z')

figure;
title("A")
plot(t,A_alfa,'LineWidth',2.0);
hold on;
plot(t,A_beta,'LineWidth',2.0);
plot(t,A_z,'LineWidth',2.0);
xlim([0 40])

legend('A alfa','A beta','A z')

figure;
title("Q")
plot(t,Q_alfa,'LineWidth',2.0);
hold on;
plot(t,Q_beta,'LineWidth',2.0);
plot(t,Q_z,'LineWidth',2.0);
xlim([0 30])

legend('Q alfa','Q beta','Q z')
