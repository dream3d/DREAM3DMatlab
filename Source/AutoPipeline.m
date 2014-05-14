clear all, close all, clc
%% Dream3d AutoPipeline
%   This m-file is designed to open a predetermined dream3d pipeline file
%   with the intention of running several iterations with one or more
%   parameters varied.  Several pipeline .txt files are created along with
%   batch files to run pipelinerunner.exe.
fit = fopen('runnertest.txt','r'); %open the 
A = textscan(fit,'%s','delimiter','\n');
