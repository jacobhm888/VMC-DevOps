%% ============================================================
% VMC-DevOps
%
% File:
%   ParseInterface.m
%
% Description:
%   Parse Simulink SWC interface
%
% Version:
%   v0.1
%
% ============================================================


function InterfaceTable = ParseInterface(ModelPath)


fprintf("\n");
fprintf("==============================\n");
fprintf(" Interface Parser v0.1\n");
fprintf("==============================\n");



%% Check model


if ~exist(ModelPath,"file")

    error("Model not found:\n%s",ModelPath);

end



%% Load model


[~,modelName,~] = fileparts(ModelPath);


load_system(ModelPath);



fprintf("\nParsing SWC: %s\n",modelName);



%% Find Ports


inPorts = find_system(...
    modelName,...
    "SearchDepth",1,...
    "BlockType","Inport");


outPorts = find_system(...
    modelName,...
    "SearchDepth",1,...
    "BlockType","Outport");



%% Create Table


SWC = strings(0,1);

Direction = strings(0,1);

Name = strings(0,1);

DataType = strings(0,1);

SampleTime = strings(0,1);



%% Parse Input


for i = 1:length(inPorts)


    block = inPorts{i};


    SWC(end+1)=modelName;

    Direction(end+1)="Input";

    Name(end+1)=string(...
        get_param(block,"Name"));

    
    DataType(end+1)=string(...
        get_param(block,"OutDataTypeStr"));


    SampleTime(end+1)=string(...
        get_param(block,"SampleTime"));


end



%% Parse Output


for i = 1:length(outPorts)


    block = outPorts{i};


    SWC(end+1)=modelName;

    Direction(end+1)="Output";

    Name(end+1)=string(...
        get_param(block,"Name"));


    DataType(end+1)=string(...
        get_param(block,"OutDataTypeStr"));


    SampleTime(end+1)=string(...
        get_param(block,"SampleTime"));


end



%% Generate Table


InterfaceTable = table(...
    SWC',...
    Direction',...
    Name',...
    DataType',...
    SampleTime',...
    ...
    'VariableNames',...
    {
    "SWC",
    "Direction",
    "Name",
    "DataType",
    "SampleTime"
    });



%% Display


disp(InterfaceTable);



fprintf("\nInterface Parsing Finished.\n");



end
