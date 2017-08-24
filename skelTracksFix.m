function [ fixedSkels ] = skelTracksFix( allSkel )
%UNTITLED Load the skeletons into the skel file using Load ALL skeleton function and pass that into the input args, 
% Function will return the skeleton tracks per each person where column
% corresponds to the person id . 
% video 1-20 , 43-62 : 1 person
% video 21-42 , 2 person
%   Detailed explanation goes here
fixedSkels = {};
for v = 1 : length(allSkel)
v
newSkel = {};
skel = allSkel{v};
history = zeros(size(skel,1),size(skel,2));
    for p=1  : size(skel,2) % perform this action for each person skeleton detected
        track = skel(1,p);        
        for frame = 2 : size(skel,1)
            currentSkelItem = skel{frame-1,p};
            minIdx = p;
            minVal = Inf;
            for nP = 1 : size(skel,2)
                nextSkelItem = skel{frame,nP};
                if ~isempty(skel{frame,nP}) && history(frame,nP)==0
                    if isempty(currentSkelItem) % case when the another skeleton is detected for first time, then just assign the next non 0 frame to it and tracking will continue from there
                        minIdx = nP;
                        minVal = 0;
                        break;
                    end
                    val = compareSkels(currentSkelItem,nextSkelItem); 
                    if val < minVal
                        minIdx = nP;
                        minVal = val;
                    end
                end
            end
            
            track(frame,1) = skel(frame,minIdx);
            history(frame,minIdx) = p;
        end 
        newSkel = [newSkel track];
    end
    fixedSkels = [fixedSkels;{newSkel}];
end

end

