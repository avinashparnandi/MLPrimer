clear all
close all
clc

% % load statistical features
cd 'C:\Users\parnaa01\Box Sync\Old IMU data'
load('featuresAll.mat')

%% plotting for visualization
% figure,
% title('Average feature values')
% subplot(4,1,1), imagesc(avgReachParetic), ylabel('Reach#')
% subplot(4,1,2), imagesc(avgRestParetic),ylabel('Rest#')
% subplot(4,1,3), imagesc(avgTransportParetic),ylabel('Transport#')
% subplot(4,1,4), imagesc(avgRetractParetic),ylabel('Retract#')
% xlabel('dimensions')
% 
% figure,
% title('Variance feature values')
% subplot(4,1,1), imagesc(stdReachParetic), ylabel('Reach#')
% subplot(4,1,2), imagesc(stdRestParetic),ylabel('Rest#')
% subplot(4,1,3), imagesc(stdTransportParetic),ylabel('Transport#')
% subplot(4,1,4), imagesc(stdRetractParetic),ylabel('Retract#')
% xlabel('dimensions')
% 
% figure,
% title('RMS feature values')
% subplot(4,1,1), imagesc(rmsReachParetic), ylabel('Reach#')
% subplot(4,1,2), imagesc(rmsRestParetic),ylabel('Rest#')
% subplot(4,1,3), imagesc(rmsTransportParetic),ylabel('Transport#')
% subplot(4,1,4), imagesc(rmsRetractParetic),ylabel('Retract#')
% xlabel('dimensions')
% 
% figure,
% title('Max feature values')
% subplot(4,1,1), imagesc(maxReachParetic), ylabel('Reach#')
% subplot(4,1,2), imagesc(maxRestParetic),ylabel('Rest#')
% subplot(4,1,3), imagesc(maxTransportParetic),ylabel('Transport#')
% subplot(4,1,4), imagesc(maxRetractParetic),ylabel('Retract#')
% xlabel('dimensions')
% 
% figure,
% title('Min feature values')
% subplot(4,1,1), imagesc(minReachParetic), ylabel('Reach#')
% subplot(4,1,2), imagesc(minRestParetic),ylabel('Rest#')
% subplot(4,1,3), imagesc(minTransportParetic),ylabel('Transport#')
% subplot(4,1,4), imagesc(minRetractParetic),ylabel('Retract#')
% xlabel('dimensions')

%% stack the IMU features by movement type (reach, retract, transport, rest)

featReachParetic = [avgReachParetic stdReachParetic  maxReachParetic minReachParetic rmsReachParetic ];
featRetractParetic = [avgRetractParetic stdRetractParetic  maxRetractParetic minRetractParetic rmsRetractParetic ];
featTransportParetic = [avgTransportParetic stdTransportParetic  maxTransportParetic minTransportParetic rmsTransportParetic ];
featRestParetic = [avgRestParetic stdRestParetic  maxRestParetic minRestParetic rmsRestParetic ];

% % without min/max since they are direction dependent
% featReachParetic = [avgReachParetic stdReachParetic kurtReachParetic rmsReachParetic skewReachParetic];
% featRetractParetic = [avgRetractParetic stdRetractParetic kurtRetractParetic rmsRetractParetic skewRetractParetic];
% featTransportParetic = [avgTransportParetic stdTransportParetic kurtTransportParetic rmsTransportParetic skewTransportParetic];
% featRestParetic = [avgRestParetic stdRestParetic kurtRestParetic rmsRestParetic skewRestParetic];

%% standardize the data
dim = 2; % 1 =  standardize along rows; 2 = standardize along columns
featReachParetic = zscore(featReachParetic,[], dim); % [] is a std dev flag 
featRetractParetic = zscore(featRetractParetic,[], dim);
featTransportParetic = zscore(featTransportParetic,[], dim);
featRestParetic = zscore(featRestParetic,[], dim);

%% normalize each column between 0 and 1
% featReachParetic = normColumn(featReachParetic);
% featRetractParetic = normColumn(featRetractParetic);
% featTransportParetic = normColumn(featTransportParetic);
% featRestParetic = normColumn(featRestParetic);


%% normalize each row between 0 and 1 (normalize each movement)
% featReachParetic = normRow(featReachParetic);
% featRetractParetic = normRow(featRetractParetic);
% featTransportParetic = normRow(featTransportParetic);
% featRestParetic = normRow(featRestParetic);


%% clean up the variables
clearvars -except featReachParetic featRetractParetic featTransportParetic featRestParetic
%% stack the features by sensors (pevlis, head, T8.... (11th sensors)) for each movement
numDim = size(featReachParetic,2);%550;%770; % number of dimensions
incrementFactor = 110;% 11 sensors, 10 dim = 110;

% [featPareticAll featPareticLabelsAll featParetic7 featPareticLabels7 featParetic5 featPareticLabels5 featParetic3 featPareticLabels3 featParetic2 featPareticLabels2 featParetic1 featPareticLabels1] = featureExtractV3(featReachParetic,featRetractParetic,featTransportParetic,featRestParetic, numDim, incrementFactor);
[featPareticAll featPareticLabelsAll featParetic7 featPareticLabels7 featParetic5 featPareticLabels5 featParetic3 featPareticLabels3 featParetic2 featPareticLabels2 featParetic1 featPareticLabels1 featPareticPelvis featPareticT8 featPareticHead featPareticRTShoulder featPareticRTUpperarm featPareticRTForearm featPareticRTHand featPareticLabels] = featureExtractV3(featReachParetic,featRetractParetic,featTransportParetic,featRestParetic, numDim, incrementFactor);


