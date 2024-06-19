% plot histogram of epsilon and chi 
% tow 1 command line: 
% plot_profiles('/Users/isabelaconde/Documents/microstructure/data/yoyo1',{'DAT_015','DAT_016','DAT_017','DAT_018','DAT_019'},leg)
% tow 1 command line: 
% plot_profiles('/Users/isabelaconde/Documents/microstructure/data/yoyo2',{'DAT_020','DAT_022','DAT_023','DAT_014'},{'hour 0', 'hour 2', 'hour 7'})

function plot_profiles(folderPath,labels,leg)
    % folderPath = '/Users/isabelaconde/Documents/microstructure/data/yoyo1';
    %{'DAT_015','DAT_016','DAT_017','DAT_018','DAT_019'}

    chi = struct();
    eps = struct();
    pressure = struct();
    hist_colors = {'b', 'g', 'r', 'c', 'y', 'k', [0.5 0.5 0.5], [0.2 0.8 0.2]};

    
    for j=1:length(labels)
    
        % Construct the search pattern for the current label
        searchPattern = strcat(labels{j}, '*.mat');
        
        % List all files matching the pattern in the folder
        files = dir(fullfile(folderPath, searchPattern));
        
        load(files(1).name)
        load(files(2).name)
        
        C=C512_2pole30msecW0;
        
        qc_mask = C.T2.ok_pf14; % quality check on T2 for MAD and SNS
        
        chi(j).(labels{j}) =log10(C.T2.chi.*qc_mask);
        eps(j).(labels{j})=log10(C.T2.eps.*qc_mask);
        pressure(j).(labels{j}) = C.T2.P.*qc_mask;

    
    end 

    % Create figure
    figure;

    % Loop over each subplot
           
    % Loop over each field in chi
    for i = 1:length(labels)


        % get chi
        X = chi(i).(labels{i});

        % Plot profiles 
        plot(smoothdata2(X,"movmean",300),pressure(i).(labels{i}),'LineWidth',2.0,'DisplayName', leg{i})

        % Add x-axis label 
        xlabel('$\chi$', 'Interpreter', 'latex','FontSize', 14);
        
        % Add y-axis label 
        ylabel('Pressure dbar');
        set(gca, 'YDir', 'reverse', 'YLim', [250, 2000]);
        legend('Location', 'northwest');



        % Optionally add grid
        grid on;
        

        % Hold on for multiple plots in same subplot (optional)
        hold on;
    end

    % 
    figure;

    % Loop over each field in chi
    for i = 1:length(labels)

        % get epsilon
        X = eps(i).(labels{i});

        % Plot profiles
        plot(smoothdata2(X,"movmean",300),pressure(i).(labels{i}),'LineWidth',2.0,'DisplayName', leg{i})

        % Add x-axis label 
        xlabel('$\epsilon$', 'Interpreter', 'latex','FontSize', 14);
        
        % Add y-axis label 
        ylabel('Pressure dbar');
        set(gca, 'YDir', 'reverse', 'YLim', [250, 2000]);
        legend('Location', 'northwest');

        
        hold on;
    end

end
