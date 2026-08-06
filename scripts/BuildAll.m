%% ============================================================
% VMC-DevOps
% Vehicle Motion Control Development Platform
%
% File:
%   BuildAll.m
%
% Description:
%   Main entry point for VMC model integration workflow
%
% Version:
%   v0.1.0
%
% Author:
%   VMC Development Team
%
% ============================================================

clear;
clc;

fprintf("\n");
fprintf("=============================================\n");
fprintf("       VMC-DevOps Build System v0.1          \n");
fprintf("=============================================\n");


%% ============================================================
% 1. Initialize Project Path
% =============================================================

fprintf("\n[1/5] Initialize Project...\n");


% Current script location
currentFile = mfilename('fullpath');

projectRoot = fileparts(fileparts(currentFile));


fprintf("Project Root:\n%s\n",projectRoot);



%% ============================================================
% 2. Add Project Paths
% =============================================================

fprintf("\n[2/5] Add MATLAB Paths...\n");


addpath(genpath(projectRoot));


fprintf("Path initialization finished.\n");



%% ============================================================
% 3. Check Project Structure
% =============================================================

fprintf("\n[3/5] Check Project Structure...\n");


requiredFolders = {

    "app"
    "build"
    "parser"
    "review"
    "report"
    "autosar"
    "config"
    "docs"
    "test"

};


for i = 1:length(requiredFolders)

    folder = fullfile(projectRoot,...
        requiredFolders{i});


    if exist(folder,"dir")

        fprintf("[OK] %s\n",requiredFolders{i});

    else

        fprintf("[MISS] %s\n",requiredFolders{i});

    end

end



%% ============================================================
% 4. Load Configuration
% =============================================================

fprintf("\n[4/5] Load Configuration...\n");


configFile = fullfile(...
    projectRoot,...
    "config",...
    "ProjectConfig.json");


if exist(configFile,"file")

    fprintf("Configuration found.\n");

else

    fprintf("No configuration file yet.\n");

end



%% ============================================================
% 5. Future Build Pipeline
% =============================================================

fprintf("\n[5/5] Build Pipeline\n");


fprintf("---------------------------------------------\n");

fprintf("TODO:\n");

fprintf("1. Scan SWC models\n");

fprintf("2. Generate Top Model\n");

fprintf("3. Parse Interfaces\n");

fprintf("4. Run Model Review\n");

fprintf("5. Build Code\n");


fprintf("---------------------------------------------\n");


fprintf("\nVMC-DevOps initialization finished.\n");

