classdef FLSbagfileTest < matlab.unittest.TestCase
    
    methods(Test)

        function flsMessageType(testCase)
            rosMessageTypes = rosmsg("list");
            testCase.verifyThat(matlab.unittest.constraints.AnyCellOf(rosMessageTypes), matlab.unittest.constraints.IsEqualTo('flyinglightspeck/fls'), 'flyinglightspeck/fls message type is not generated.')
            testCase.verifyThat(matlab.unittest.constraints.AnyCellOf(rosMessageTypes), matlab.unittest.constraints.IsEqualTo('flyinglightspeck/FLSDuration'), 'flyinglightspeck/FLSDuration message type is not generated.')
            testCase.verifyThat(matlab.unittest.constraints.AnyCellOf(rosMessageTypes), matlab.unittest.constraints.IsEqualTo('flyinglightspeck/FLSLHD'), 'flyinglightspeck/FLSLHD message type is not generated.')
            testCase.verifyThat(matlab.unittest.constraints.AnyCellOf(rosMessageTypes), matlab.unittest.constraints.IsEqualTo('flyinglightspeck/FLSRGBA'), 'flyinglightspeck/FLSRGBA message type is not generated.')
        end

        function pointCloud(testCase)
            numberOfPoints = 20;
            numberOfPointClouds = 10;
            expLHD = randi(100, numberOfPoints, 3);
            expRGBA = randi(255, numberOfPoints, 3);
            delta = randi(3, 1, 3);
            
            FLSArray = {};
            for i=1:numberOfPoints    
                elts = [];
                for j=1:numberOfPointClouds
                    
                    coord = coordClass(expLHD(i,1)+j*delta(1), expLHD(i,2)+j*delta(2), expLHD(i,3)+j*delta(3));
                    color = colorClass(expRGBA(i,1), expRGBA(i,1), expRGBA(i,1), expRGBA(i,1));
                    duration = durationClass(j, min(numberOfPointClouds, j+1));
                
                    elts = [elts msgElt(coord, color, duration)];
                end
                FLSArray{i} = elts;
            end

            writeFlightPathToFile(FLSArray, '__test__.bag', '/test');

            randSeneIds = unique(randi(numberOfPointClouds, 1, 5));
            for i=1:length(randSeneIds)
                k = randSeneIds(i);
                [actLHD, actRGBA] = getPointCloudFromBagfile('__test__.bag', '/test', k, '__test__.ply');
                testCase.verifyEqual(actLHD, expLHD+k*delta);
                delete '__test__.ply'
            end
            delete '__test__.bag'
        end
    end
    
end