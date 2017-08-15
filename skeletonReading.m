function [ output_args ] = skeletonReading( oldpath )
%SKELETONDISPLAY Summary of this function goes here
%   Detailed explanation goes here
actfolders = {'breakfast'  'lunch' 'working'};
FinalPath = '/media/Transcend/Jawad_DataSet_Final/';
scaleFactorCPM = 0.340;

vCount = 1;

for fold = actfolders
  videos = dir([oldpath '/' fold{1}]);
  
  for v = 3 : length(videos) % 3 for escaping . and .. 
    
    if  exist(['skels/video_' num2str(vCount) '.mat'], 'file') == 2
       vCount = vCount + 1;
       continue; 
    end
      
    skeleton = {};
    vidname = videos(v).name
    images = dir([FinalPath 'Images/video_' num2str(vCount) ]);
    skelDirs = dir([oldpath '/' fold{1} '/' vidname '/cpmSkeleton']);
    
    for sDir = 3 : length(skelDirs)
      
      skelDat = dir([oldpath '/' fold{1} '/' vidname '/cpmSkeleton/' skelDirs(sDir).name]);
      personIdentifier = str2num(skelDirs(sDir).name(end))+1;
      
      for sDat = 3: length(skelDat)
        
        fileMat = importdata([oldpath '/' fold{1} '/' vidname '/cpmSkeleton/' skelDirs(sDir).name '/' skelDat(sDat).name]);
        fileMat  =  fileMat(:,2:3)  / 0.340;
        
        frameNum = str2num(skelDat(sDat).name(4:7))+1;
        skeleton(frameNum,personIdentifier) = {fileMat};
        
      end
    end
    save(['skels/video_' num2str(vCount) '.mat'],'skeleton');
    vCount = vCount + 1;
  end
  
end


end

