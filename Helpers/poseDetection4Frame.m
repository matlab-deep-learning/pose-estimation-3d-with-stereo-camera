function [keypoints_ord,isdetected] = poseDetection4Frame(frame,object_detector,pose_detector)
    % 人物検出 object detection
    [bboxes,~,labels] = detect(object_detector,frame);
    personIdx = labels == 'person'; % 人物だけを検出 extract only 'person' label
    bboxes = bboxes(personIdx,:);
    % pandaが誤検出されるため、hが長い物をとることとする 
    % for this specific example, the panda will be detected as a person. Avoid it.
    [~,maxi] = max(bboxes(:,4));
    bboxes = bboxes(maxi,:);
%     scores = scores(personIdx);
%     labels = labels(personIdx);

% 検知された場合 if detected
    if ~isempty(bboxes)
        bbox = bboxes(1,:);
        dbbox = bboxDilate(bbox,50,size(frame,1:2)); % マージンを含めるためbboxを膨張 dilate bbox
        % 姿勢推定 pose estimation
        cropImg = frame(dbbox(2):dbbox(2)+dbbox(4),dbbox(1):dbbox(1)+dbbox(3),:);
        Iin = imresize(cropImg, pose_detector.InputSize(1:2));
        keypoints = detectPose(pose_detector,uint8(Iin*255));
        % calculate the coordinates in the original image
        keypoints_ord = originalCoord(keypoints, dbbox, pose_detector.InputSize(1:2));
        % the existence of the detection
        isdetected = true;
    else % 検知がない場合 if not detected
        isdetected = false;
    end

end

% Copyright 2021 The MathWorks, Inc.