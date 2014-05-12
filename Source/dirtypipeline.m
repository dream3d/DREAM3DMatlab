%% dirty attempt at running dream3d multiple times
clear all, close all, clc
% trying 
fit = fopen('runnertest.txt','r');

A = textscan(fit,'%s','delimiter','\n');
MAD = [1:.1:2];
% if A{1}{3}(1:19) == 'MultiplesOfAverage='

for i = 1:length(MAD)
        
        fname = strcat('C:\Users\weihintj\Desktop\Samples\sample_brs1d\5-12-2014_pipelinerunner\autopipeline_MAD_',num2str(MAD(i)*10),'.txt');
        fid = fopen(fname,'w+');
        
        [path,name,ext] = fileparts(fname);
        
    for j = 1:51
    fprintf(fid,'%s',A{1}{j});
    fprintf(fid,'\r\n'); 
    end
    
    fprintf(fid,'MultiplesOfAverage=%g\r\n',MAD(i));
    
    for q = 53:88
    fprintf(fid,'%s',A{1}{q});
    fprintf(fid,'\r\n'); 
    end

    outputfile = strcat('C:\\Users\\weihintj\\Desktop\\Samples\\sample_brs1d\\5-12-2014_pipelinerunner\\pipeline_output\\','autopipeline_MAD_',num2str(MAD(i)*10),'.dream3d');
    fprintf(fid,'OutputFile=%s\r\n',outputfile)
    fprintf(fid,'%s',A{1}{90})
    

    
    
end
fclose all

for k = 1:length(MAD)
b = strcat('c:\users\weihintj\desktop\tools\dream3d_AM_working\dream3d-2014.03-win64\pipelinerunner.exe -p "','C:\Users\weihintj\Desktop\Samples\sample_brs1d\5-12-2014_pipelinerunner\autopipeline_MAD_',num2str(MAD(k)*10),'.txt" &');
dos(b)
end