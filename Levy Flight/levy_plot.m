% Plot levy steps 

% Coded by Hemanth Manjunatha on 21 Feb 2019

n = 200; %number of steps
m = 2;  % m     -> Number of Dimensions 
        % beta  -> Power law index  % Note: 1 < beta < 2

[x,y,z] = deal(zeros(n,3));
figure(1)
hold on

d = levy(n,m,1.4); % generate the steps 
h = animatedline;
l = 1:10;

for i = 2:length(d) % use those steps 

    x(i)= x(i-1)+d(i,1);
    y(i)= y(i-1)+d(i,2);


end

% %define the tail formated structure
% Tail = struct('LineStyle','--','Marker','*','Color','c',...
%   'LineWidth',2,'MarkerSize',4);
% %define the head formated structure
% Head = struct('LineStyle','none','Marker','s','Color','g','MarkerSize',10);
% 
% %Invoke the comet plot with 50 Hz playback, and a tail length of 50 pts
% varargout = PlotComet_3D(x(:,1),y(:,1),z(:,1), 'cometa', 'Frequency',n,'blockSize',50000000);
 %comet(x(:,1),y(:,1));
v = VideoWriter('L3 Orbits', 'MPEG-4');
v.FrameRate = 100;
open(v);
for k = 1:5
    comet(x(:,1),y(:,1));
    numFramesPerTrajectory = 100;
    movieVector = struct('cdata', cell(1, numFramesPerTrajectory), 'colormap', cell(1, numFramesPerTrajectory));
    for frame = 1:numFramesPerTrajectory
        drawnow;
        movieVector(frame) = getframe(gcf);

    end
    writeVideo(v, movieVector);
end
close(v); 
% plot
%line(x,y,z)
grid on
hold off
% h = animatedline;
% axis([0 4*pi -1 1])
% x = linspace(0,4*pi,2000);
% 
% for k = 1:length(x)
%     y = sin(x(k));
%     addpoints(h,x(k),y);
%     drawnow
% end