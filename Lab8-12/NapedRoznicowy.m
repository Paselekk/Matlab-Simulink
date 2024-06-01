clear all; clc; close all;

dt=0.1; % krok całkowania
ts=50; % czas symulacji
t=0:dt:ts; %time span

a=5; % promień koła
d_w=15; % odległość koła od środka robota (wzdłuż osi y) - dla koła różnicowego
l_w=15; % odległość koła od środka robota - dla koła wielokierunkowego

x0=50;
y0=50;
psi0=0;

eta0=[x0;y0;psi0];

eta(: , 1) = eta0; % przypisanie pierwszej kolumnie
                   % trzech warunków początkowych w kolejnych wierszach

%% czasy jazdy                 
t1=3; 
t2=4; 
t3=7; 
t4=8;
t5=11; 
t6=12; 
t7=18;
t8=19;
t9=30;
t10=31; 
t11=39; 
t12=40; 
t13=50;


for i=1:length(t)
    act_t=i*dt;
    psi = eta(3,i); %aktualna orientacja w rad
    %Jakobian macierzy:
    J_psi=[cos(psi),-sin(psi),0;
           sin(psi),cos(psi),0;
           0,0,1];
      
    if (act_t<=t1)
        omega_1=(80/(2*pi*a))*2*pi/(t1);
        omega_2=(80/(2*pi*a))*2*pi/(t1);
    elseif (act_t>t1) && (act_t<=t2) 
        omega_1=-(d_w*pi/2)*2*pi/(2*pi*a)*(t2-t1);
        omega_2=(d_w*pi/2)*2*pi/(2*pi*a)*(t2-t1);
    elseif (act_t>t2) && (act_t<=t3) 
        omega_1=(150/(2*pi*a))*2*pi/(t3-t2);
        omega_2=(150/(2*pi*a))*2*pi/(t3-t2);
    elseif (act_t>t3) && (act_t<=t4)
        omega_1=-(d_w*pi/2)*2*pi/(2*pi*a)*(t4-t3);
        omega_2=(d_w*pi/2)*2*pi/(2*pi*a)*(t4-t3);
    elseif (act_t>t4) && (act_t<=t5)
        omega_1=(50/(2*pi*a))*2*pi/(t5-t4);
        omega_2=(50/(2*pi*a))*2*pi/(t5-t4);
    elseif (act_t>t5) && (act_t<=t6)
       omega_1=(d_w*pi/2)*2*pi/(2*pi*a)*(t6-t5);
        omega_2=-(d_w*pi/2)*2*pi/(2*pi*a)*(t6-t5);
    elseif (act_t>t6) && (act_t<=t7)
       omega_1=(100/(2*pi*a))*2*pi/(t7-t6);
        omega_2=(100/(2*pi*a))*2*pi/(t7-t6);
    elseif (act_t>t7) && (act_t<=t8)
      omega_1=(d_w*pi/2)*2*pi/(2*pi*a)*(t8-t7);
        omega_2=-(d_w*pi/2)*2*pi/(2*pi*a)*(t8-t7);
    elseif (act_t>t8) && (act_t<=t9)
      omega_1=(300/(2*pi*a))*2*pi/(t9-t8);
        omega_2=(300/(2*pi*a))*2*pi/(t9-t8);
   elseif (act_t>t9) && (act_t<=t10)
        omega_1=-(d_w*pi/2)*2*pi/(2*pi*a)*(t10-t9);
        omega_2=(d_w*pi/2)*2*pi/(2*pi*a)*(t10-t9);
   elseif (act_t>t10) && (act_t<=t11)
       disp('t10 t11');
       omega_1=(150/(2*pi*a))*2*pi/(t11-t10);
        omega_2=(150/(2*pi*a))*2*pi/(t11-t10);
     elseif (act_t>t11) && (act_t<=t12)
         disp('t11 t12');
        omega_1=-(d_w*pi/2)*2*pi/(2*pi*a)*(t12-t11);
        omega_2=(d_w*pi/2)*2*pi/(2*pi*a)*(t12-t11);
    elseif (act_t>t12) && (act_t<=t13)
        disp('t12 t13');
       omega_1=(330/(2*pi*a))*2*pi/(t13-t12);
        omega_2=(330/(2*pi*a))*2*pi/(t13-t12);
    end

    disp(omega_1);
    disp(omega_2);

    omega=[omega_1; omega_2];

    % Macierz konfiguracji koła - zakłądając, że kąty teta=45o

     W=[a/2 a/2;
        0 0;
        -a/(2*d_w) a/(2*d_w)];

    

    zeta(:,i)=W*omega;
       
    eta_dot(:,i) = J_psi*zeta(:,i);
       
    eta(:,i+1) = eta(:,i)+dt*eta_dot(:,i); % metoda Eulera
end



% %% Wydruk funkcji
%
% figure
% plot(t, eta(1,1:i),'r-');
% hold on
%
% plot(t, eta(2,1:i),'b-');
% hold on
%
% plot(t, eta(3,1:i),'g-');
%
% xlabel('t[s]');
% ylabel('x[m], y[m], \psi[rad]');
% legend('x','y','\psi'), set(gca,'fontsize',12);
%
% figure
% plot(eta(1,1:i), eta(2,1:i));
% xlabel('x[m]');
% ylabel('y[m]');
% set(gca,'fontsize',12);



l=2*l_w;
w=2*d_w;

% Współrzędne opisujące kształ platformy
mr_co=[-l/2,l/2,l/2,-l/2,-l/2;
        -w/2,-w/2,w/2,w/2,-w/2];

figure
for i=1:length(t) % początek animacji
x=[0 285 285 305 305 500 500 445 445 500 500 0 0 330 330 0 0 95 95 0 0]
y=[0 0 160 160 0  0 240 240 260 260 500 500 380 380 360 360 140 140 120 120 0]
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

%legend('MR','Path'), set(gca,'fontsize',12)
xlabel('x[m]'); ylabel('y[m]');
pause(0.01)
hold off
end % koniec animacji

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