
%% load one of the data files

cd '\\research-cifs.nyumc.org\research\schamm01lab\homes\parnaa01\Old IMU data Columbia\SensorData (Stroke)'
folderNames = dir;
folderNames(1:2) = []; % removing the . and ..

%%
for folderCntr = 1:length(folderNames)
    dataFolder = sprintf('\\\\research-cifs.nyumc.org\\research\\schamm01lab\\homes\\parnaa01\\Old IMU data Columbia\\SensorData (Stroke)\\%s',folderNames(folderCntr).name)

    if ~isdir(dataFolder)
        error('Invalid directory entered');
    end

    filePattern = fullfile(dataFolder, '*.mat');
    fileList = dir(filePattern);

    if isempty(fileList)
        error('No mvnx files in folder');
    end

    cd(dataFolder)
    %%
    for fileNum = 1:length(fileList)

        savedFileName = strcat(dataFolder,'\', fileList(fileNum).name);
        load(savedFileName);

        markers = tree2.Markers;
        sensorDataAcc = tree2.sensorAcceleration;
        sensorDataAngVel = tree2.sensorAngularVelocity;
        sensorDataOri = tree2.sensorOrientation;
        sensorJointAngle1 = tree2.jointAngle;
        sensorJointAngle2 = tree2.jointAngleXZY;
        %%
        reachIndex=[]; retractIndex=[];retractXIndex=[];restIndex=[];transportIndex=[];transportXIndex=[];ignoreIndex=[];stabilizeIndex=[];stabilizeXIndex=[];iIndex=[];iXIndex =[];
        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'rest','IgnoreCase',true))
                restIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'rest','IgnoreCase',true))
                    restIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in rest')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'rea','IgnoreCase',true))
                reachIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'rea','IgnoreCase',true))
                    reachIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in reach')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'ret_','IgnoreCase',true))
                retractIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'ret_','IgnoreCase',true))
                    retractIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in retract')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'ret*','IgnoreCase',true))
                retractXIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'ret*','IgnoreCase',true))
                    retractXIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in retract')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'_s_','IgnoreCase',true))
                stabilizeIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'_s_','IgnoreCase',true))
                    stabilizeIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in stabilize')
                end
            else
                i=i+1;
            end
        end


        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'_s*_','IgnoreCase',true))
                stabilizeXIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'_s*_','IgnoreCase',true))
                    stabilizeXIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in stabilize*')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'_t_','IgnoreCase',true))
                transportIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'_t_','IgnoreCase',true))
                    transportIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in transport')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'_t*_','IgnoreCase',true))
                transportXIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'_t*_','IgnoreCase',true))
                    transportXIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in transport*')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'_i_','IgnoreCase',true))
                iIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'_i_','IgnoreCase',true))
                    iIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in i(?)')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'_i*_','IgnoreCase',true))
                iXIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'_i*_','IgnoreCase',true))
                    iXIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in i(?)')
                end
            else
                i=i+1;
            end
        end

        j=1;
        i=1;
        while i<length(markerExtract)
            if(contains(markerExtract{i},'ignore','IgnoreCase',true))
                ignoreIndex(j,1) = markerExtract{i,2};
                if(contains(markerExtract{i+1},'ignore','IgnoreCase',true))
                    ignoreIndex(j,2) =  markerExtract{i+1,2};
                    i=i+2;
                    j=j+1;
                else
                    disp('begin-end mismatch in ignore')
                end
            else
                i=i+1;
            end
        end

        indexVars = who('-regexp', 'Index');

        tempSize=0;
        for k=1:length(indexVars)
            temp =  eval(indexVars{k});
            tempSize = tempSize + (size(temp,1)*size(temp,2));
            clearvars temp

        end

        [folderCntr tempSize length(markerExtract)];

        if (~isequal(tempSize,length(markerExtract)))
            savedFileName
            error('Marker missing')
        end


    end

end