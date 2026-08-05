%% ============================================================
% VMC-DevOps
%
% File:
%   LoadTaskOrder.m
%
% Description:
%   Load SWC execution order from TaskOrder.xlsx
%
% Version:
%   v0.1
%
% ============================================================


function TaskTable = LoadTaskOrder(FilePath)


%% Default Path

if nargin < 1

    currentFile = mfilename('fullpath');

    projectRoot = fileparts(fileparts(currentFile));

    FilePath = fullfile(...
        projectRoot,...
        "config",...
        "TaskOrder.xlsx");

end



fprintf("\n");
fprintf("==============================\n");
fprintf("  Task Order Loader v0.1\n");
fprintf("==============================\n");



%% Check File


if ~exist(FilePath,"file")

    error("TaskOrder file not found:\n%s",FilePath);

end



%% Read Excel


TaskTable = readtable(FilePath);



%% Check Required Columns


requiredColumns = {

    "Task_Order"
    "SWC"

};



for i = 1:length(requiredColumns)


    if ~ismember(requiredColumns{i},...
            TaskTable.Properties.VariableNames)

        error(...
        "Missing column: %s",...
        requiredColumns{i});

    end


end



%% Sort by Task Order


TaskTable = sortrows(...
    TaskTable,...
    "Task_Order");



%% Display


fprintf("\n");

fprintf("Total SWC Tasks : %d\n\n",...
    height(TaskTable));


for i = 1:height(TaskTable)


    fprintf("%3d  %-20s\n",...
        TaskTable.Task_Order(i),...
        string(TaskTable.SWC(i)));

end



fprintf("\nTask Order Loaded.\n");



end
