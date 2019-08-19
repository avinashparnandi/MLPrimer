%% this code is for sanity check 
% ensure that all the mvnx/mat files can be loaded
% ensure that all the begin and ends match
% 

clear all
close all
clc

%% load one of the data files

cd '\\research-cifs.nyumc.org\research\schamm01lab\homes\parnaa01\Old IMU data Columbia\SensorData (Stroke)'
folderNames = dir;
folderNames(1:2) = []; % removing the . and ..
% patientName = {'Q275', };

% store the names of all the mvnx files and load them one at a time.
% Parse/segment them and store the statistical values.
%%
for folderCntr = 1:1%length(folderNames)
    dataFolder = sprintf('\\\\research-cifs.nyumc.org\\research\\schamm01lab\\homes\\parnaa01\\Old IMU data Columbia\\SensorData (Stroke)\\%s',folderNames(folderCntr).name)    

% dataFolder = '\\research-cifs.nyumc.org\research\schamm01lab\homes\parnaa01\Old IMU data Columbia\SensorData (Stroke)\Q275';
if ~isdir(dataFolder)
    error('Invalid directory entered');
end

filePattern = fullfile(dataFolder, '*.mat');
fileList = dir(filePattern);

if isempty(fileList)
   error('No mvnx files in folder');
end

cd(dataFolder)


% load('Q275_nonparetic_active_radialcan_t1.mvnx.mat') 
% load('Q275_nonparetic_active_radialcan_t2.mvnx.mat') 
% load('Q275_paretic_active_radialcan_t1.mvnx.mat')

%%
for fileNum = 1:length(fileList)
% load the file and then store the data

savedFileName = strcat(dataFolder,'\', fileList(fileNum).name);
load(savedFileName);

% sensorDataAcc2 = tree2.acceleration; % this is a struct with Acc for 23 (?) sensors in 3 dimensions
% sensorDataPos2 = tree2.position; 
% sensorDataOri2 = tree2.orientation; 
% sensorDataVel2 = tree2.velocity; 
% sensorDataAngVel2 = tree2.angularVelocity; 
% sensorDataAngAcc2 = tree2.angularAcceleration; 

% % data for the 11 sensors used in the previous paper
markers = tree2.Markers; % this has the markers; the marker extract directly gives you the list of markers in a collapsed format
sensorDataAcc = tree2.sensorAcceleration;
sensorDataAngVel = tree2.sensorAngularVelocity;
sensorDataOri = tree2.sensorOrientation;
sensorJointAngle1 = tree2.jointAngle;
sensorJointAngle2 = tree2.jointAngleXZY;
%%
% defining each index matrix as an empty matrix (initialization)
reachIndex=[]; retractIndex=[];retractXIndex=[];restIndex=[];transportIndex=[];transportXIndex=[];ignoreIndex=[];stabilizeIndex=[];stabilizeXIndex=[];iIndex=[];iXIndex =[];
j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'rest','IgnoreCase',true)) % if the markerextract contains the word ret; note down the location
       restIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'rest','IgnoreCase',true))
            restIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in rest')
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'rea','IgnoreCase',true)) % if the markerextract contains the word rea; note down the location
       reachIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'rea','IgnoreCase',true))
            reachIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in reach')
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'ret_','IgnoreCase',true)) % if the markerextract contains the word ret; note down the location
       retractIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'ret_','IgnoreCase',true))
            retractIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in retract')
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'ret*','IgnoreCase',true)) % if the markerextract contains the word ret; note down the location
       retractXIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'ret*','IgnoreCase',true))
            retractXIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in retract')
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'_s_','IgnoreCase',true)) % if the markerextract contains the word s; note down the location
       stabilizeIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'_s_','IgnoreCase',true))
            stabilizeIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in stabilize')
       end
   else
       i=i+1;
   end
end


j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'_s*_','IgnoreCase',true)) % if the markerextract contains the word s; note down the location
       stabilizeXIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'_s*_','IgnoreCase',true))
            stabilizeXIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in stabilize*')
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'_t_','IgnoreCase',true)) % if the markerextract contains the word t; note down the location
       transportIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'_t_','IgnoreCase',true))
            transportIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in transport')
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'_t*_','IgnoreCase',true)) % if the markerextract contains the word t; note down the location
       transportXIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'_t*_','IgnoreCase',true))
            transportXIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in transport*')
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'_i_','IgnoreCase',true)) % if the markerextract contains the word i; note down the location
       iIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'_i_','IgnoreCase',true))
            iIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in i(?)') % not sure what i means...
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'_i*_','IgnoreCase',true)) % if the markerextract contains the word i; note down the location
       iXIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'_i*_','IgnoreCase',true))
            iXIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in i(?)') % not sure what i means...
       end
   else
       i=i+1;
   end
end

j=1;
i=1;
while i<length(markerExtract)
   if(contains(markerExtract{i},'ignore','IgnoreCase',true)) % if the markerextract contains the word ignore; note down the location
       ignoreIndex(j,1) = markerExtract{i,2};% begining
       if(contains(markerExtract{i+1},'ignore','IgnoreCase',true))
            ignoreIndex(j,2) =  markerExtract{i+1,2};% ending
            i=i+2;
            j=j+1;
       else % detect mismatch if begin is not followed by end
           disp('begin-end mismatch in ignore')
       end
   else
       i=i+1;
   end
end


% sanity check to make sure i am not missing out any marker type
indexVars = who('-regexp', 'Index'); % find variables with the word index in them

tempSize=0;
for k=1:length(indexVars)
%     k
   temp =  eval(indexVars{k});
   tempSize = tempSize + (size(temp,1)*size(temp,2));
   clearvars temp  
   
end

[folderCntr tempSize length(markerExtract)];

if (~isequal(tempSize,length(markerExtract)))
%    fileNum
    savedFileName
    error('Marker missing')
end

%% save specific marker locations; the ones that are not being used are empty matrices
% markerLocsFile = sprintf('markerLocs_%s.mat',fileList(fileNum).name)
% cd('markerlocs')
% save(markerLocsFile,'reachIndex', 'retractIndex', 'retractXIndex', 'restIndex', 'transportIndex', 'transportXIndex', 'ignoreIndex', 'stabilizeIndex', 'stabilizeXIndex', 'iIndex','iXIndex')
% cd ..
% % % need to clear the variable
% clearvars reachIndex retractIndex retractXIndex restIndex transportIndex transportXIndex ignoreIndex stabilizeIndex stabilizeXIndex iIndex iXIndex

end

end % folderCntr loop; go into each folder and check all the files