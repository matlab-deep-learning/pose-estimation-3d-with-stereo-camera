function visualizeKeyPoints_in_3D(ax, pose_detector, keypointsWorld)
%% this fuction is used for the visualization of detected keypoints in 3D
    skeleton = pose_detector.SkeletonConnectionMap;
    numEdges = size(skeleton,1);
    cmapEdges = hsv(numEdges);
    
    % Plot edges and nodes
    pts = keypointsWorld;
    posX = [pts(skeleton(:,1),1)';pts(skeleton(:,2),1)'];
    posY = [pts(skeleton(:,1),2)';pts(skeleton(:,2),2)'];
    posZ = [pts(skeleton(:,1),3)';pts(skeleton(:,2),3)'];
%    validIdxEdge = all(pos(:,[3 6])>0, 2);
    
%    pos = pos(validIdxEdge,[1,2,4,5]);
%    cmaps_temp = cmapEdges(validIdxEdge,:);
    
    hold(ax,'on');
    plot3(ax,posX,posY,posZ)
    plot3(ax,pts(:,1),pts(:,2),pts(:,3),'MarkerSize',500,'MarkerEdgeColor','r','MarkerFaceColor','r','LineStyle','none')
end

% Copyright 2021 The MathWorks, Inc.