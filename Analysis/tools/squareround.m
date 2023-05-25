function squareround(h, r, c, fname)

deltal=1e-4;
l = floor(double(vpa((h-2*r)/deltal)));

sq=zeros(4*(l+c),3);
temp=linspace(r,h-r,l+1);

for i=1:c+1
    % bottom left quarter circle
    sq(i,2)=r*(1+cos(pi*(3-(i-1)/c)/2));
    sq(i,3)=r*(1+sin(pi*(3-(i-1)/c)/2));

    % top left quarter circle
    sq(i+c+l,2)=r*(1+cos(pi*(2-(i-1)/c)/2));
    sq(i+c+l,3)=r*(1+sin(pi*(2-(i-1)/c)/2))+h-2*r;

    % top right quarter circle
    sq(i+2*(c+l),2)=r*(1+cos(pi*(1-(i-1)/c)/2))+h-2*r;
    sq(i+2*(c+l),3)=r*(1+sin(pi*(1-(i-1)/c)/2))+h-2*r;

    % bottom right quarter circle
    sq(i+3*(c+l),2)=r*(1+cos(pi*(4-(i-1)/c)/2))+h-2*r;
    sq(i+3*(c+l),3)=r*(1+sin(pi*(4-(i-1)/c)/2));
end

% linear segments
sq(c+2:c+l,3)=temp(2:end-1);

sq(2*c+l+2:2*(c+l),2)=temp(2:end-1);
sq(2*c+l+2:2*(c+l),3)=h;

sq(3*c+2*l+2:3*(c+l),2)=h;
sq(3*c+2*l+2:3*(c+l),3)=fliplr(temp(2:end-1));

sq(4*c+3*l+2:4*(c+l),2)=fliplr(temp(2:end-1));

% index
sq(:,1)=linspace(1,4*(l+c),4*(l+c));

figure
plot(sq(:,2),sq(:,3))

% lines matrix
lines=zeros(4*(l+c),3);
lines(:,1)=sq(:,1);
lines(:,2)=sq(:,1);
lines(:,3)=sq(:,1)+1;
lines(end,3)=1;

% Open the file for writing
fileID = fopen(fname, 'w');

% Write the sentence to the file
fprintf(fileID, 'surf file from Luca Mazzotta\n\n'); % Add '\n' for the empty line
fprintf(fileID, [num2str(4*(l+c)),' points\n']);
fprintf(fileID, [num2str(4*(l+c)),' lines\n\n']);
fprintf(fileID, 'Points\n\n');

% Close the file
fclose(fileID);

writematrix(double(sq),fname,'Delimiter','space','WriteMode','append');

fileID = fopen(fname, 'a');
fprintf(fileID, '\n\n');
fprintf(fileID, 'Lines\n\n');
fclose(fileID);


writematrix(double(lines),fname,'Delimiter','space','WriteMode','append');
end