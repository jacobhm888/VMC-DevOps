function ProjectDB = BuildDatabase(SWCFolder, SaveFile)
%==========================================================================
% BuildDatabase
%
% Description:
%   Scan all SWC models and build a project database.
%
% Input:
%   SWCFolder  - Folder containing all supplier SWC models
%   SaveFile   - MAT database output file
%
% Output:
%   ProjectDB
%
% Author:
%   VMC-DevOps
%==========================================================================

fprintf('\n========================================\n');
fprintf(' Building Project Database\n');
fprintf('========================================\n');

%% Default Path

if nargin < 1 || isempty(SWCFolder)
    SWCFolder = fullfile(pwd,'SWC');
end

if nargin < 2 || isempty(SaveFile)
    SaveFile = fullfile(pwd,'database','ProjectDB.mat');
end

%% Check Folder

if ~exist(SWCFolder,'dir')
    error('SWC Folder does not exist.');
end

%% Scan Models

ModelFiles = dir(fullfile(SWCFolder,'*.slx'));

fprintf('Found %d SWC Models.\n',length(ModelFiles));

ProjectDB = struct();

ProjectDB.Version = "0.1";

ProjectDB.Time = datetime;

ProjectDB.SWC = [];

%% Loop Every SWC

for i = 1:length(ModelFiles)

    ModelName = erase(ModelFiles(i).name,'.slx');

    fprintf('\n[%d/%d] %s\n',i,length(ModelFiles),ModelName);

    SWC.Name = ModelName;

    SWC.Path = fullfile(ModelFiles(i).folder,...
                        ModelFiles(i).name);

    SWC.Interface = [];

    SWC.Runnable = [];

    SWC.Parameter = [];

    SWC.Bus = [];

    ProjectDB.SWC = [ProjectDB.SWC SWC];

end

%% Save Database

if ~exist(fileparts(SaveFile),'dir')
    mkdir(fileparts(SaveFile));
end

save(SaveFile,'ProjectDB');

fprintf('\nDatabase Saved:\n');

fprintf('%s\n',SaveFile);

fprintf('\nDone.\n');

end
