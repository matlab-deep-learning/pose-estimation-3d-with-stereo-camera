function cor_img = preprocess_for_video2Frames(img)
    imgInv = imcomplement(img);
    cor_imgInv = imreducehaze(imgInv, 'ContrastEnhancement','none');
    cor_img = imcomplement(cor_imgInv);
end

% Copyright 2021 The MathWorks, Inc.