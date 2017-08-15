function [ output_args ] = skelPlotter( mat,personId )
%SKELPLOTTER takes in matrix ordered in the right configuration of joints
%as defined by the following. And takes in the image figure and plots the
%skel on the image figure. 


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



plot([...
      mat(1,1),mat(2,1),... % main center
      mat(15,1),mat(9,1),mat(10,1),mat(11,1),NaN,... % right leg
      mat(15,1),mat(12,1),mat(13,1),mat(14,1),NaN,... % left leg
      mat(2,1),mat(3,1),mat(4,1),mat(5,1),NaN,... % right arm
      mat(2,1),mat(6,1),mat(7,1),mat(8,1),NaN,... % left arm
      mat(9,1),mat(12,1),... % hip connector
      ],...
      [...
      mat(1,2),mat(2,2),... % main center
      mat(15,2),mat(9,2),mat(10,2),mat(11,2),NaN,... % right leg
      mat(15,2),mat(12,2),mat(13,2),mat(14,2),NaN,... % left leg
      mat(2,2),mat(3,2),mat(4,2),mat(5,2),NaN,... % right arm
      mat(2,2),mat(6,2),mat(7,2),mat(8,2),NaN,... % left arm
      mat(9,2),mat(12,2),... % hip connector
      ]...
      ,'LineWidth',3);

scatter(mat(:,1),mat(:,2),'*','r');

text(mat(1,1),mat(1,2)-15,['Person-' num2str(personId)],'Color','r');

end

