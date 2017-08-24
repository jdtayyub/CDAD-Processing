function [ skels ] = LoadAllSkeletonsIntoSingleVar( path )
%Function goes into the skel directory reads each skel mat file and saves
%it into a single cell file. 
%   Detailed explanation goes here
files = dir(path);
skels = {};
for f = 3 : length(files)
    load([path files(f).name]);
    skels = [skels; {skeleton}];
end

end

