clear all
close all
clc

cd 'IMU data\segmented data\All'
fileNames = dir;
fileNames(1:2) = []; % removing the . and ..

for fileCntr = 1:length(fileNames)
       load(fileNames(fileCntr).name); % load all the mat files
end



%% Compute statistical features Paretic
% reach
for i=1:length(reachDataPareticAll)
    
  tempSize = size(reachDataPareticAll{i,1}); % size of Reach cell array for ith particpant
    for j=1: tempSize,
        
        tempReachParetic = reachDataPareticAll{i,1}{j,1}; % this has the data for the jth reach by the ith participant (in 110 dim)
            
      % windowing
        
      avgReachParetic{i,j} = mean(tempReachParetic);
      stdReachParetic{i,j} = std(tempReachParetic);
      minReachParetic{i,j} = min(tempReachParetic);
      maxReachParetic{i,j} = max(tempReachParetic);
%       %entropyReachParetic{i,j} = %entropy(tempReachParetic);
      kurtReachParetic{i,j} = kurtosis(tempReachParetic);
      skewReachParetic{i,j} = skewness(tempReachParetic);
      rmsReachParetic{i,j} = rms(tempReachParetic);
      covReachParetic{i,j} = cov(tempReachParetic);

    end
    
end


% retract
for i=1:length(retractDataPareticAll)
    
  tempSize = size(retractDataPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempRetractParetic = retractDataPareticAll{i,1}{j,1};
     
       
      avgRetractParetic{i,j} = mean(tempRetractParetic);
      stdRetractParetic{i,j} = std(tempRetractParetic);
      minRetractParetic{i,j} = min(tempRetractParetic);
      maxRetractParetic{i,j} = max(tempRetractParetic);
%       %entropyRetractParetic{i,j} = %entropy(tempRetractParetic);
      kurtRetractParetic{i,j} = kurtosis(tempRetractParetic);
      skewRetractParetic{i,j} = skewness(tempRetractParetic);
      rmsRetractParetic{i,j} = rms(tempRetractParetic);
      covRetractParetic{i,j} = cov(tempRetractParetic);

       end
    
end

% rest
for i=1:length(restDataPareticAll)
    
  tempSize = size(restDataPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempRestParetic = restDataPareticAll{i,1}{j,1};
     
      avgRestParetic{i,j} = mean(tempRestParetic);
      stdRestParetic{i,j} = std(tempRestParetic);
      minRestParetic{i,j} = min(tempRestParetic);
      maxRestParetic{i,j} = max(tempRestParetic);
%       %entropyRestParetic{i,j} = %entropy(tempRestParetic);
      kurtRestParetic{i,j} = kurtosis(tempRestParetic);
      skewRestParetic{i,j} = skewness(tempRestParetic);    
      rmsRestParetic{i,j} = rms(tempRestParetic);
      covRestParetic{i,j} = cov(tempRestParetic);
    
  end
    
end

% stabilize
for i=1:length(stabilizeDataPareticAll)
    
  tempSize = size(stabilizeDataPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempStabilizeParetic = stabilizeDataPareticAll{i,1}{j,1};

      avgStabilizeParetic{i,j} = mean(tempStabilizeParetic);
      stdStabilizeParetic{i,j} = std(tempStabilizeParetic);
      minStabilizeParetic{i,j} = min(tempStabilizeParetic);
      maxStabilizeParetic{i,j} = max(tempStabilizeParetic);
      %entropyStabilizeParetic{i,j} = %entropy(tempStabilizeParetic);
      kurtStabilizeParetic{i,j} = kurtosis(tempStabilizeParetic);
      skewStabilizeParetic{i,j} = skewness(tempStabilizeParetic);
      rmsStabilizeParetic{i,j} = rms(tempStabilizeParetic);
      covStabilizeParetic{i,j} = cov(tempStabilizeParetic);
      
  end
    
end

% tranport
for i=1:length(transportDataPareticAll)
    
  tempSize = size(transportDataPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempTransportParetic = transportDataPareticAll{i,1}{j,1};
      
     
      avgTransportParetic{i,j} = mean(tempTransportParetic);
      stdTransportParetic{i,j} = std(tempTransportParetic);
      minTransportParetic{i,j} = min(tempTransportParetic);
      maxTransportParetic{i,j} = max(tempTransportParetic);
      %entropyTransportParetic{i,j} = %entropy(tempTransportParetic);
      kurtTransportParetic{i,j} = kurtosis(tempTransportParetic);
      skewTransportParetic{i,j} = skewness(tempTransportParetic);
      rmsTransportParetic{i,j} = rms(tempTransportParetic);
      covTransportParetic{i,j} = cov(tempTransportParetic);
       
  end
    
end

%% Compute statistical features NonParetic
% reach
for i=1:length(reachDataNonPareticAll)
    
  tempSize = size(reachDataNonPareticAll{i,1}); % size of Reach cell array for ith particpant
    for j=1: tempSize,
        
        tempReachNonParetic = reachDataNonPareticAll{i,1}{j,1}; % this has the data for the jth reach by the ith participant (in 110 dim)
            
     
      avgReachNonParetic{i,j} = mean(tempReachNonParetic);
      stdReachNonParetic{i,j} = std(tempReachNonParetic);
      minReachNonParetic{i,j} = min(tempReachNonParetic);
      maxReachNonParetic{i,j} = max(tempReachNonParetic);
%       %entropyReachNonParetic{i,j} = %entropy(tempReachNonParetic);
      kurtReachNonParetic{i,j} = kurtosis(tempReachNonParetic);
      skewReachNonParetic{i,j} = skewness(tempReachNonParetic);
      rmsReachNonParetic{i,j} = rms(tempReachNonParetic);
            covReachNonParetic{i,j} = cov(tempReachNonParetic);

    end
    
end


% retract
for i=1:length(retractDataNonPareticAll)
    
  tempSize = size(retractDataNonPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempRetractNonParetic = retractDataNonPareticAll{i,1}{j,1};

      
      avgRetractNonParetic{i,j} = mean(tempRetractNonParetic);
      stdRetractNonParetic{i,j} = std(tempRetractNonParetic);
      minRetractNonParetic{i,j} = min(tempRetractNonParetic);
      maxRetractNonParetic{i,j} = max(tempRetractNonParetic);
%       %entropyRetractNonParetic{i,j} = %entropy(tempRetractNonParetic);
      kurtRetractNonParetic{i,j} = kurtosis(tempRetractNonParetic);
      skewRetractNonParetic{i,j} = skewness(tempRetractNonParetic);
      rmsRetractNonParetic{i,j} = rms(tempRetractNonParetic);
      covRetractNonParetic{i,j} = cov(tempRetractNonParetic);

       end
    
end

% rest
for i=1:length(restDataNonPareticAll)
    
  tempSize = size(restDataNonPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempRestNonParetic = restDataNonPareticAll{i,1}{j,1};
     

      
      avgRestNonParetic{i,j} = mean(tempRestNonParetic);
      stdRestNonParetic{i,j} = std(tempRestNonParetic);
      minRestNonParetic{i,j} = min(tempRestNonParetic);
      maxRestNonParetic{i,j} = max(tempRestNonParetic);
      %entropyRestNonParetic{i,j} = %entropy(tempRestNonParetic);
      kurtRestNonParetic{i,j} = kurtosis(tempRestNonParetic);
      skewRestNonParetic{i,j} = skewness(tempRestNonParetic);    
      rmsRestNonParetic{i,j} = rms(tempRestNonParetic);
      covRestNonParetic{i,j} = cov(tempRestNonParetic);
    
  end
    
end

% stabilize
for i=1:length(stabilizeDataNonPareticAll)
    
  tempSize = size(stabilizeDataNonPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempStabilizeNonParetic = stabilizeDataNonPareticAll{i,1}{j,1};

      
      avgStabilizeNonParetic{i,j} = mean(tempStabilizeNonParetic);
      stdStabilizeNonParetic{i,j} = std(tempStabilizeNonParetic);
      minStabilizeNonParetic{i,j} = min(tempStabilizeNonParetic);
      maxStabilizeNonParetic{i,j} = max(tempStabilizeNonParetic);
      %entropyStabilizeNonParetic{i,j} = %entropy(tempStabilizeNonParetic);
      kurtStabilizeNonParetic{i,j} = kurtosis(tempStabilizeNonParetic);
      skewStabilizeNonParetic{i,j} = skewness(tempStabilizeNonParetic);
      rmsStabilizeNonParetic{i,j} = rms(tempStabilizeNonParetic);
      covStabilizeNonParetic{i,j} = cov(tempStabilizeNonParetic);
      
  end
    
end

% tranport
for i=1:length(transportDataNonPareticAll)
    
  tempSize = size(transportDataNonPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempTransportNonParetic = transportDataNonPareticAll{i,1}{j,1};
      
     
      avgTransportNonParetic{i,j} = mean(tempTransportNonParetic);
      stdTransportNonParetic{i,j} = std(tempTransportNonParetic);
      minTransportNonParetic{i,j} = min(tempTransportNonParetic);
      maxTransportNonParetic{i,j} = max(tempTransportNonParetic);
      %entropyTransportNonParetic{i,j} = %entropy(tempTransportNonParetic);
      kurtTransportNonParetic{i,j} = kurtosis(tempTransportNonParetic);
      skewTransportNonParetic{i,j} = skewness(tempTransportNonParetic);
      rmsTransportNonParetic{i,j} = rms(tempTransportNonParetic);
      covTransportNonParetic{i,j} = cov(tempTransportNonParetic);
       
  end
    
end

disp('Computed the features All');
%% saving
cd 'IMU data'
clearvars reachDataNonPareticAll reachDataPareticAll restDataNonPareticAll restDataPareticAll retractDataNonPareticAll retractDataPareticAll stabilizeDataNonPareticAll stabilizeDataPareticAll transportDataNonPareticAll transportDataPareticAll
save('featuresAll.mat')

%% feature computing for Can

clear all
close all
clc

cd 'IMU data\segmented data\Can'
fileNames = dir;
fileNames(1:2) = []; % removing the . and ..

for fileCntr = 1:length(fileNames)
       load(fileNames(fileCntr).name); % load all the mat files
end

%% Compute statistical features Paretic Can

% reach
for i=1:length(reachDataPareticCanAll)
    
  tempSize = size(reachDataPareticCanAll{i,1}); % size of Reach cell array for ith particpant
    for j=1: tempSize,
        
        tempReachParetic = reachDataPareticCanAll{i,1}{j,1}; % this has the data for the jth reach by the ith participant (in 110 dim)

      
      avgReachParetic{i,j} = mean(tempReachParetic);
      stdReachParetic{i,j} = std(tempReachParetic);
      minReachParetic{i,j} = min(tempReachParetic);
      maxReachParetic{i,j} = max(tempReachParetic);
%       %entropyReachParetic{i,j} = %entropy(tempReachParetic);
      kurtReachParetic{i,j} = kurtosis(tempReachParetic);
      skewReachParetic{i,j} = skewness(tempReachParetic);
      rmsReachParetic{i,j} = rms(tempReachParetic);
            covReachParetic{i,j} = cov(tempReachParetic);

    end
    
end


% retract
for i=1:length(retractDataPareticCanAll)
    
  tempSize = size(retractDataPareticCanAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempRetractParetic = retractDataPareticCanAll{i,1}{j,1};
     
      
      avgRetractParetic{i,j} = mean(tempRetractParetic);
      stdRetractParetic{i,j} = std(tempRetractParetic);
      minRetractParetic{i,j} = min(tempRetractParetic);
      maxRetractParetic{i,j} = max(tempRetractParetic);
%       %entropyRetractParetic{i,j} = %entropy(tempRetractParetic);
      kurtRetractParetic{i,j} = kurtosis(tempRetractParetic);
      skewRetractParetic{i,j} = skewness(tempRetractParetic);
      rmsRetractParetic{i,j} = rms(tempRetractParetic);
      covRetractParetic{i,j} = cov(tempRetractParetic);

       end
    
end

% rest
for i=1:length(restDataPareticCanAll)
    
  tempSize = size(restDataPareticCanAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempRestParetic = restDataPareticCanAll{i,1}{j,1};
     
      
      avgRestParetic{i,j} = mean(tempRestParetic);
      stdRestParetic{i,j} = std(tempRestParetic);
      minRestParetic{i,j} = min(tempRestParetic);
      maxRestParetic{i,j} = max(tempRestParetic);
%       %entropyRestParetic{i,j} = %entropy(tempRestParetic);
      kurtRestParetic{i,j} = kurtosis(tempRestParetic);
      skewRestParetic{i,j} = skewness(tempRestParetic);    
      rmsRestParetic{i,j} = rms(tempRestParetic);
      covRestParetic{i,j} = cov(tempRestParetic);
    
  end
    
end

% stabilize
for i=1:length(stabilizeDataPareticCanAll)
    
  tempSize = size(stabilizeDataPareticCanAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempStabilizeParetic = stabilizeDataPareticCanAll{i,1}{j,1};

      
      avgStabilizeParetic{i,j} = mean(tempStabilizeParetic);
      stdStabilizeParetic{i,j} = std(tempStabilizeParetic);
      minStabilizeParetic{i,j} = min(tempStabilizeParetic);
      maxStabilizeParetic{i,j} = max(tempStabilizeParetic);
      %entropyStabilizeParetic{i,j} = %entropy(tempStabilizeParetic);
      kurtStabilizeParetic{i,j} = kurtosis(tempStabilizeParetic);
      skewStabilizeParetic{i,j} = skewness(tempStabilizeParetic);
      rmsStabilizeParetic{i,j} = rms(tempStabilizeParetic);
      covStabilizeParetic{i,j} = cov(tempStabilizeParetic);
      
  end
    
end

% tranport
for i=1:length(transportDataPareticCanAll)
    
  tempSize = size(transportDataPareticCanAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempTransportParetic = transportDataPareticCanAll{i,1}{j,1};
      

     
      avgTransportParetic{i,j} = mean(tempTransportParetic);
      stdTransportParetic{i,j} = std(tempTransportParetic);
      minTransportParetic{i,j} = min(tempTransportParetic);
      maxTransportParetic{i,j} = max(tempTransportParetic);
      %entropyTransportParetic{i,j} = %entropy(tempTransportParetic);
      kurtTransportParetic{i,j} = kurtosis(tempTransportParetic);
      skewTransportParetic{i,j} = skewness(tempTransportParetic);
      rmsTransportParetic{i,j} = rms(tempTransportParetic);
      covTransportParetic{i,j} = cov(tempTransportParetic);
       
  end
    
end

% Compute statistical features NonParetic
% reach
for i=1:length(reachDataNonPareticCanAll)
    
  tempSize = size(reachDataNonPareticCanAll{i,1}); % size of Reach cell array for ith particpant
    for j=1: tempSize,
        
        tempReachNonParetic = reachDataNonPareticCanAll{i,1}{j,1}; % this has the data for the jth reach by the ith participant (in 110 dim)
            

      
      avgReachNonParetic{i,j} = mean(tempReachNonParetic);
      stdReachNonParetic{i,j} = std(tempReachNonParetic);
      minReachNonParetic{i,j} = min(tempReachNonParetic);
      maxReachNonParetic{i,j} = max(tempReachNonParetic);
%       %entropyReachNonParetic{i,j} = %entropy(tempReachNonParetic);
      kurtReachNonParetic{i,j} = kurtosis(tempReachNonParetic);
      skewReachNonParetic{i,j} = skewness(tempReachNonParetic);
      rmsReachNonParetic{i,j} = rms(tempReachNonParetic);
            covReachNonParetic{i,j} = cov(tempReachNonParetic);

    end
    
end


% retract
for i=1:length(retractDataNonPareticCanAll)
    
  tempSize = size(retractDataNonPareticCanAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempRetractNonParetic = retractDataNonPareticCanAll{i,1}{j,1};
     
      
      avgRetractNonParetic{i,j} = mean(tempRetractNonParetic);
      stdRetractNonParetic{i,j} = std(tempRetractNonParetic);
      minRetractNonParetic{i,j} = min(tempRetractNonParetic);
      maxRetractNonParetic{i,j} = max(tempRetractNonParetic);
%       %entropyRetractNonParetic{i,j} = %entropy(tempRetractNonParetic);
      kurtRetractNonParetic{i,j} = kurtosis(tempRetractNonParetic);
      skewRetractNonParetic{i,j} = skewness(tempRetractNonParetic);
      rmsRetractNonParetic{i,j} = rms(tempRetractNonParetic);
      covRetractNonParetic{i,j} = cov(tempRetractNonParetic);

       end
    
end

% rest
for i=1:length(restDataNonPareticCanAll)
    
  tempSize = size(restDataNonPareticCanAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempRestNonParetic = restDataNonPareticCanAll{i,1}{j,1};
     
      
      avgRestNonParetic{i,j} = mean(tempRestNonParetic);
      stdRestNonParetic{i,j} = std(tempRestNonParetic);
      minRestNonParetic{i,j} = min(tempRestNonParetic);
      maxRestNonParetic{i,j} = max(tempRestNonParetic);
      %entropyRestNonParetic{i,j} = %entropy(tempRestNonParetic);
      kurtRestNonParetic{i,j} = kurtosis(tempRestNonParetic);
      skewRestNonParetic{i,j} = skewness(tempRestNonParetic);    
      rmsRestNonParetic{i,j} = rms(tempRestNonParetic);
      covRestNonParetic{i,j} = cov(tempRestNonParetic);
    
  end
    
end

% stabilize
for i=1:length(stabilizeDataNonPareticCanAll)
    
  tempSize = size(stabilizeDataNonPareticCanAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempStabilizeNonParetic = stabilizeDataNonPareticCanAll{i,1}{j,1};
     
      
      avgStabilizeNonParetic{i,j} = mean(tempStabilizeNonParetic);
      stdStabilizeNonParetic{i,j} = std(tempStabilizeNonParetic);
      minStabilizeNonParetic{i,j} = min(tempStabilizeNonParetic);
      maxStabilizeNonParetic{i,j} = max(tempStabilizeNonParetic);
      %entropyStabilizeNonParetic{i,j} = %entropy(tempStabilizeNonParetic);
      kurtStabilizeNonParetic{i,j} = kurtosis(tempStabilizeNonParetic);
      skewStabilizeNonParetic{i,j} = skewness(tempStabilizeNonParetic);
      rmsStabilizeNonParetic{i,j} = rms(tempStabilizeNonParetic);
      covStabilizeNonParetic{i,j} = cov(tempStabilizeNonParetic);
      
  end
    
end

% tranport
for i=1:length(transportDataNonPareticCanAll)
    
  tempSize = size(transportDataNonPareticCanAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempTransportNonParetic = transportDataNonPareticCanAll{i,1}{j,1};
      
     
      avgTransportNonParetic{i,j} = mean(tempTransportNonParetic);
      stdTransportNonParetic{i,j} = std(tempTransportNonParetic);
      minTransportNonParetic{i,j} = min(tempTransportNonParetic);
      maxTransportNonParetic{i,j} = max(tempTransportNonParetic);
      %entropyTransportNonParetic{i,j} = %entropy(tempTransportNonParetic);
      kurtTransportNonParetic{i,j} = kurtosis(tempTransportNonParetic);
      skewTransportNonParetic{i,j} = skewness(tempTransportNonParetic);
      rmsTransportNonParetic{i,j} = rms(tempTransportNonParetic);
      covTransportNonParetic{i,j} = cov(tempTransportNonParetic);
       
  end
    
end

disp('Computed the features for can');
%% saving
cd 'IMU data'
clearvars reachDataNonPareticCanAll reachDataPareticCanAll restDataNonPareticCanAll restDataPareticCanAll retractDataNonPareticCanAll retractDataPareticCanAll stabilizeDataNonPareticCanAll stabilizeDataPareticCanAll transportDataNonPareticCanAll transportDataPareticCanAll
save('featuresCanAll.mat')

%
%% Compute statistical features  TP
clear all
close all
clc

cd 'IMU data\segmented data\TP'
fileNames = dir;
fileNames(1:2) = []; % removing the . and ..

for fileCntr = 1:length(fileNames)
       load(fileNames(fileCntr).name); % load all the mat files
end
%% compute features paretic
% reach
for i=1:length(reachDataPareticTpAll)
    
  tempSize = size(reachDataPareticTpAll{i,1}); % size of Reach cell array for ith particpant
    for j=1: tempSize,
        
        tempReachParetic = reachDataPareticTpAll{i,1}{j,1}; % this has the data for the jth reach by the ith participant (in 110 dim)

      
      avgReachParetic{i,j} = mean(tempReachParetic);
      stdReachParetic{i,j} = std(tempReachParetic);
      minReachParetic{i,j} = min(tempReachParetic);
      maxReachParetic{i,j} = max(tempReachParetic);
%       %entropyReachParetic{i,j} = %entropy(tempReachParetic);
      kurtReachParetic{i,j} = kurtosis(tempReachParetic);
      skewReachParetic{i,j} = skewness(tempReachParetic);
      rmsReachParetic{i,j} = rms(tempReachParetic);
            covReachParetic{i,j} = cov(tempReachParetic);

    end
    
end


% retract
for i=1:length(retractDataPareticTpAll)
    
  tempSize = size(retractDataPareticTpAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempRetractParetic = retractDataPareticTpAll{i,1}{j,1};

      
      avgRetractParetic{i,j} = mean(tempRetractParetic);
      stdRetractParetic{i,j} = std(tempRetractParetic);
      minRetractParetic{i,j} = min(tempRetractParetic);
      maxRetractParetic{i,j} = max(tempRetractParetic);
%       %entropyRetractParetic{i,j} = %entropy(tempRetractParetic);
      kurtRetractParetic{i,j} = kurtosis(tempRetractParetic);
      skewRetractParetic{i,j} = skewness(tempRetractParetic);
      rmsRetractParetic{i,j} = rms(tempRetractParetic);
      covRetractParetic{i,j} = cov(tempRetractParetic);

       end
    
end

% rest
for i=1:length(restDataPareticTpAll)
    
  tempSize = size(restDataPareticTpAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempRestParetic = restDataPareticTpAll{i,1}{j,1};
     

      
      avgRestParetic{i,j} = mean(tempRestParetic);
      stdRestParetic{i,j} = std(tempRestParetic);
      minRestParetic{i,j} = min(tempRestParetic);
      maxRestParetic{i,j} = max(tempRestParetic);
%       %entropyRestParetic{i,j} = %entropy(tempRestParetic);
      kurtRestParetic{i,j} = kurtosis(tempRestParetic);
      skewRestParetic{i,j} = skewness(tempRestParetic);    
      rmsRestParetic{i,j} = rms(tempRestParetic);
      covRestParetic{i,j} = cov(tempRestParetic);
    
  end
    
end

% stabilize
for i=1:length(stabilizeDataPareticTpAll)
    
  tempSize = size(stabilizeDataPareticTpAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempStabilizeParetic = stabilizeDataPareticTpAll{i,1}{j,1};
     

      
      avgStabilizeParetic{i,j} = mean(tempStabilizeParetic);
      stdStabilizeParetic{i,j} = std(tempStabilizeParetic);
      minStabilizeParetic{i,j} = min(tempStabilizeParetic);
      maxStabilizeParetic{i,j} = max(tempStabilizeParetic);
      %entropyStabilizeParetic{i,j} = %entropy(tempStabilizeParetic);
      kurtStabilizeParetic{i,j} = kurtosis(tempStabilizeParetic);
      skewStabilizeParetic{i,j} = skewness(tempStabilizeParetic);
      rmsStabilizeParetic{i,j} = rms(tempStabilizeParetic);
      covStabilizeParetic{i,j} = cov(tempStabilizeParetic);
      
  end
    
end

% tranport
for i=1:length(transportDataPareticTpAll)
    
  tempSize = size(transportDataPareticTpAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempTransportParetic = transportDataPareticTpAll{i,1}{j,1};
      

     
      avgTransportParetic{i,j} = mean(tempTransportParetic);
      stdTransportParetic{i,j} = std(tempTransportParetic);
      minTransportParetic{i,j} = min(tempTransportParetic);
      maxTransportParetic{i,j} = max(tempTransportParetic);
      %entropyTransportParetic{i,j} = %entropy(tempTransportParetic);
      kurtTransportParetic{i,j} = kurtosis(tempTransportParetic);
      skewTransportParetic{i,j} = skewness(tempTransportParetic);
      rmsTransportParetic{i,j} = rms(tempTransportParetic);
      covTransportParetic{i,j} = cov(tempTransportParetic);
       
  end
    
end

% Compute statistical features NonParetic
% reach
for i=1:length(reachDataNonPareticTpAll)
    
  tempSize = size(reachDataNonPareticTpAll{i,1}); % size of Reach cell array for ith particpant
    for j=1: tempSize,
        
        tempReachNonParetic = reachDataNonPareticTpAll{i,1}{j,1}; % this has the data for the jth reach by the ith participant (in 110 dim)
            

      
      avgReachNonParetic{i,j} = mean(tempReachNonParetic);
      stdReachNonParetic{i,j} = std(tempReachNonParetic);
      minReachNonParetic{i,j} = min(tempReachNonParetic);
      maxReachNonParetic{i,j} = max(tempReachNonParetic);
%       %entropyReachNonParetic{i,j} = %entropy(tempReachNonParetic);
      kurtReachNonParetic{i,j} = kurtosis(tempReachNonParetic);
      skewReachNonParetic{i,j} = skewness(tempReachNonParetic);
      rmsReachNonParetic{i,j} = rms(tempReachNonParetic);
            covReachNonParetic{i,j} = cov(tempReachNonParetic);

    end
    
end


% retract
for i=1:length(retractDataNonPareticTpAll)
    
  tempSize = size(retractDataNonPareticTpAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempRetractNonParetic = retractDataNonPareticTpAll{i,1}{j,1};
     

      
      avgRetractNonParetic{i,j} = mean(tempRetractNonParetic);
      stdRetractNonParetic{i,j} = std(tempRetractNonParetic);
      minRetractNonParetic{i,j} = min(tempRetractNonParetic);
      maxRetractNonParetic{i,j} = max(tempRetractNonParetic);
%       %entropyRetractNonParetic{i,j} = %entropy(tempRetractNonParetic);
      kurtRetractNonParetic{i,j} = kurtosis(tempRetractNonParetic);
      skewRetractNonParetic{i,j} = skewness(tempRetractNonParetic);
      rmsRetractNonParetic{i,j} = rms(tempRetractNonParetic);
      covRetractNonParetic{i,j} = cov(tempRetractNonParetic);

       end
    
end

% rest
for i=1:length(restDataNonPareticTpAll)
    
  tempSize = size(restDataNonPareticTpAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempRestNonParetic = restDataNonPareticTpAll{i,1}{j,1};
     
      
      avgRestNonParetic{i,j} = mean(tempRestNonParetic);
      stdRestNonParetic{i,j} = std(tempRestNonParetic);
      minRestNonParetic{i,j} = min(tempRestNonParetic);
      maxRestNonParetic{i,j} = max(tempRestNonParetic);
      %entropyRestNonParetic{i,j} = %entropy(tempRestNonParetic);
      kurtRestNonParetic{i,j} = kurtosis(tempRestNonParetic);
      skewRestNonParetic{i,j} = skewness(tempRestNonParetic);    
      rmsRestNonParetic{i,j} = rms(tempRestNonParetic);
      covRestNonParetic{i,j} = cov(tempRestNonParetic);
    
  end
    
end

% stabilize
for i=1:length(stabilizeDataNonPareticTpAll)
    
  tempSize = size(stabilizeDataNonPareticTpAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
     tempStabilizeNonParetic = stabilizeDataNonPareticTpAll{i,1}{j,1};
     
      
      avgStabilizeNonParetic{i,j} = mean(tempStabilizeNonParetic);
      stdStabilizeNonParetic{i,j} = std(tempStabilizeNonParetic);
      minStabilizeNonParetic{i,j} = min(tempStabilizeNonParetic);
      maxStabilizeNonParetic{i,j} = max(tempStabilizeNonParetic);
      %entropyStabilizeNonParetic{i,j} = %entropy(tempStabilizeNonParetic);
      kurtStabilizeNonParetic{i,j} = kurtosis(tempStabilizeNonParetic);
      skewStabilizeNonParetic{i,j} = skewness(tempStabilizeNonParetic);
      rmsStabilizeNonParetic{i,j} = rms(tempStabilizeNonParetic);
      covStabilizeNonParetic{i,j} = cov(tempStabilizeNonParetic);
      
  end
    
end

% tranport
for i=1:length(transportDataNonPareticTpAll)
    
  tempSize = size(transportDataNonPareticTpAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempTransportNonParetic = transportDataNonPareticTpAll{i,1}{j,1};
      
     
      avgTransportNonParetic{i,j} = mean(tempTransportNonParetic);
      stdTransportNonParetic{i,j} = std(tempTransportNonParetic);
      minTransportNonParetic{i,j} = min(tempTransportNonParetic);
      maxTransportNonParetic{i,j} = max(tempTransportNonParetic);
      %entropyTransportNonParetic{i,j} = %entropy(tempTransportNonParetic);
      kurtTransportNonParetic{i,j} = kurtosis(tempTransportNonParetic);
      skewTransportNonParetic{i,j} = skewness(tempTransportNonParetic);
      rmsTransportNonParetic{i,j} = rms(tempTransportNonParetic);
      covTransportNonParetic{i,j} = cov(tempTransportNonParetic);
       
  end
    
end

disp('Computed the features for TP');
%% saving
cd 'C:\Users\parnaa01\Box Sync\Old IMU data'
clearvars reachDataNonPareticTpAll reachDataPareticTpAll restDataNonPareticTpAll restDataPareticTpAll retractDataNonPareticTpAll retractDataPareticTpAll stabilizeDataNonPareticTpAll stabilizeDataPareticTpAll transportDataNonPareticTpAll transportDataPareticTpAll

save('featuresTpAll.mat')
%% this is more effecient

% 
for i=1:length(retractDataPareticAll)
    
 % tempSize = size(retractDataPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: 10%tempSize,
  
      tempReachParetic = reachDataPareticAll{i,1}{j,1};
      tempRetractParetic = retractDataPareticAll{i,1}{j,1};
      tempRestParetic = restDataPareticAll{i,1}{j,1};
      tempStabilizeParetic = stabilizeDataPareticAll{i,1}{j,1};
%       tempTransportParetic = transportDataPareticAll{i,1}{j,1};
      
      tempReachNonParetic = reachDataNonPareticAll{i,1}{j,1}; % this has the data for the jth reach by the ith participant (in 110 dim)
      tempRetractNonParetic = retractDataNonPareticAll{i,1}{j,1};
      tempRestNonParetic = restDataNonPareticAll{i,1}{j,1};
      tempStabilizeNonParetic = stabilizeDataNonPareticAll{i,1}{j,1};
      tempTransportNonParetic = transportDataNonPareticAll{i,1}{j,1};
      
      avgReach{i,j} = mean(tempReachParetic);
      stdReach{i,j} = std(tempReachParetic);
      minReach{i,j} = min(tempReachParetic);
      maxReach{i,j} = max(tempReachParetic);
      %entropyReach{i,j} = %entropy(tempReachParetic);
      kurtReach{i,j} = kurtosis(tempReachParetic);
      skewReach{i,j} = skewness(tempReachParetic);
      
      avgRetract{i,j} = mean(tempRetractParetic);
      stdRetract{i,j} = std(tempRetractParetic);
      minRetract{i,j} = min(tempRetractParetic);
      maxRetract{i,j} = max(tempRetractParetic);
      %entropyRetract{i,j} = %entropy(tempRetractParetic);
      kurtRetract{i,j} = kurtosis(tempRetractParetic);
      skewRetract{i,j} = skewness(tempRetractParetic);
      
      avgRest{i,j} = mean(tempRestParetic);
      stdRest{i,j} = std(tempRestParetic);
      minRest{i,j} = min(tempRestParetic);
      maxRest{i,j} = max(tempRestParetic);
      %entropyRest{i,j} = %entropy(tempRestParetic);
      kurtRest{i,j} = kurtosis(tempRestParetic);
      skewRest{i,j} = skewness(tempRestParetic);
               
      avgStabilize{i,j} = mean(tempStabilizeParetic);
      stdStabilize{i,j} = std(tempStabilizeParetic);
      minStabilize{i,j} = min(tempStabilizeParetic);
      maxStabilize{i,j} = max(tempStabilizeParetic);
      %entropyStabilize{i,j} = %entropy(tempStabilizeParetic);
      kurtStabilize{i,j} = kurtosis(tempStabilizeParetic);
      skewStabilize{i,j} = skewness(tempStabilizeParetic);
     
      % Non paretic
        avgReachNonParetic{i,j} = mean(tempReachNonParetic);
      stdReachNonParetic{i,j} = std(tempReachNonParetic);
      minReachNonParetic{i,j} = min(tempReachNonParetic);
      maxReachNonParetic{i,j} = max(tempReachNonParetic);
      %entropyReachNonParetic{i,j} = %entropy(tempReachNonParetic);
      kurtReachNonParetic{i,j} = kurtosis(tempReachNonParetic);
      skewReachNonParetic{i,j} = skewness(tempReachNonParetic);
      
      avgRetractNonParetic{i,j} = mean(tempRetractNonParetic);
      stdRetractNonParetic{i,j} = std(tempRetractNonParetic);
      minRetractNonParetic{i,j} = min(tempRetractNonParetic);
      maxRetractNonParetic{i,j} = max(tempRetractNonParetic);
      %entropyRetractNonParetic{i,j} = %entropy(tempRetractNonParetic);
      kurtRetractNonParetic{i,j} = kurtosis(tempRetractNonParetic);
      skewRetractNonParetic{i,j} = skewness(tempRetractNonParetic);
      
      avgRestNonParetic{i,j} = mean(tempRestNonParetic);
      stdRestNonParetic{i,j} = std(tempRestNonParetic);
      minRestNonParetic{i,j} = min(tempRestNonParetic);
      maxRestNonParetic{i,j} = max(tempRestNonParetic);
      %entropyRestNonParetic{i,j} = %entropy(tempRestNonParetic);
      kurtRestNonParetic{i,j} = kurtosis(tempRestNonParetic);
      skewRestNonParetic{i,j} = skewness(tempRestNonParetic);
      
      avgTransportNonParetic{i,j} = mean(tempTransportNonParetic);
      stdTransportNonParetic{i,j} = std(tempTransportNonParetic);
      minTransportNonParetic{i,j} = min(tempTransportNonParetic);
      maxTransportNonParetic{i,j} = max(tempTransportNonParetic);
      %entropyTransportNonParetic{i,j} = %entropy(tempTransportNonParetic);
      kurtTransportNonParetic{i,j} = kurtosis(tempTransportNonParetic);
      skewTransportNonParetic{i,j} = skewness(tempTransportNonParetic);
      
      avgStabilizeNonParetic{i,j} = mean(tempStabilizeNonParetic);
      stdStabilizeNonParetic{i,j} = std(tempStabilizeNonParetic);
      minStabilizeNonParetic{i,j} = min(tempStabilizeNonParetic);
      maxStabilizeNonParetic{i,j} = max(tempStabilizeNonParetic);
      %entropyStabilizeNonParetic{i,j} = %entropy(tempStabilizeNonParetic);
      kurtStabilizeNonParetic{i,j} = kurtosis(tempStabilizeNonParetic);
      skewStabilizeNonParetic{i,j} = skewness(tempStabilizeNonParetic);
  end
    
end
% do it separetly for PareticTransport; it has 8 elements

% tranport
for i=1:length(transportDataPareticAll)
    
  tempSize = size(transportDataPareticAll{i,1}); % size of Reach cell array for ith particpant
  
  for j=1: tempSize,
  
      tempTransportParetic = transportDataPareticAll{i,1}{j,1};
      
      % i can take the reachData and compute features for the entirety of
      % each reach; the features are computed for each of the 110
      % dimensions
     
      avgTransport{i,j} = mean(tempTransportParetic);
      stdTransport{i,j} = std(tempTransportParetic);
      minTransport{i,j} = min(tempTransportParetic);
      maxTransport{i,j} = max(tempTransportParetic);
      %entropyTransport{i,j} = %entropy(tempTransportParetic);
      kurtTransport{i,j} = kurtosis(tempTransportParetic);
      skewTransport{i,j} = skewness(tempTransportParetic);
       
  end
    
end

% 


%%

