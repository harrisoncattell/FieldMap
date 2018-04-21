function []= FieldMap(Sample_Data, Output_Location, Scalling_Value, whatColourMap)
% ------- 2D Interpolation and Mapping function for pH Values -------
% Created by Harrison Cattell, 2018
%
% IMPORTANT NOTICES
% -----------
%
%   Interpolation scalling value MUST be a positive number above 0 and
%   below 10
%
%   Delimiter is set to ' '
%
% Description
% -----------
%   A 2D interpolation (bilinear) and mapping function for pH values
%    
%   input parameters are: 
%   Sample_Data
%           Sample data used in the interpolation and mapping
%
%   Output_Location
%           Location of the exported image
%
%   Scalling_Value
%           The factor that the sample data will scalled too.
%           Factor indicates how many times the sample data will scale, 
%           for example; a value of 1 will scale the data by 2, a value of
%           2 will scale the data by 4, etc.
%
%   whatColourMap
%           Allow user to specify which colormap is used to display the
%           data
%
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
%
    % Error checks scalling value, a value above ten causes program to run
    % very very slowly
    if Scalling_Value > 10

        % Displays error code 1
        error('FieldMap Error 1: Scalling value CAN NOT be above 10');

    elseif Scalling_Value < 1
        
        % Displays error code 2
        error('FieldMap Error 2: Scalling value MUST NOT be below 1');
        
    else
        imported_data = importdata(Sample_Data, ' ');

        % Interpolate sample data with scalling value
        interped_data = interp2(imported_data,Scalling_Value,'cubic'); 

        % Initalise custom color model for pH
        pH_map = [  0.7529, 0.0118, 0.2314  %pH 1 x
                    0.7725, 0.0235, 0.1647  %pH 1.5 x
                    0.7961, 0.0117, 0.1373  %pH 2 x
                    0.8941, 0.0941, 0.0     %pH 2.5 x
                    0.9647, 0.1490, 0.0039  %pH 3 x
                    0.9569, 0.2275, 0.0039  %pH 3.5 x
                    0.9373, 0.3137,  0.0392 %pH 4 x
                    0.9765, 0.4275, 0.0     %pH 4.5 x
                    0.9726, 0.5585, 0.1171  %pH 5 x
                    0.9843, 0.6757, 0.0039  %pH 5.5 x
                    0.9023, 0.8046, 0.0     %pH 6 x
                    0.7656, 0.8046, 0.0039  %pH 6.5 x
                    0.4218, 0.8007, 0.0039  %pH 7 x
                    0.25, 0.8046, 0.0117    %pH 7.5 x
                    0.0351, 0.7734, 0.0589  %pH 8 x
                    0.0937, 0.6718, 0.2070  %pH 8.5 x
                    0.1914, 0.5078, 0.4179  %pH 9 x
                    0.2226, 0.4218, 0.5937  %pH 9.5 x
                    0.2695, 0.2773, 0.7812  %pH 10 x
                    0.2148, 0.2148, 0.7226  %pH 10.5 x
                    0.1171, 0.1210, 0.6640  %pH 11
                    0.0703, 0.0742, 0.6289  %pH 11.5
                    0.0, 0.0039, 0.5507     %pH 12
                    0.0039, 0.0156, 0.5351  %pH 12.5
                    0.0078, 0.0429, 0.4453  %pH 13
                    0.0078, 0.0585, 0.4335  %pH 13.5
                    0.0185, 0.0546, 0.3867  %pH 14

                 ];

        if whatColourMap == 1

            % Display color map of interpolated values
            imagesc(interped_data);
            colormap(pH_map);

            % Makes colorbar visable and sets min and max values
            colorbar
            caxis([1 14]);
            saveas(gcf, Output_Location);

        elseif whatColourMap == 2

            % Display color map of interpolated values
            imagesc(interped_data);
            colormap hsv;
            
            % Makes colorbar visable and sets min and max values
            colorbar
            caxis([1 14]);
            saveas(gcf, Output_Location);

        end

    end

end

% -------------------------------------------------------------------------

