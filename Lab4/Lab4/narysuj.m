function narysuj(u)

teta = u(1);
l = u(2);
t = u(3);

y=-l*cos(teta);
x=l*sin(teta);

cla
fill([-1/4 -1/4 1/4 1/4],[0.1 0 0 0.1],'r')
hold on;
line([0 x],[0 y])
plot(x,y,'r.','MarkerSize',30)
xlim([-l l])
ylim([-l 0.1])
text(-1/4,0.005,["  T = "])
hold off
axis off

drawnow