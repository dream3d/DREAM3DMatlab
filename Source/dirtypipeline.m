%% dirty attempt at running dream3d multiple times
clear all, close all, clc
% trying 
fit = fopen('runnertest.txt','r');

A = textscan(fit,'%s','delimiter','\n');
MAD = [1:.1:2];
% if A{1}{3}(1:19) == 'MultiplesOfAverage='


%writing all the pipeline .txt files
for i = 1:length(MAD)
        
        fname = strcat('C:\Users\weihintj\Desktop\Samples\sample_brs1d\5-12-2014_pipelinerunner\autopipeline','MAD',num2str(MAD(i)*10),'.txt');
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

    outputfile = strcat('C:\\Users\\weihintj\\Desktop\\Samples\\sample_brs1d\\5-12-2014_pipelinerunner\\pipeline_output\\',name,'.dream3d');
    fprintf(fid,'OutputFile=%s\r\n',outputfile);
    
    for n = 90:94
    fprintf(fid,'%s',A{1}{n});
    fprintf(fid,'\r\n');
    end
    
    csv = strcat('C:\\Users\\weihintj\\Desktop\\Samples\\sample_brs1d\\5-12-2014_pipelinerunner\\pipeline_output\\',name,'.csv');
    fprintf(fid,'FeatureDataFile=%s\r\n',csv);
    fprintf(fid,'%s',A{1}{96});
    
    % creates temporary folder and writes batch files
    mkdir('tempbatchfolder')
    batname = strcat('tempbatchfolder\batch.bat');
    batid = fopen(batname,'w+');
    b = strcat('c:\users\weihintj\desktop\tools\dream3d_AM_working\dream3d-2014.03-win64\pipelinerunner.exe -p "',fname,'" '); % ampersand only works when the h5reads are in separate loop
    fprintf(batid,'%s',b);
    fprintf(batid,'\r\n');
    fprintf(batid,'exit');
    
    % run the batch files, i.e. execute the pipeline
    dos('tempbatchfolder\batch.bat &');

    fclose all
    
end

    
for g = 1:length(MAD)
    fname = strcat('C:\Users\weihintj\Desktop\Samples\sample_brs1d\5-12-2014_pipelinerunner\autopipeline','MAD',num2str(MAD(g)*10),'.txt');
    [path,name,ext] = fileparts(fname);
    outputfile = strcat('C:\\Users\\weihintj\\Desktop\\Samples\\sample_brs1d\\5-12-2014_pipelinerunner\\pipeline_output\\',name,'.dream3d');
    % data read and probability plots
    EDD = h5read(outputfile,'/DataContainers/VolumeDataContainer/CellFeatureData/EquivalentDiameters');
    EDD = EDD(EDD >= 10); % this line for these data sets only
    
    
    figure(g); set(gcf,'Position', [1 1 1024 1024]);
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
     
        % you'll need to name this appropriately (no extension, yet)
        figoutpath = strcat(path,filesep,name);
        savefigure(strcat(figoutpath,'-lognormal-pdf','.tif'),'-r600');

    
end
fclose all
rmdir('tempbatchfolder','s')
close all
