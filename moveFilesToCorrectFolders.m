function [ output_args ] = moveFilesToCorrectFolders( oldpath )
%MOVEFILESTOCORRECTFOLDERS Summary of this function goes here
%   Detailed explanation goes here
vidPath = '/usr/not-backed-up/vids/';
actfolders = {'breakfast'  'lunch' 'working'};

FinalPath = '/media/Transcend/Jawad_DataSet_Final/';

% mkdir([FinalPath 'Annotations']);
% mkdir([FinalPath 'Images']);
% mkdir([FinalPath 'Point Clouds']);
% mkdir([FinalPath 'Skeletons']);
% mkdir([FinalPath 'Videos']);


vCount = 1;
%move videos from usr notbackup to harddisk
for fold = actfolders
  videos = dir([oldpath '/' fold{1}]);
  
  for v = 3 : length(videos) % 3 for escaping . and .. 
    
    
    %mkdir([FinalPath 'Images/video_' num2str(vCount)]);
    %mkdir([FinalPath 'Skeletons/video_' num2str(vCount)]);
    %mkdir([FinalPath 'Annotations/video_' num2str(vCount)]);
    
    vidName = videos(v).name;
    
    %move the video
    %movefile([vidPath vidName '.mp4'] , [FinalPath 'Videos/video_' num2str(vCount) '.mp4' ]);
    
    %move the images
    %imagesDir = [oldpath '/' fold{1} '/' videos(v).name '/kinect_rgb/' ];
    %movefile([imagesDir '*'],[FinalPath 'Images/video_' num2str(vCount) '/']);
    
    
     
    vCount = vCount + 1 ;
    
  end
  
  
end


end

