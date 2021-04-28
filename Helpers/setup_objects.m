%% This script is used for setting up videoreader and so on.
%% ビデオオブジェクトと関連パラメータの読み込み
video_filename1 = 'Data/Video/video1.mp4';
video_filename2 = 'Data/Video/video2.mp4';
video_property1 = VideoReader(video_filename1);
video_property2 = VideoReader(video_filename2);
frameNum1 = video_property1.NumFrames;
frameNum2 = video_property2.NumFrames;
imSize1 = [video_property1.Height, video_property1.Width];
imSize2 = [video_property2.Height, video_property2.Width];
%% 読み込み、書き込み用のオブジェクトの準備
% 読み込み用
vr1 = vision.VideoFileReader(video_filename1);
vr2 = vision.VideoFileReader(video_filename2);
% 画像の歪み補正用カメラパラメータの読み込み
load Data\cameraParams\cameraparams1.mat;
load Data\cameraParams\cameraparams2.mat;

% 前処理後の映像保存
videowrite_filename1 = 'Results/Video/video1_cor.mp4';
videowrite_filename2 = 'Results/Video/video2_cor.mp4';

% Copyright 2021 The MathWorks, Inc.