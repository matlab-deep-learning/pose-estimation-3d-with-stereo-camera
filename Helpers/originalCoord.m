function keypoints_ord = originalCoord(keypoints, cropCoord, detectImSize)
    scale_x = double(cropCoord(3)) / detectImSize(2);
    scale_y = double(cropCoord(4)) / detectImSize(1);
    keypoints_ord = double(keypoints);
    keypoints_ord(:,1) = keypoints(:,1) * scale_x + double(cropCoord(1))-1;
    keypoints_ord(:,2) = keypoints(:,2) * scale_y + double(cropCoord(2))-1;
end

% Copyright 2021 The MathWorks, Inc.