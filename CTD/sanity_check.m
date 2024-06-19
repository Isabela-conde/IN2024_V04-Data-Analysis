% General plots 

% function to do a general sanity check on variables and rejection criteria 
% Input: 
% file path
% T1 or T2 
% what runs you want to run in the file path 

% output:
% plot of the following against pressure
% eps
% log(chi) 
% gradT
% MAD
% W - speed
% sd W 
% NB rejection criteria in red dots

function sanity_check(folderPath, labels)


for j=1:length(labels)


    % Construct the search pattern for the current label
    searchPattern = strcat(labels{j}, '*.mat');

    
    % List all files matching the pattern in the folder
    files = dir(fullfile(folderPath, searchPattern));


    load(files(1).name)
    load(files(2).name)

    C=C512_2pole30msecW0;
    P = C.T2.P;

    logical_mask = C.T2.ok_pf14;  
    
    % Convert NaN values in the logical mask to false (0)
    logical_mask(isnan(logical_mask)) = 0;


    logical_mask_w =  C.ok_w;
    
    % Convert NaN values in the logical mask to false (0)
    logical_mask_w(isnan(logical_mask_w)) = 0;

    

    dummyvar = {log10(C.T2.chi),log10(C.T2.eps),C.T2.MAD,log10(C.T2.SNR),log10(C.spectra.speed),log10(C.spectra.speed_fast_std)};
    dummyvar_reject = {log10(C.T2.chi(~logical_mask)),log10(C.T2.eps(~logical_mask)),C.T2.MAD(~logical_mask),log10(C.T2.SNR(~logical_mask)),log10(C.spectra.speed(~logical_mask_w)),log10(C.spectra.speed_fast_std(~logical_mask_w))};

    % Create a new figure
    figure;
    numSubplots=7;
    % Define subplot positions
    positions = linspace(0.05, 0.95, numSubplots+1);
    
    % Loop to create subplots
    for i = 1:numSubplots
        % Create a subplot in a 1x7 grid
        ax = subplot(1, numSubplots, i);

        if i==1 
            % Plot dummy variable vs. pressure
            plot(gradT2,P_fast,'b');
            ylabel('Pressure');
            set(gca, 'YTickMode', 'auto', 'YTickLabelMode', 'auto');
            
        elseif i==6 || i==7
            plot(dummyvar{i-1}, P,'b');
            hold on
            plot(dummyvar_reject{i-1}, P(~logical_mask_w),'.r', MarkerSize=10);
            set(gca, 'YTick', [], 'YTickLabel', []);
        else
            % Plot dummy variable vs. pressure
            plot(dummyvar{i-1}, P,'b');
            hold on
            plot(dummyvar_reject{i-1}, P(~logical_mask),'.r', MarkerSize=15);
            set(gca, 'YTick', [], 'YTickLabel', []);

        end
            
        % Reverse y-axis direction
        set(gca, 'YDir', 'reverse', 'YLim', [150, 900]);

            % Set x-axis label with LaTeX notation
        switch i
            case 1
                xlabel('$\frac{\partial T''}{\partial t}$', 'Interpreter', 'latex','FontSize', 14);
                xlim([-2 2])
            case 2
                xlabel('$\log_{10} \chi$', 'Interpreter', 'latex','FontSize', 14);
                xlim([-15 -5])
            case 3
                xlabel('$\log_{10} \epsilon$', 'Interpreter', 'latex','FontSize', 14);
                xlim([-15 -5])
            case 4
                xlabel('MAD', 'Interpreter', 'none','FontSize', 14); 
                xlim([-0.75 1.5])
            case 5
                xlabel('$\log_{10} SNR$', 'Interpreter', 'latex','FontSize', 14);
                xlim([0 5])
            case 6
                xlabel('$W$', 'Interpreter', 'latex','FontSize', 14);
                xlim([-0.25 0.2])
            case 7
                xlabel('$W_{std}$', 'Interpreter', 'latex','FontSize', 14);
                xlim([-4 -1])
        end
        
        % Adjust subplot position
        set(ax, 'Position', [positions(i), 0.1, 0.12, 0.8]); 
        sgtitle([labels{j}], 'Interpreter', 'none', 'FontSize', 16);


    end

end

