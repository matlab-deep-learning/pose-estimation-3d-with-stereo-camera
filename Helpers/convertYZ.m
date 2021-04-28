function converted_data = convertYZ(data)
%% this function exchanges Y and Z axis in input coordinates
    T = [1 0 0;0 0 1;0 -1 0];
    converted_data = data * T;
end

% Copyright 2021 The MathWorks, Inc.