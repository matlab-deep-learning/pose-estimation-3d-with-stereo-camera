function object_detector = loadObjectDetector(object_detector)
    if isempty(object_detector)
        object_detector = yolov3ObjectDetector('darknet53-coco'); % R2021a is necessary
    end
end

% Copyright 2021 The MathWorks, Inc.