%% ============================================================
% VMC-DevOps
%
% File:
%   GenerateTopModel.m
%
% Description:
%   Generate VMC Top Model with Model Reference
%
% Version:
%   v0.1
%
% ============================================================


function GenerateTopModel(TaskTable)


%% Check input

if nargin < 1

    error("TaskTable input required.");

end



fprintf("\n");
fprintf("==============================\n");
fprintf(" Generate Top Model v0.1\n");
fprintf("==============================\n");



%% Project Root

currentFile = mfilename('fullpath');

projectRoot = fileparts(fileparts(currentFile));



topFolder = fullfile(...
    projectRoot,...
    "model");


if ~exist(topFolder,"dir")

    mkdir(topFolder);

end



topModel = "VMC_Top";

topPath = fullfile(...
    topFolder,...
    topModel);



%% Close Existing Model

if bdIsLoaded(topModel)

    close_system(topModel,0);

end



if exist(topPath+".slx","file")

    delete(topPath+".slx");

end



%% Create New Model


new_system(topModel);

open_system(topModel);



fprintf("Create model: %s\n",topModel);



%% Position


x = 100;

y = 50;


width = 160;

height = 80;

gap = 140;



%% Add Model Reference Blocks


for i = 1:height(TaskTable)


    swcName = string(TaskTable.SWC(i));


    blockPath = topModel + "/" + swcName;



    add_block(...
        "simulink/Ports & Subsystems/Model",...
        blockPath,...
        ...
        "ModelName",swcName,...
        ...
        "Position",...
        [x y x+width y+height]);



    fprintf("Add SWC: %s\n",swcName);



    y = y + gap;


end



%% Save


save_system(...
    topModel,...
    topPath);



close_system(topModel);



fprintf("\n");

fprintf("==============================\n");

fprintf("Top Model Generated\n");

fprintf("%s.slx\n",topPath);

fprintf("==============================\n");


end
