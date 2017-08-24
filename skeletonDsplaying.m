function [ output_args ] = skeletonDsplaying( baseHDpath )
%SKELETONDSPLAYING Summary of this function goes here
%   Detailed explanation goes here

oldpath = [baseHDpath 'Jawad_DataSet_Raw/'];
actfolders = {'breakfast'  'lunch' 'working'};
FinalPath = [baseHDpath 'Jawad_DataSet_Final/'];


vCount = 1;

for fold = actfolders
    videos = dir([oldpath '/' fold{1}]);
    
    for v = 23%3 : length(videos) % 3 for escaping . and ..
        load(['skels/video_' num2str(v-2)]); % loads the skeleton variable for the current video
        
        
        images = dir([FinalPath 'Images/video_' num2str(v-2) ]);
        
        %     for im = 3 : length(images) %loop through images displaying them one by one and plotting the skeletons on top
        %         imshow([FinalPath 'Images/video_' num2str(vCount) '/' images(im).name  ]);
        %         hold on;
        %         for p = 2 : size(skeleton,2)
        %             dat = skeleton{im-2,p};
        %             if ~isempty(dat)
        %                 skelPlotter(dat);
        %             end
        %         end
        %         hold off;
        %         pause(0.05);
        %     end
        
        
        if size(skeleton,2) < 2 
                continue;
        end
        
        for frame = 1 : size(skeleton,1)
            frame
            disp(v-2);
            
            dat = skeleton{frame,2};
            if ~isempty(dat)
                disp('Identify');
                imshow([FinalPath 'Images/video_' num2str(v-2) '/' images(frame+2).name  ]);
                hold on;
                for p = 1 : size(skeleton,2)
                    Ndat = skeleton{frame,p};
                    if ~isempty(Ndat)
                        skelPlotter(Ndat,p);
                    end
                end
                hold off;
                disp('WAITING');
                waitforbuttonpress;
                                
            end
        end
        
    end
    
end


end

