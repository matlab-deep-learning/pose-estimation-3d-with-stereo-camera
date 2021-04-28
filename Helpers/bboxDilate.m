function dbbox = bboxDilate(bbox,marginLength,imSize)
    %% this function dilates bbox マージンを含ませるためbboxを膨張する
    dbbox = bbox;
    dbbox(:,1:2) = dbbox(:,1:2)- marginLength;
    dbbox(:,3:4) = dbbox(:,3:4) + marginLength*2;
    dbbox(dbbox(:,1) < 1,1) = 1; % xが1未満になっている場合1に
    dbbox(dbbox(:,2) < 1,2) = 1; % yが1未満になっている場合1に
    dbbox(imSize(2)-dbbox(:,1) < dbbox(:,3),3) = imSize(2)-dbbox(imSize(2)-dbbox(:,1) < dbbox(:,3),1); % x+wが画像範囲を超えている場合修正
    dbbox(imSize(1)-dbbox(:,2) < dbbox(:,4),4) = imSize(1)-dbbox(imSize(1)-dbbox(:,2) < dbbox(:,4),2); % y+hが画像範囲を超えている場合修正
end

% Copyright 2021 The MathWorks, Inc.