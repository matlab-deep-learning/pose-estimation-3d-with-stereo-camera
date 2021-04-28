function pose_detector = loadPoseDetector(pose_detector)
    if isempty(pose_detector)
        pose_detector = posenet.PoseEstimator;
    end
end

% Copyright 2021 The MathWorks, Inc.