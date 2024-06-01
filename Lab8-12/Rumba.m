clear all; clc; close all;
%% Parametry symulacji
dt=0.1; % krok całkowania
ts=35; % czas symulacji
t=0:dt:ts; %time span

%% Warunki początkowe
x0=50;
y0=50;
psi0=-pi/2;

eta0=[x0;y0;psi0];

eta(: , 1) = eta0; % przypisanie pierwszej kolumnie
% trzech warunków początkowych w kolejnych wierszach

%% Ruch robota t=s/v

% Ruch 1
for i=1:length(t)
psi = eta(3,i); %aktualna orientacja w rad
%Jakobian macierzy:
J_psi=[cos(psi),-sin(psi),0;
sin(psi),cos(psi),0;
0,0,1];
if(i<42)
u=0; % prędkość liniowa w kierunku x, względem punktu B
v=40.; % prędkość liniowa w kierunku v, względem punktu B
r=0.55; % prędkość kątowa wokół punktu B
end
if(i>42 && i<84)
u=0.; % prędkość liniowa w kierunku x, względem punktu B
v=40.; % prędkość liniowa w kierunku v, względem punktu B
r=-0.55; % prędkość kątowa wokół punktu B
end
if(i>84 && i<120)
u=0.; % prędkość liniowa w kierunku x, względem punktu B
v=40.; % prędkość liniowa w kierunku v, względem punktu B
r=0.0; % prędkość kątowa wokół punktu B
end
if(i>120 && i<183)
u=0.; % prędkość liniowa w kierunku x, względem punktu B
v=40.; % prędkość liniowa w kierunku v, względem punktu B
r=0.5; % prędkość kątowa wokół punktu B
end
if(i>183 && i<247)
u=0.; % prędkość liniowa w kierunku x, względem punktu B
v=40.; % prędkość liniowa w kierunku v, względem punktu B
r=0.00; % prędkość kątowa wokół punktu B
end
if(i>247 )
u=0.; % prędkość liniowa w kierunku x, względem punktu B
v=0.; % prędkość liniowa w kierunku v, względem punktu B
r=0.; % prędkość kątowa wokół punktu B
end
zeta(:,i)=[u;v;r];

eta_dot(:,i) = J_psi*zeta(:,i);

eta(:,i+1) = eta(:,i)+dt*eta_dot(:,i); % metoda Eulera
end


%% Animacja ruchu robota mobilnego

l=40; % długość platformy
w=40; %szerokość platformy

% Współrzędne opisujące kształ platformy
mr_co=[-l/2,l/2,l/2,-l/2,-l/2;
-w/2,-w/2,w/2,w/2,-w/2];

figure
for i=1:length(t) % początek animacji
    set(gca,'Color','k')
x=[0 285 285 305 305 500 500 445 445 500 500  0   0  330 330  0   0  95  95   0  0]
y=[0  0  160 160  0   0  240 240 260 260 500 500 380 380 360 360 140 140 120 120 0]
fill(x,y,[.7 .7 .7])
hold on
x=[135 385 385 135]
y=[240 240 260 260]
fill(x,y,'r')
hold on
plot(50, 50, '.y', 'MarkerSize',69)
hold on
plot(50, 450, '.y', 'MarkerSize',69)
hold on


psi= eta(3,i);
R_psi=[cos(psi), -sin(psi);
sin(psi),cos(psi)]; % macierz rotacji
v_pos=R_psi*mr_co;

fill(v_pos(1,:)+eta(1,i), v_pos(2,:)+eta(2,i),'g') % robot
hold on, grid on; axis([0 500 0 500]), axis square

plot(eta(1,1:i),eta(2,1:i),'b-'); % ścieżka ruchu

xlabel('x[m]'); ylabel('y[m]');
pause(0.05);
hold off
end % koniec animacji


%%Start pętli
for i=1:length(t)
    psi = eta(3,i); %aktualna orientacja w rad
    %Jakobian macierzy:
    J_psi=[cos(psi),-sin(psi),0;
           sin(psi),cos(psi),0;
           0,0,1];
%%Stan pożądany (współrzędne uogólnione)
       eta_d=[2-2*cos(0.1*t(i)); 2*sin(0.1*t(i));0.1*t(i)]; % trajektoria do pokonania
       eta_d_dot=[2*0.1*sin(0.1*t(i)); 2*0.1*cos(0.1*t(i));0.1]; % pochodna po eta_d
%%Wektor prędkości wejściowych
       zeta(:,i)=inv(J_psi)*eta_d_dot;

       e(:,i)=eta_d-eta(:,i); % błąd


       eta_dot(:,i) = J_psi*zeta(:,i); % Pochodna czasowa po współrzędnych uogólnionych

       eta(:,i+1) = eta(:,i)+dt*eta_dot(:,i); % metoda Eulera
       set(gca,'color',[0 0 0])
end
%%Wydruk funkcji
figure
plot(t, eta(1,1:i),'r-');
set(gca,'fontsize',12)
xlabel('t[s]')
ylabel('x[m]')

figure
plot(t, eta(2,1:i),'b-');
set(gca,'fontsize',12)
xlabel('t[s]')
ylabel('y[m]')

figure
plot(t, eta(3,1:i),'g-');
set(gca,'fontsize',12)
xlabel('t[s]')
ylabel('\psi[rad]')


figure
plot(t,e)
legend('x_e[m]','y_e[m]','\psi_e[rad]');
set(gca,'fontsize', 12)
xlabel('t[s]');
ylabel('\eta_e[units]');