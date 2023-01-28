classdef FLSbagfileTest < matlab.unittest.TestCase
    
    methods(TestClassSetup)
        % Shared setup for the entire test class
    end
    
    methods(TestMethodSetup)
        % Setup for each test
    end
    
    methods(Test)
        % Test methods
        
        function flsMessageType(testCase)
            rosMessageTypes = rosmsg("list");
            testCase.verifyThat(matlab.unittest.constraints.AnyCellOf(rosMessageTypes), matlab.unittest.constraints.IsEqualTo('flyinglightspeck/fls'), 'flyinglightspeck/fls message type is not generated.')
            testCase.verifyThat(matlab.unittest.constraints.AnyCellOf(rosMessageTypes), matlab.unittest.constraints.IsEqualTo('flyinglightspeck/FLSDuration'), 'flyinglightspeck/FLSDuration message type is not generated.')
            testCase.verifyThat(matlab.unittest.constraints.AnyCellOf(rosMessageTypes), matlab.unittest.constraints.IsEqualTo('flyinglightspeck/FLSLHD'), 'flyinglightspeck/FLSLHD message type is not generated.')
            testCase.verifyThat(matlab.unittest.constraints.AnyCellOf(rosMessageTypes), matlab.unittest.constraints.IsEqualTo('flyinglightspeck/FLSRGBA'), 'flyinglightspeck/FLSRGBA message type is not generated.')
        end
    end
    
end