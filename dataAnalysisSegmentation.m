clear all
close all
clc


reachDataParetic = {};
restDataParetic = {};
retractDataParetic = {};
stabilizeDataParetic = {};
transportDataParetic = {};

reachDataNonParetic = {};
restDataNonParetic = {};
retractDataNonParetic = {};
stabilizeDataNonParetic = {};
transportDataNonParetic = {};

%% combined 

cd 'IMU data\stroke'


folderNames = dir;
folderNames(1:2) = []; % removing the . and ..
% folderNames.name

for folderCntr = 1:length(folderNames)
%     folderCntr

    
     dataFolder = sprintf('IMU data\\stroke\\%s',folderNames(folderCntr).name)
     if ~isdir(dataFolder)
        error('Invalid directory entered');
    end
    
    filePattern = fullfile(dataFolder, '*.mat');
    fileList = dir(filePattern); % list of mat/mvnx files in that folder
    
    if isempty(fileList)
        error('No mat files in folder');
    end
    
    cd(dataFolder)
    for fileNum = 1:10,%length(fileList) % 10 for non paretic; so it is going over all the mvnx files in that folder; remove the ':1%' to go over all the files and not just the first one
 
        [folderCntr fileNum]
        savedFileName = strcat(dataFolder,'\', fileList(fileNum).name);
        load(savedFileName);
%         size(dataAll)

        % take the data from dataAll and put it into cell arrays for reach, retract etc.
        
        reachCntrBeginNP = length(reachDataNonParetic); % this will ensure that I can stack all the reach, retract etc data (from all the tasks for one participant) one after the other
        retractCntrBeginNP = length(retractDataNonParetic); % first iteration this is 0 but then it will be an index to reach for the next participant in the 'ALL' variable
        transportCntrBeginNP = length(transportDataNonParetic);
        restCntrBeginNP = length(restDataNonParetic);
        stabilizeCntrBeginNP = length(stabilizeDataNonParetic);

        
        % reach (there should be an efficient way to access the data from dataAll
       
        % reachCntrBegin+reachCntr: to ensure that i can reach data from all tasks for the participant
        for reachCntr = 1:size(reachIndex,1),
            reachDataNonParetic(reachCntrBeginNP+reachCntr,1) = {dataAll(reachIndex(reachCntr,1):reachIndex(reachCntr,2),:)};
        end
        
        % retract
        for retractCntr = 1:size(retractIndex,1),
            retractDataNonParetic(retractCntrBeginNP+retractCntr,1) = {dataAll(retractIndex(retractCntr,1):retractIndex(retractCntr,2),:)};
        end
        
        % transport
        for transportCntr = 1:size(transportIndex,1),
            transportDataNonParetic(transportCntrBeginNP+transportCntr,1) = {dataAll(transportIndex(transportCntr,1):transportIndex(transportCntr,2),:)};
        end
        
        % rest
        for restCntr = 1:size(restIndex,1),
            restDataNonParetic(restCntrBeginNP+restCntr,1) = {dataAll(restIndex(restCntr,1):restIndex(restCntr,2),:)};
        end
        
         % stabilize
        for stabilizeCntr = 1:size(stabilizeIndex,1),
            stabilizeDataNonParetic(stabilizeCntrBeginNP+stabilizeCntr,1) = {dataAll(stabilizeIndex(stabilizeCntr,1):stabilizeIndex(stabilizeCntr,2),:)};
        end
        
        
        %%%%%%
        
    end
    
    % saving all the segmented data; from now on for this participant the
    % data for all reaches, retracts, stabilize, etc. (For both TP and can,)
    % are in this mat file. If you want to segment by object, you will have
    % to run this code again with only the specified object in the folder
    cd('SegmentedData')
%    cd 'C:\Users\parnaa01\Box Sync\Old IMU data\other\segmented data'
    save('segmentedDataNonParetic.mat','reachDataNonParetic','retractDataNonParetic','transportDataNonParetic','restDataNonParetic','stabilizeDataNonParetic');
    cd ..
    
    for fileNum = 11:20,%length(fileList) % 10 for non paretic; so it is going over all the mvnx files in that folder; remove the ':1%' to go over all the files and not just the first one
        % use different values for 441 (5:8) and 482 (11:19%)
        [folderCntr fileNum]
        savedFileName = strcat(dataFolder,'\', fileList(fileNum).name);
        load(savedFileName);
%         size(dataAll)

        % take the data from dataAll and put it into cell arrays for reach, retract etc.
        
        reachCntrBeginP = length(reachDataParetic); % this will ensure that I can stack all the reach, retract etc data (from all the tasks for one participant) one after the other
        retractCntrBeginP = length(retractDataParetic);
        transportCntrBeginP = length(transportDataParetic);
        restCntrBeginP = length(restDataParetic);
        stabilizeCntrBeginP = length(stabilizeDataParetic);

        
        % reach (there should be an efficient way to access the data from dataAll
       
        % reachCntrBegin+reachCntr: to ensure that i can reach data from all tasks for the participant
        for reachCntr = 1:size(reachIndex,1),
            reachDataParetic(reachCntrBeginP+reachCntr,1) = {dataAll(reachIndex(reachCntr,1):reachIndex(reachCntr,2),:)};
        end
        
        % retract
        for retractCntr = 1:size(retractIndex,1),
            retractDataParetic(retractCntrBeginP+retractCntr,1) = {dataAll(retractIndex(retractCntr,1):retractIndex(retractCntr,2),:)};
        end
        
        % transport
        for transportCntr = 1:size(transportIndex,1),
            transportDataParetic(transportCntrBeginP+transportCntr,1) = {dataAll(transportIndex(transportCntr,1):transportIndex(transportCntr,2),:)};
        end
        
        % rest
        for restCntr = 1:size(restIndex,1),
            restDataParetic(restCntrBeginP+restCntr,1) = {dataAll(restIndex(restCntr,1):restIndex(restCntr,2),:)};
        end
        
         % stabilize
        for stabilizeCntr = 1:size(stabilizeIndex,1),
            stabilizeDataParetic(stabilizeCntrBeginP+stabilizeCntr,1) = {dataAll(stabilizeIndex(stabilizeCntr,1):stabilizeIndex(stabilizeCntr,2),:)};
        end


    end
    
    % saving all the segmented data; 

    cd('SegmentedData')
% cd 'C:\Users\parnaa01\Box Sync\Old IMU data\other\segmented data'
           save('segmentedDataParetic.mat','reachDataParetic','retractDataParetic','transportDataParetic','restDataParetic','stabilizeDataParetic');
    cd ..
    % need to save segmented data for the two incomplete data folders
    
end
%% if you want to split by Can and TP also
reachDataPareticCan = {};
restDataPareticCan = {};
retractDataPareticCan = {};
stabilizeDataPareticCan = {};
transportDataPareticCan = {};

reachDataNonPareticCan = {};
restDataNonPareticCan = {};
retractDataNonPareticCan = {};
stabilizeDataNonPareticCan = {};
transportDataNonPareticCan = {};

reachDataPareticTp = {};
restDataPareticTp = {};
retractDataPareticTp = {};
stabilizeDataPareticTp = {};
transportDataPareticTp = {};

reachDataNonPareticTp = {};
restDataNonPareticTp = {};
retractDataNonPareticTp = {};
stabilizeDataNonPareticTp = {};
transportDataNonPareticTp = {};

% cd '\\research-cifs.nyumc.org\research\schamm01lab\homes\parnaa01\Old IMU data Columbia\SensorData (Stroke)'
cd 'C:\Users\parnaa01\Box Sync\Old IMU data\stroke'
% cd 'C:\Users\parnaa01\Box Sync\Old IMU data\other\left paretic'
folderNames = dir;
folderNames(1:2) = []; % removing the . and ..
% folderNames.name

for folderCntr = 1:length(folderNames)
    % 4:4% for 482
%    % dont use this now % 3:3 for 441 and 6:6 for 482
    
%     dataFolder = sprintf('\\\\research-cifs.nyumc.org\\research\\schamm01lab\\homes\\parnaa01\\Old IMU data Columbia\\SensorData (Stroke)\\%s',folderNames(folderCntr).name)
     dataFolder = sprintf('C:\\Users\\parnaa01\\Box Sync\\Old IMU data\\stroke\\%s',folderNames(folderCntr).name)
% dataFolder = sprintf('C:\\Users\\parnaa01\\Box Sync\\Old IMU data\\other\\left paretic\\%s',folderNames(folderCntr).name)
      
if ~isdir(dataFolder)
        error('Invalid directory entered');
    end
    
    filePattern = fullfile(dataFolder, '*.mat');
    fileList = dir(filePattern); % list of mat/mvnx files in that folder
    
    if isempty(fileList)
        error('No mat files in folder');
    end
    
    cd(dataFolder)
    for fileNum = 1:5
        % 1:5 for NP Can
%     for fileNum = 1:10,%length(fileList) % 10 for non paretic; so it is going over all the mvnx files in that folder; remove the ':1%' to go over all the files and not just the first one
        % use different values for 441 (1:4) and 482 (1:9)
        % load the file and then store the data in variables. 
        % load the file and then store the data in variables. 
        fileNum
        savedFileName = strcat(dataFolder,'\', fileList(fileNum).name);
        load(savedFileName);
%         size(dataAll)

        % take the data from dataAll and put it into cell arrays for reach, retract etc.
        
        reachCntrBeginNPCan = length(reachDataNonPareticCan); % this will ensure that I can stack all the reach, retract etc data (from all the tasks for one participant) one after the other
        retractCntrBeginNPCan = length(retractDataNonPareticCan);
        transportCntrBeginNPCan = length(transportDataNonPareticCan);
        restCntrBeginNPCan = length(restDataNonPareticCan);
        stabilizeCntrBeginNPCan = length(stabilizeDataNonPareticCan);

        
        % reach (there should be an efficient way to access the data from dataAll
       
        % reachCntrBegin+reachCntr: to ensure that i can reach data from all tasks for the participant
        for reachCntr = 1:size(reachIndex,1),
            reachDataNonPareticCan(reachCntrBeginNPCan+reachCntr,1) = {dataAll(reachIndex(reachCntr,1):reachIndex(reachCntr,2),:)};
        end
        
        % retract
        for retractCntr = 1:size(retractIndex,1),
            retractDataNonPareticCan(retractCntrBeginNPCan+retractCntr,1) = {dataAll(retractIndex(retractCntr,1):retractIndex(retractCntr,2),:)};
        end
        
        % transport
        for transportCntr = 1:size(transportIndex,1),
            transportDataNonPareticCan(transportCntrBeginNPCan+transportCntr,1) = {dataAll(transportIndex(transportCntr,1):transportIndex(transportCntr,2),:)};
        end
        
        % rest
        for restCntr = 1:size(restIndex,1),
            restDataNonPareticCan(restCntrBeginNPCan+restCntr,1) = {dataAll(restIndex(restCntr,1):restIndex(restCntr,2),:)};
        end
        
         % stabilize
        for stabilizeCntr = 1:size(stabilizeIndex,1),
            stabilizeDataNonPareticCan(stabilizeCntrBeginNPCan+stabilizeCntr,1) = {dataAll(stabilizeIndex(stabilizeCntr,1):stabilizeIndex(stabilizeCntr,2),:)};
        end
        
        
        %%%%%%
        
    end
    
    % saving all the segmented data; from now on for this participant the
    % data for all reaches, retracts, stabilize, etc. (For both TP and can,)
    % are in this mat file. If you want to segment by object, you will have
    % to run this code again with only the specified object in the folder
    cd('SegmentedData')
% cd 'C:\Users\parnaa01\Box Sync\Old IMU data\other\segmented data'
    save('segmentedDataNonPareticCan.mat','reachDataNonPareticCan','retractDataNonPareticCan','transportDataNonPareticCan','restDataNonPareticCan','stabilizeDataNonPareticCan');
    cd ..
    
    % Non Paretic TP
    for fileNum = 6:10
        % 1:5 for NP Can
%     for fileNum = 1:10,%length(fileList) % 10 for non paretic; so it is going over all the mvnx files in that folder; remove the ':1%' to go over all the files and not just the first one
        % use different values for 441 (1:4) and 482 (1:9)
        % load the file and then store the data in variables. 
        % load the file and then store the data in variables. 
        fileNum
        savedFileName = strcat(dataFolder,'\', fileList(fileNum).name);
        load(savedFileName);
%         size(dataAll)

        % take the data from dataAll and put it into cell arrays for reach, retract etc.
        
        reachCntrBeginNPTp = length(reachDataNonPareticTp); % this will ensure that I can stack all the reach, retract etc data (from all the tasks for one participant) one after the other
        retractCntrBeginNPTp = length(retractDataNonPareticTp);
        transportCntrBeginNPTp = length(transportDataNonPareticTp);
        restCntrBeginNPTp = length(restDataNonPareticTp);
        stabilizeCntrBeginNPTp = length(stabilizeDataNonPareticTp);

        
        % reach (there should be an efficient way to access the data from dataAll
       
        % reachCntrBegin+reachCntr: to ensure that i can reach data from all tasks for the participant
        for reachCntr = 1:size(reachIndex,1),
            reachDataNonPareticTp(reachCntrBeginNPTp+reachCntr,1) = {dataAll(reachIndex(reachCntr,1):reachIndex(reachCntr,2),:)};
        end
        
        % retract
        for retractCntr = 1:size(retractIndex,1),
            retractDataNonPareticTp(retractCntrBeginNPTp+retractCntr,1) = {dataAll(retractIndex(retractCntr,1):retractIndex(retractCntr,2),:)};
        end
        
        % transport
        for transportCntr = 1:size(transportIndex,1),
            transportDataNonPareticTp(transportCntrBeginNPTp+transportCntr,1) = {dataAll(transportIndex(transportCntr,1):transportIndex(transportCntr,2),:)};
        end
        
        % rest
        for restCntr = 1:size(restIndex,1),
            restDataNonPareticTp(restCntrBeginNPTp+restCntr,1) = {dataAll(restIndex(restCntr,1):restIndex(restCntr,2),:)};
        end
        
         % stabilize
        for stabilizeCntr = 1:size(stabilizeIndex,1),
            stabilizeDataNonPareticTp(stabilizeCntrBeginNPTp+stabilizeCntr,1) = {dataAll(stabilizeIndex(stabilizeCntr,1):stabilizeIndex(stabilizeCntr,2),:)};
        end
        
        
        %%%%%%
        
    end
    
    % saving all the segmented data; from now on for this participant the
    % data for all reaches, retracts, stabilize, etc. (For both TP and can,)
    % are in this mat file. If you want to segment by object, you will have
    % to run this code again with only the specified object in the folder
    cd('SegmentedData')
% cd 'C:\Users\parnaa01\Box Sync\Old IMU data\other\segmented data'
    save('segmentedDataNonPareticTp.mat','reachDataNonPareticTp','retractDataNonPareticTp','transportDataNonPareticTp','restDataNonPareticTp','stabilizeDataNonPareticTp');
    cd ..
    
    % Paretic Can
    for fileNum = 11:15,%length(fileList) % 10 for non paretic; so it is going over all the mvnx files in that folder; remove the ':1%' to go over all the files and not just the first one
        % use different values for 441 (5:8) and 482 (10:19)
        fileNum
        savedFileName = strcat(dataFolder,'\', fileList(fileNum).name);
        load(savedFileName);
%         size(dataAll)

        % take the data from dataAll and put it into cell arrays for reach, retract etc.
        
        reachCntrBeginPCan = length(reachDataPareticCan); % this will ensure that I can stack all the reach, retract etc data (from all the tasks for one participant) one after the other
        retractCntrBeginPCan = length(retractDataPareticCan);
        transportCntrBeginPCan = length(transportDataPareticCan);
        restCntrBeginPCan = length(restDataPareticCan);
        stabilizeCntrBeginPCan = length(stabilizeDataPareticCan);

        
        % reach (there should be an efficient way to access the data from dataAll
       
        % reachCntrBegin+reachCntr: to ensure that i can reach data from all tasks for the participant
        for reachCntr = 1:size(reachIndex,1),
            reachDataPareticCan(reachCntrBeginPCan+reachCntr,1) = {dataAll(reachIndex(reachCntr,1):reachIndex(reachCntr,2),:)};
        end
        
        % retract
        for retractCntr = 1:size(retractIndex,1),
            retractDataPareticCan(retractCntrBeginPCan+retractCntr,1) = {dataAll(retractIndex(retractCntr,1):retractIndex(retractCntr,2),:)};
        end
        
        % transport
        for transportCntr = 1:size(transportIndex,1),
            transportDataPareticCan(transportCntrBeginPCan+transportCntr,1) = {dataAll(transportIndex(transportCntr,1):transportIndex(transportCntr,2),:)};
        end
        
        % rest
        for restCntr = 1:size(restIndex,1),
            restDataPareticCan(restCntrBeginPCan+restCntr,1) = {dataAll(restIndex(restCntr,1):restIndex(restCntr,2),:)};
        end
        
         % stabilize
        for stabilizeCntr = 1:size(stabilizeIndex,1),
            stabilizeDataPareticCan(stabilizeCntrBeginPCan+stabilizeCntr,1) = {dataAll(stabilizeIndex(stabilizeCntr,1):stabilizeIndex(stabilizeCntr,2),:)};
        end


    end
    
    % saving all the segmented data; 

    cd('SegmentedData')
% cd 'C:\Users\parnaa01\Box Sync\Old IMU data\other\segmented data'
        save('segmentedDataPareticCan.mat','reachDataPareticCan','retractDataPareticCan','transportDataPareticCan','restDataPareticCan','stabilizeDataPareticCan');
    cd ..
    % need to save segmented data for the two incomplete data folders
    
    
    % Paretic Tp
    for fileNum = 16:20,%length(fileList) % 10 for non paretic; so it is going over all the mvnx files in that folder; remove the ':1%' to go over all the files and not just the first one
        % use 16:19% for 482
        % dont use this: use different values for 441 (5:8) and 482 (10:19)
        fileNum
        savedFileName = strcat(dataFolder,'\', fileList(fileNum).name);
        load(savedFileName);
%         size(dataAll)

        % take the data from dataAll and put it into cell arrays for reach, retract etc.
        
        reachCntrBeginPTp = length(reachDataPareticTp); % this will ensure that I can stack all the reach, retract etc data (from all the tasks for one participant) one after the other
        retractCntrBeginPTp = length(retractDataPareticTp);
        transportCntrBeginPTp = length(transportDataPareticTp);
        restCntrBeginPTp = length(restDataPareticTp);
        stabilizeCntrBeginPTp = length(stabilizeDataPareticTp);

        
        % reach (there should be an efficient way to access the data from dataAll
       
        % reachCntrBegin+reachCntr: to ensure that i can reach data from all tasks for the participant
        for reachCntr = 1:size(reachIndex,1),
            reachDataPareticTp(reachCntrBeginPTp+reachCntr,1) = {dataAll(reachIndex(reachCntr,1):reachIndex(reachCntr,2),:)};
        end
        
        % retract
        for retractCntr = 1:size(retractIndex,1),
            retractDataPareticTp(retractCntrBeginPTp+retractCntr,1) = {dataAll(retractIndex(retractCntr,1):retractIndex(retractCntr,2),:)};
        end
        
        % transport
        for transportCntr = 1:size(transportIndex,1),
            transportDataPareticTp(transportCntrBeginPTp+transportCntr,1) = {dataAll(transportIndex(transportCntr,1):transportIndex(transportCntr,2),:)};
        end
        
        % rest
        for restCntr = 1:size(restIndex,1),
            restDataPareticTp(restCntrBeginPTp+restCntr,1) = {dataAll(restIndex(restCntr,1):restIndex(restCntr,2),:)};
        end
        
         % stabilize
        for stabilizeCntr = 1:size(stabilizeIndex,1),
            stabilizeDataPareticTp(stabilizeCntrBeginPTp+stabilizeCntr,1) = {dataAll(stabilizeIndex(stabilizeCntr,1):stabilizeIndex(stabilizeCntr,2),:)};
        end


    end
    
    % saving all the segmented data; 

    cd('SegmentedData')
% cd 'C:\Users\parnaa01\Box Sync\Old IMU data\other\segmented data'
        save('segmentedDataPareticTp.mat','reachDataPareticTp','retractDataPareticTp','transportDataPareticTp','restDataPareticTp','stabilizeDataPareticTp');
    cd ..
    % need to save segmented data for the two incomplete data folders
    
end

pause
disp('paused')
%% to save data by movement i.e reach, retract etc. 
clear all

cd 'C:\Users\parnaa01\Box Sync\Old IMU data\stroke'
% cd 'C:\Users\parnaa01\Box Sync\Old IMU data\other\left paretic'
folderNames = dir;
folderNames(1:2) = []; % removing the . and ..

for folderCntr = 1:length(folderNames)
    folderCntr
    dataFolder = sprintf('C:\\Users\\parnaa01\\Box Sync\\Old IMU data\\stroke\\%s\\SegmentedData',folderNames(folderCntr).name)
%    dataFolder = sprintf('C:\\Users\\parnaa01\\Box Sync\\Old IMU data\\other\\left paretic\\%s\\SegmentedData',folderNames(folderCntr).name)
    
    if ~isdir(dataFolder)
        error('Invalid directory entered');
    end
    
    filePattern = fullfile(dataFolder, '*.mat');
    fileList = dir(filePattern); % list of mat/mvnx files in that folder
    
    if isempty(fileList)
        error('No mat files in folder');
    end
    
    cd(dataFolder)
%     % now you will have only two data files: paretic and non_paretic. inside these files you will have the different movements.  
%    % for loading combined paretic and non paretic
    load('segmentedDataNonParetic.mat')
    load('segmentedDataParetic.mat')
    
    reachDataPareticAll(folderCntr,1) = {reachDataParetic}; % each element in this cell array will have reach data from one participant; that cell will contain all the reaches from this particpant
    retractDataPareticAll(folderCntr,1) = {retractDataParetic};
    transportDataPareticAll(folderCntr,1) = {transportDataParetic};    
    restDataPareticAll(folderCntr,1) = {restDataParetic};
    stabilizeDataPareticAll(folderCntr,1) = {stabilizeDataParetic};

    reachDataNonPareticAll(folderCntr,1) = {reachDataNonParetic};
    retractDataNonPareticAll(folderCntr,1) = {retractDataNonParetic};
    transportDataNonPareticAll(folderCntr,1) = {transportDataNonParetic};    
    restDataNonPareticAll(folderCntr,1) = {restDataNonParetic};
    stabilizeDataNonPareticAll(folderCntr,1) = {stabilizeDataNonParetic};
    
    
    % for loading combined pareticCan and non pareticCan
    load('segmentedDataNonPareticCan.mat')
    load('segmentedDataPareticCan.mat')
    
    reachDataPareticCanAll(folderCntr,1) = {reachDataPareticCan}; % each element in this cell array will have reach data from one participant; that cell will contain all the reaches from this particpant
    retractDataPareticCanAll(folderCntr,1) = {retractDataPareticCan};
    transportDataPareticCanAll(folderCntr,1) = {transportDataPareticCan};    
    restDataPareticCanAll(folderCntr,1) = {restDataPareticCan};
    stabilizeDataPareticCanAll(folderCntr,1) = {stabilizeDataPareticCan};

    reachDataNonPareticCanAll(folderCntr,1) = {reachDataNonPareticCan};
    retractDataNonPareticCanAll(folderCntr,1) = {retractDataNonPareticCan};
    transportDataNonPareticCanAll(folderCntr,1) = {transportDataNonPareticCan};    
    restDataNonPareticCanAll(folderCntr,1) = {restDataNonPareticCan};
    stabilizeDataNonPareticCanAll(folderCntr,1) = {stabilizeDataNonPareticCan};
    
    
    % for loading combined pareticCan and non pareticCan
    load('segmentedDataNonPareticTp.mat')
    load('segmentedDataPareticTp.mat')
    
    reachDataPareticTpAll(folderCntr,1) = {reachDataPareticTp}; % each element in this cell array will have reach data from one participant; that cell will contain all the reaches from this particpant
    retractDataPareticTpAll(folderCntr,1) = {retractDataPareticTp};
    transportDataPareticTpAll(folderCntr,1) = {transportDataPareticTp};    
    restDataPareticTpAll(folderCntr,1) = {restDataPareticTp};
    stabilizeDataPareticTpAll(folderCntr,1) = {stabilizeDataPareticTp};

    reachDataNonPareticTpAll(folderCntr,1) = {reachDataNonPareticTp};
    retractDataNonPareticTpAll(folderCntr,1) = {retractDataNonPareticTp};
    transportDataNonPareticTpAll(folderCntr,1) = {transportDataNonPareticTp};    
    restDataNonPareticTpAll(folderCntr,1) = {restDataNonPareticTp};
    stabilizeDataNonPareticTpAll(folderCntr,1) = {stabilizeDataNonPareticTp};
 
    folderCntr
    
  
end
  cd('C:\Users\parnaa01\Box Sync\Old IMU data\segmented data');
    save('reachDataPareticAll.mat','reachDataPareticAll');
    save('retractDataPareticAll.mat','retractDataPareticAll');
    save('transportDataPareticAll.mat','transportDataPareticAll');
    save('restDataPareticAll.mat','restDataPareticAll');
    save('stabilizeDataPareticAll.mat','stabilizeDataPareticAll');
    
    save('reachDataNonPareticAll.mat','reachDataNonPareticAll');
    save('retractDataNonPareticAll.mat','retractDataNonPareticAll');
    save('transportDataNonPareticAll.mat','transportDataNonPareticAll');
    save('restDataNonPareticAll.mat','restDataNonPareticAll');
    save('stabilizeDataNonPareticAll.mat','stabilizeDataNonPareticAll');
    
    save('reachDataPareticCanAll.mat','reachDataPareticCanAll');
    save('retractDataPareticCanAll.mat','retractDataPareticCanAll');
    save('transportDataPareticCanAll.mat','transportDataPareticCanAll');
    save('restDataPareticCanAll.mat','restDataPareticCanAll');
    save('stabilizeDataPareticCanAll.mat','stabilizeDataPareticCanAll');
    
    save('reachDataNonPareticCanAll.mat','reachDataNonPareticCanAll');
    save('retractDataNonPareticCanAll.mat','retractDataNonPareticCanAll');
    save('transportDataNonPareticCanAll.mat','transportDataNonPareticCanAll');
    save('restDataNonPareticCanAll.mat','restDataNonPareticCanAll');
    save('stabilizeDataNonPareticCanAll.mat','stabilizeDataNonPareticCanAll');
    
    save('reachDataPareticTpAll.mat','reachDataPareticTpAll');
    save('retractDataPareticTpAll.mat','retractDataPareticTpAll');
    save('transportDataPareticTpAll.mat','transportDataPareticTpAll');
    save('restDataPareticTpAll.mat','restDataPareticTpAll');
    save('stabilizeDataPareticTpAll.mat','stabilizeDataPareticTpAll');
    
    save('reachDataNonPareticTpAll.mat','reachDataNonPareticTpAll');
    save('retractDataNonPareticTpAll.mat','retractDataNonPareticTpAll');
    save('transportDataNonPareticTpAll.mat','transportDataNonPareticTpAll');
    save('restDataNonPareticTpAll.mat','restDataNonPareticTpAll');
    save('stabilizeDataNonPareticTpAll.mat','stabilizeDataNonPareticTpAll');
    
    
    
    cd ..