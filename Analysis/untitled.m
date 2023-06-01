fname = './circleKn_results/circle.txt'


surf=readmatrix(fname);

surf=surf(1:find(all(surf == [1, 1, 2], 2))-2,:);

h=surf(length(surf)/2,3);

surf(end+1,:)=surf(1,:);


% calculating coordinates of centre points of surface segments with respect
% to the centre of the square
points=double(vpa(surf(2:end,2:3)+surf(1:end-1,2:3)))./2-h/2;


% calculating clockwise angle between negative x and points
anglerotated= 180 - mod(atan2d(points(:,2),points(:,1)), 360);
anglerotated(length(anglerotated)/2:end) = anglerotated(length(anglerotated)/2:end) + 360 * (anglerotated(length(anglerotated)/2:end) < 0);


%converting angles into distance from centre of left side of square
squarecoord=zeros(length(surf)-1,1);

squarecoord(anglerotated >= -45 & anglerotated <= 45) = 0.5 * tand(anglerotated(anglerotated >= -45 & anglerotated <= 45) + 0);

squarecoord(anglerotated > 45 & anglerotated <= 135) = 0.5 * tand(anglerotated(anglerotated > 45 & anglerotated <= 135) - 90) + 1;

squarecoord(anglerotated > 135 & anglerotated <= 225) = 0.5 * tand(anglerotated(anglerotated > 135 & anglerotated <= 225) - 180) + 2;

squarecoord(anglerotated > 225 & anglerotated <= 360) = 0.5 * tand(anglerotated(anglerotated > 225 & anglerotated <= 360) - 270) + 3;

squarecoord(anglerotated > -135 & anglerotated < -45) = 0.5 * tand(anglerotated(anglerotated > -135 & anglerotated < -45) + 90) - 1;

returnarray = [anglerotated, squarecoord];
