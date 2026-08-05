%% ============================================================
% VMC-DevOps
%
% File:
%   ScanSWC.m
%
% Description:
%   Scan all Simulink SWC models
%
% Version:
%   v0.1
%
% ============================================================


function SWCList = ScanSWC(SWCFolder)


%% Check input

if nargin < 1

    SWCFolder = fullfile(...
        pwd,...
        "SWC");

end


fprintf("\n");
fprintf("==============================\n");
fprintf("      SWC Scan Tool v0.1      \n");
fprintf("==============================\n");


%% Check folder


if ~exist(SWCFolder,"dir")

    error("SWC folder does not exist:\n%s",SWCFolder);

end



%% Scan SLX


files = dir(fullfile(SWCFolder,"*.slx"));



if isempty(files)

    warning("No Simulink model found.");

    SWCList = {};

    return;

end



%% Extract model names


SWCList = strings(length(files),1);



for i = 1:length(files)


    [~,name,~] = fileparts(files(i).name);


    SWCList(i)=name;


end



%% Sort


SWCList = sort(SWCList);



%% Display


fprintf("\nTotal SWC Number : %d\n\n",...
    length(SWCList));


for i = 1:length(SWCList)

    fprintf("%3d  %s\n",...
        i,...
        SWCList(i));

end


fprintf("\nSWC Scan Finished.\n");


end
