clear all, close all, clc
%% Dream3d AutoPipeline
%   This m-file is designed to open a predetermined dream3d pipeline file
%   with the intention of running several iterations with one or more
%   parameters varied.  Several pipeline .txt files are created along with
%   batch files to run pipelinerunner.exe.
fit = fopen('runnertest.txt','r'); %opens the predetermined pipeline
A = textscan(fit,'%s','delimiter','\n');

%   Find the pertinent lines
MisorTolFind = strfind(A{1}, 'MisorientationTolerance');
MisorTolRow = find(~cellfun('isempty', MisorTolFind));

MADFind = strfind(A{1}, 'MultiplesOfAverage');
MADRow = find(~cellfun('isempty', MADFind));

CAxisTolFind = strfind(A{1}, 'CAxisTolerance');
CAxisTolRow = find(~cellfun('isempty', CAxisTolFind));

D3DwriteFind = strfind(A{1}, 'OutputFile');
D3DwriteRow = find(~cellfun('isempty', D3DwriteFind));

CSVwriteFind = strfind(A{1}, 'FeatureDataFile');
CSVwriteRow = find(~cellfun('isempty', CSVwriteFind));

%   Enter the desired parameters
MisorTol = [5,8,10]; % Misorientation Tolerance (integer only)
MAD = [1:.1:2]; % Multiples Of Average Diameter 
CAxisTol = [18]; % CAxis Tolerance (integer only)

%   Create Temporary Folders
mkdir('TempBatchFolder')
mkdir('TempPipelineFolder')

for i = 1:length(MisorTol)
    for j = 1:length(MAD)
        for k = 1:length(CAxisTol)
            
            % file names for pipeline files
            fname = strcat('TempPipelineFolder\autopipeline-MisorTol',...
                num2str(MisorTol(i)),'-MAD',num2str(MAD(j)*10),'-CAxisTol',...
                num2str(CAxisTol(k)),'.txt');
            fid = fopen(fname,'w+');
            % path and name for written dream3d files.  Need double slashes
            % for pipelinerunner.exe
            outputfile = strcat('C:\\Users\\weihintj\\Desktop\\Samples\\sample_brs1d\\5-14-2014_pipelinerunner\\pipeline_output\\',...
                'autopipeline-MisorTol',num2str(MisorTol(i)),'-MAD',num2str(MAD(j)*10),...
                '-CAxisTol',num2str(CAxisTol(k)),'.dream3d');
            [path,name,ext] = fileparts(outputfile);
            
            % Rewriting pipeline file lines
            A{1}{MisorTolRow} = strcat('MisorientationTolerance=',...
                num2str(MisorTol(i)));
            A{1}{MADRow} = strcat('MultiplesOfAverage=',num2str(MAD(j)));
            A{1}{CAxisTolRow} = strcat('CAxisTolerance=',num2str(CAxisTol(k)));
            A{1}{D3DwriteRow} = strcat('OutputFile=',outputfile);
            A{1}{CSVwriteRow} = strcat('FeatureDataFile=',path,filesep,name,'.csv');
            
            % Writing pipeline files
            for n = 1:length(A{1})
                fprintf(fid,'%s',A{1}{n});
                fprintf(fid,'\r\n');
            end
            
            % Writing batch files
            batname = 'tempbatchfolder\batch.bat';
            batid = fopen(batname,'w+');
            b = strcat('c:\users\weihintj\desktop\tools\dream3d_AM_working\dream3d-2014.03-win64\pipelinerunner.exe -p "',...
                'c:\users\weihintj\documents\matlab\',fname,'"');
            fprintf(batid,'%s',b);
            fprintf(batid,'\r\n');
            fprintf(batid,'exit');
            
            % Run the batch file, i.e. execute the pipeline
            dos('tempbatchfolder\batch.bat &');
            
            fclose all;
        end
    end
end
%% Probability Plots
for i = 1:length(MisorTol)
    for j = 1:length(MAD)
        for k = 1:length(CAxisTol)
            
            
            
    outputfile = strcat('C:\\Users\\weihintj\\Desktop\\Samples\\sample_brs1d\\5-14-2014_pipelinerunner\\pipeline_output\\',...
                'autopipeline-MisorTol',num2str(MisorTol(i)),'-MAD',num2str(MAD(j)*10),...
                '-CAxisTol',num2str(CAxisTol(k)),'.dream3d');
    [path,name,ext] = fileparts(outputfile);
    
    % data read and probability plots
    EDD = h5read(outputfile,'/DataContainers/VolumeDataContainer/CellFeatureData/EquivalentDiameters');
    EDD = EDD(EDD >= 5); % this line for these data sets only
    
    
    figure(i+j+k); set(gcf,'Position', [1 1 1024 1024]);
        %  figure(12); set(gcf,'Position', get(0,'ScreenSize')); % open figure and maximize it
        h12=probplot('lognormal',EDD);
        grid on; grid minor;
        %         title('Minor Axis Diameter Distribution','fontsize',22);
        title(name,'fontsize',22);
        xlabel('Length, micrometers','fontsize',22);
        ylabel('Probability','fontsize',22);
        set(gca,'FontSize',18) % set the tick label font size
        set(h12,'MarkerFaceColor',[0.800000011920929 0.800000011920929 0.800000011920929],...
            'MarkerEdgeColor',[0 0 0],'MarkerSize',14,'linewidth',2,'Color',[0 0 1]);
        legend('Lognormal','Equivalent Diameters','Location','NW');
     
      
        figoutpath = strcat(path,filesep,name);
        savefigure(strcat(figoutpath,'-lognormal-pdf','.tif'),'-r600');
        end
    end   
end

fclose all;
rmdir('TempBatchFolder','s');
rmdir('TempPipelineFolder','s');
close all
            
            
            
            
            
            
            
            
            
            
            
