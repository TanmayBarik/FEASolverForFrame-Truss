classdef element
    properties
        Node1Properties
        Node2Properties
        GlobalNodes
    end
    
    methods
        function obj = element(G1,u1,u2,u3,G2,u4,u5,u6)
            % Constructs an object of class element assigning properties
            % u1,u2,u3,u4,u5,u6 and its global nodes.
            obj.Node1Properties = [u1 u2 u3];
            obj.Node2Properties = [u4 u5 u6];
            obj.GlobalNodes = [G1 G2];
        end

        function UpdatedConnectivityList = UpdateConnectivityList(obj,CurrentConnectivityList)
            % Method takes current connectivity list and updates it.
            UpdatedConnectivityList= [CurrentConnectivityList; obj.GlobalNodes];
        end
    end
end