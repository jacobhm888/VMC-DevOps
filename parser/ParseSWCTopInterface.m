%% ============================================================
% VMC-DevOps
%
% File:
%   ParseSWCTopInterface.m
%
% Description:
%   Parse AUTOSAR style SWC top level interface
%
% Version:
%   v0.2
%
% ============================================================


function InterfaceTable = ParseSWCTopInterface(ModelPath)


fprintf("\n");
fprintf("====================================\n");
fprintf(" SWC Top Interface Parser v0.2\n");
fprintf("====================================\n");



%% Check model

if ~exist(ModelPath,"file")

    error("Model not found:\n%s",ModelPath);

end



%% Load model


[~,modelName,~] = fileparts(ModelPath);


load_system(ModelPath);


fprintf("\nAnalyzing SWC: %s\n",modelName);



%% Find top level ports

Ports = find_system(...
    modelName,...
    "SearchDepth",1,...
    "FollowLinks","on");



%% Storage

SWC = strings(0,1);

Direction = strings(0,1);

Signal = strings(0,1);

BlockType = strings(0,1);



%% Analyze ports


for i = 1:length(Ports)


    block = Ports{i};


    try

        type = get_param(block,"BlockType");


    catch

        continue;

    end



    %% Input Port

    if strcmp(type,"Inport")


        SWC(end+1)=modelName;

        Direction(end+1)="Input";

        Signal(end+1)=string(...
            get_param(block,"Name"));

        BlockType(end+1)=type;


    end



    %% Output Port

    if strcmp(type,"Outport")


        SWC(end+1)=modelName;

        Direction(end+1)="Output";

        Signal(end+1)=string(...
            get_param(block,"Name"));

        BlockType(end+1)=type;


    end


end



%% Generate table


InterfaceTable = table(...
    SWC,...
    Direction,...
    Signal,...
    BlockType);



InterfaceTable.Properties.VariableNames = ...
{
"SWC"
"Direction"
"Signal"
"BlockType"
};



%% Display

disp(InterfaceTable)



fprintf("\n");

fprintf("Interface extraction finished.\n");



end
