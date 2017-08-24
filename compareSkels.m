function [sumDiff, meanSumDiff ] = compareSkels( sk1,sk2 )
%COMPARESKELS Takes in two skeletons and computes the similairty between
%them based on torso, head, neck hip and shoulders.

%%%LEGEND JOINTS%%%%

% 1. head
% 2. neck
% 3. r-shoulder
% 4. r-elbow
% 5. r-hand
% 6. l-shoulder
% 7. l-elbow
% 8. l-hand
% 9. r-hip
% 10. r-knee
% 11. r-foot
% 12. l-hip
% 13. l-hand
% 14. l-foot
% 15. torso

%%%%%%%%%%%%%%%%%%%%

%   Detailed explanation goes here
joints2cmp = [1;2;3;6;9;12;15];
sumDiff = sum(sum(abs(sk1(joints2cmp,:) - sk2(joints2cmp,:))));
meanSumDiff = mean(mean(abs(sk1(joints2cmp,:) - sk2(joints2cmp,:))));


end

