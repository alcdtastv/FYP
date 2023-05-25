function circle(r, c, fname)

sq=zeros(c,3);

for i=1:c
    sq(i,2)=r*(1+cos(3*pi/2-2*pi*i/c));
    sq(i,3)=r*(1+sin(3*pi/2-2*pi*i/c));
end

% index
sq(:,1)=linspace(1,c,c);

figure
plot(sq(:,2),sq(:,3))

% lines matrix
lines=zeros(c,3);
lines(:,1)=sq(:,1);
lines(:,2)=sq(:,1);
lines(:,3)=sq(:,1)+1;
lines(end,3)=1;

% Open the file for writing
fileID = fopen(fname, 'w');

% Write the sentence to the file
fprintf(fileID, 'surf file from Luca Mazzotta\n\n'); % Add '\n' for the empty line
fprintf(fileID, [num2str(c),' points\n']);
fprintf(fileID, [num2str(c),' lines\n\n']);
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
