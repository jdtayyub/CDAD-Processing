function [ output_args ] = makeVideoFilesFromRGB( path )
%MAKEVIDEOFILESFROMRGB Summary of this function goes here
%   Detailed explanation goes here
actfolders = {'breakfast'  'lunch' 'working'};
savePath = '/usr/not-backed-up/vids/';


for fold = actfolders
  videos = dir([path '/' fold{1}]);
  
  for v = 3 : length(videos) % 3 for escaping . and .. 
    imagesDir = [path '/' fold{1} '/' videos(v).name '/kinect_rgb/' ];
    list = dir(imagesDir);
    imageExtension = list(3).name(end-2:end);
    
    if exist([savePath videos(v).name '.mp4'], 'file') == 2
      continue;
    end
    
    [status,output] = system(['ffmpeg  -i ' imagesDir 'Kinect_%04d.' imageExtension ' -s 640x480  -vcodec libx264 -crf 30'...
                      ' ' savePath 'temp.mp4']);
                    
    if status == 0
      movefile([savePath 'temp.mp4'] , [savePath videos(v).name '.mp4']);
    else
      disp('error');
    end
    
  end
  
end

end

