function [featPareticAll featPareticLabelsAll featParetic7 featPareticLabels7 featParetic5 featPareticLabels5 featParetic3 featPareticLabels3 featParetic2 featPareticLabels2 featParetic1 featPareticLabels1 featPareticPelvis featPareticT8 featPareticHead featPareticRTShoulder featPareticRTUpperarm featPareticRTForearm featPareticRTHand featPareticLabels] = featureExtractV3(featReachParetic,featRetractParetic,featTransportParetic,featRestParetic, numDim, incrementFactor)


% reach
featReachPareticPelvis = [];
i=0;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticPelvis = [featReachPareticPelvis featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticT8 = [];
i=10;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticT8 = [featReachPareticT8 featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticHead = [];
i=20;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticHead = [featReachPareticHead featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticRTShoulder = [];
i=30;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticRTShoulder = [featReachPareticRTShoulder featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticRTUpperarm = [];
i=40;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticRTUpperarm = [featReachPareticRTUpperarm featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticRTForearm = [];
i=50;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticRTForearm = [featReachPareticRTForearm featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticRTHand = [];
i=60;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticRTHand = [featReachPareticRTHand featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticLTShoulder = [];
i=70;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticLTShoulder = [featReachPareticLTShoulder featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticLTUpperarm = [];
i=80;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticLTUpperarm = [featReachPareticLTUpperarm featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticLTForearm = [];
i=90;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticLTForearm = [featReachPareticLTForearm featReachParetic(:,i+1:i+10)];
    i=i+110;       
end

featReachPareticLTHand = [];
i=100;
while  (i<numDim)
    %[i+1 i+10]
    featReachPareticLTHand = [featReachPareticLTHand featReachParetic(:,i+1:i+10)];
    i=i+110;       
end


% Rest
featRestPareticPelvis = [];
i=0;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticPelvis = [featRestPareticPelvis featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticT8 = [];
i=10;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticT8 = [featRestPareticT8 featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticHead = [];
i=20;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticHead = [featRestPareticHead featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticRTShoulder = [];
i=30;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticRTShoulder = [featRestPareticRTShoulder featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticRTUpperarm = [];
i=40;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticRTUpperarm = [featRestPareticRTUpperarm featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticRTForearm = [];
i=50;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticRTForearm = [featRestPareticRTForearm featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticRTHand = [];
i=60;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticRTHand = [featRestPareticRTHand featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticLTShoulder = [];
i=70;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticLTShoulder = [featRestPareticLTShoulder featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticLTUpperarm = [];
i=80;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticLTUpperarm = [featRestPareticLTUpperarm featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticLTForearm = [];
i=90;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticLTForearm = [featRestPareticLTForearm featRestParetic(:,i+1:i+10)];
    i=i+110;       
end

featRestPareticLTHand = [];
i=100;
while  (i<numDim)
    %[i+1 i+10]
    featRestPareticLTHand = [featRestPareticLTHand featRestParetic(:,i+1:i+10)];
    i=i+110;       
end


% Transport
featTransportPareticPelvis = [];
i=0;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticPelvis = [featTransportPareticPelvis featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticT8 = [];
i=10;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticT8 = [featTransportPareticT8 featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticHead = [];
i=20;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticHead = [featTransportPareticHead featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticRTShoulder = [];
i=30;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticRTShoulder = [featTransportPareticRTShoulder featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticRTUpperarm = [];
i=40;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticRTUpperarm = [featTransportPareticRTUpperarm featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticRTForearm = [];
i=50;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticRTForearm = [featTransportPareticRTForearm featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticRTHand = [];
i=60;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticRTHand = [featTransportPareticRTHand featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticLTShoulder = [];
i=70;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticLTShoulder = [featTransportPareticLTShoulder featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticLTUpperarm = [];
i=80;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticLTUpperarm = [featTransportPareticLTUpperarm featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticLTForearm = [];
i=90;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticLTForearm = [featTransportPareticLTForearm featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end

featTransportPareticLTHand = [];
i=100;
while  (i<numDim)
    %[i+1 i+10]
    featTransportPareticLTHand = [featTransportPareticLTHand featTransportParetic(:,i+1:i+10)];
    i=i+110;       
end


% Retract
featRetractPareticPelvis = [];
i=0;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticPelvis = [featRetractPareticPelvis featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticT8 = [];
i=10;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticT8 = [featRetractPareticT8 featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticHead = [];
i=20;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticHead = [featRetractPareticHead featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticRTShoulder = [];
i=30;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticRTShoulder = [featRetractPareticRTShoulder featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticRTUpperarm = [];
i=40;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticRTUpperarm = [featRetractPareticRTUpperarm featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticRTForearm = [];
i=50;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticRTForearm = [featRetractPareticRTForearm featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticRTHand = [];
i=60;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticRTHand = [featRetractPareticRTHand featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticLTShoulder = [];
i=70;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticLTShoulder = [featRetractPareticLTShoulder featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticLTUpperarm = [];
i=80;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticLTUpperarm = [featRetractPareticLTUpperarm featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticLTForearm = [];
i=90;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticLTForearm = [featRetractPareticLTForearm featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end

featRetractPareticLTHand = [];
i=100;
while  (i<numDim)
    %[i+1 i+10]
    featRetractPareticLTHand = [featRetractPareticLTHand featRetractParetic(:,i+1:i+10)];
    i=i+110;       
end




%% stack the features for accelerometer alone


%% segmentation using all sensors; LDA

featReachParetic;
featRetractParetic;
featTransportParetic;
featRestParetic;

featPareticAll = [featReachParetic;featRetractParetic;featTransportParetic;featRestParetic];
featPareticLabelsAll = [ones(size(featReachParetic,1),1);2.*ones(size(featRetractParetic,1),1);3.*ones(size(featTransportParetic,1),1);4.*ones(size(featRestParetic,1),1)];


%% stacking the data
featPareticPelvis = [featReachPareticPelvis; featRetractPareticPelvis; featTransportPareticPelvis; featRestPareticPelvis];
featPareticT8 = [featReachPareticT8; featRetractPareticT8; featTransportPareticT8; featRestPareticT8];
featPareticHead = [featReachPareticHead; featRetractPareticHead; featTransportPareticHead; featRestPareticHead];
featPareticRTShoulder = [featReachPareticRTShoulder; featRetractPareticRTShoulder; featTransportPareticRTShoulder; featRestPareticRTShoulder];
featPareticRTUpperarm = [featReachPareticRTUpperarm; featRetractPareticRTUpperarm; featTransportPareticRTUpperarm; featRestPareticRTUpperarm];
featPareticRTForearm = [featReachPareticRTForearm; featRetractPareticRTForearm; featTransportPareticRTForearm; featRestPareticRTForearm];
featPareticRTHand = [featReachPareticRTHand; featRetractPareticRTHand; featTransportPareticRTHand; featRestPareticRTHand];
featPareticLabels = [ones(size(featReachParetic,1),1);2.*ones(size(featRetractParetic,1),1);3.*ones(size(featTransportParetic,1),1);4.*ones(size(featRestParetic,1),1)];