%% brute force sensor selection (restricting to 7 sensors- no left side sensors)
% assign each location a numnber
% pelvis 1
% T8 2
% Head 3
% RT shoulder 4
% RT upperarm 5
% RT forearm 6
% RT hand 7

% do - nchoose(7,k); where k is the number of sensors you want. this will
% give you various combinations of the sensors 
% do - in loop stack the data for each sensor
% do - train the model and test it
% do - next sensor combination and so on


dataAll(:,:,1) = featPareticPelvis;
dataAll(:,:,2) = featPareticT8;
dataAll(:,:,3) = featPareticHead;
dataAll(:,:,4) = featPareticRTShoulder;
dataAll(:,:,5) = featPareticRTUpperarm;
dataAll(:,:,6) = featPareticRTForearm;
dataAll(:,:,7) = featPareticRTHand;
dataAll(:,:,8) = featPareticLTShoulder;
dataAll(:,:,9) = featPareticLTUpperarm;
dataAll(:,:,10) = featPareticLTForearm;
dataAll(:,:,11) = featPareticLTHand;

%%
% k = 11; % restricting to k sensors
% for kk=1:7,
    v = 1:11; % 11 sensors
%     k=kk; % select num of sensors
    k = 7;
    c = nchoosek(v,k);
       for i=1:size(c,1)
        dataTemp = []; % use dataTemp for analysis
        %     dataTemp = [dataTemp data(:,:,c(i,[1:size(c,2)]))]; % to do it
        %     without a for loop
        for j=1:size(c,2)
            dataTemp = [dataTemp dataAll(:,:,c(i,j))];
        end
        %    c(i,:)
        %    dataTemp
        
        % brute force classification
        for ll=1:10,
            X = dataTemp;
            y = featPareticLabels;
            
            t = cputime;
            clear Mdl CompactSVMModel testInds
            
            Mdl = fitcdiscr(X,y,'DiscrimType','pseudoquadratic','Holdout',0.7,...
                'ClassNames',{'1','2','3','4'}); %
            % e(i) = cputime-t;
            CompactSVMModel = Mdl.Trained{1}; % Extract trained, compact classifier
            testInds = test(Mdl.Partition);   % Extract the test indices
            XTest = X(testInds,:);
            YTest = y(testInds,:);
            
            [label,score] = predict(CompactSVMModel,XTest);
            
            cp = classperf(YTest);
            cp = classperf(label, YTest);
            cp.CorrectRate; % accuracy
            cp.CountingMatrix;
            
            LdaPPV(ll) = cp.PositivePredictiveValue;
            LdaCR(ll) = cp.CorrectRate;
            % cp.CountingMatrix
        end
        LdaBruteForceTemp(i)=mean(LdaPPV);
        
        
    end
    
    % disp('loaded the data')
    % formatSpec = 'LdaBruteForce_%d_%d';
    % strLdaPPV = sprintf(formatSpec,length(v),k)
    size(LdaBruteForceTemp)
    LdaBruteForceTemp
%     LdaBruteForce{kk} = {[length(v) k LdaBruteForceTemp]};
%     kk
% end % kk ends here
pause




%% classification ; testing different training/testing set
holdoutPerc = [0.3 0.5 0.7 0.8];
for holdoutCntr = 1:4
for dataCntr=1:6
    clear X y
    if(dataCntr==1)
        X = featPareticAll;
        y = featPareticLabelsAll;
        sensorCount = 11;
        
    elseif(dataCntr==2)
        X = featParetic7;
        y = featPareticLabels7;
        sensorCount = 7;
        
    elseif(dataCntr==3)
        X = featParetic5;
        y = featPareticLabels5;
        sensorCount = 5;
        
    elseif(dataCntr==4)
        X = featParetic3;
        y = featPareticLabels3;
        sensorCount = 3;
        
    elseif(dataCntr==5)
        X = featParetic2;
        y = featPareticLabels2;
        sensorCount = 2;
        
    elseif(dataCntr==6)
        X = featParetic1;
        y = featPareticLabels1;
        sensorCount = 1;
    end


% classification LDA

% holdoutNum = holdoutPerc(holdoutCntr);
holdoutNum = 0.3;

LdaPPV=[];
LdaCR = [];
for i=1:100,
    i;
    t = cputime;
    clear Mdl CompactSVMModel testInds

    Mdl = fitcdiscr(X,y,'DiscrimType','linear','Holdout',holdoutNum,...
    'ClassNames',{'1','2','3','4'}); %  
e(i) = cputime-t;
CompactSVMModel = Mdl.Trained{1}; % Extract trained, compact classifier
testInds = test(Mdl.Partition);   % Extract the test indices
XTest = X(testInds,:);
YTest = y(testInds,:);

[label,score] = predict(CompactSVMModel,XTest);

cp = classperf(YTest); 
cp = classperf(label, YTest);
cp.CorrectRate; % accuracy
cp.CountingMatrix;

LdaPPV(i) = cp.PositivePredictiveValue;
LdaCR(i) = cp.CorrectRate;
% cp.CountingMatrix
end
mean(LdaPPV);
PPVAll(dataCntr,holdoutCntr) = [100.*mean(LdaPPV)]
% mean(LdaCR)
% figure, plot(LdaPPV)
% figure, plot(LdaCR)
% cp.CountingMatrix

end % dataCntr loop ends here
end % holdoutCntr loop ends here
