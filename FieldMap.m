function []= FieldMap(Sample_Data, Scalling_Value, De_Limiter)
% ------- 2D Interpolation and Mapping function for pH Values -------
% Created by Harrison Cattell, 2018
%
% IMPORTANT NOTICE
% -----------
%
%   Interpolation scalling value MUST be a positive number above 0 and
%   below 10
%
% Description
% -----------
%   A 2D interpolation (bilinear) and mapping function for pH values
%    
%   input parameters are: 
%   Sample_Data
%           Sample data used in the interpolation and mapping
%
%   Scalling_Value
%           The factor that the sample data will scalled too.
%           Factor indicates how many times the sample data will scale, 
%           for example; a value of 1 will scale the data by 2, a value of
%           2 will scale the data by 4, etc.
%
%   Delimiter
%           The value that identifies the seperation in the data, for
%           example, the delimiter would be ',' if the data is '1,3,4,5,6'
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
        
        % Exception handling for data importation and main algorithm         
        try

            imported_data = importdata(Sample_Data, De_Limiter);

            % Interpolate sample data with scalling value
            interped_data = interp2(imported_data,Scalling_Value); 

            % Initalise custom color model for pH
            pH_map = [  1.0, 0.0, 0.0           %Red
                        1.0, 0.3882, 0.2784     %Tomato
                        1.0, 0.6445, 0.0        %Orange
                        0.9583, 0.9583, 0.8594  %Beige
                        1.0, 1.0, 0.0           %Yellow
                        0.5675, 0.9295, 0.5625  %Light green
                        0.0, 1.0, 0.0           %Green
                        0.0, 0.6, 0.0           %Dark green
                        0.25, 0.8750, 0.8125    %Turquoise
                        0.6756, 0.8438, 0.8984  %Light blue
                        0.0, 0.0, 1.0           %Blue
                        0.0, 0.0, 0.5430        %Dark blue
                        0.9297, 0.5078, 0.9297  %Violet
                        0.5, 0.0, 0.5           %Purple

                      ];

            % Display color map of interpolated values
            imagesc(interped_data);
            colormap(pH_map);

            % Makes colorbar visable and sets min and max values
            colorbar
            caxis([1 14]);

        catch
  
            % Displays error code 3
            error('FieldMap Error 3: Problem with data import or calculation');

        end

    end

end

% -------------------------------------------------------------------------

