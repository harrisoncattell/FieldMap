function []= IntMap2D(Sample_Data, Scalling_Value, De_Limiter)
% ------- 2D Interpolation and Mapping function for pH Values -------
% Created by Harrison Cattell, 2018
%
% IMPORTANT NOTICE
% -----------
%s
%   Interpolation scalling value MUST be a positive number above 0
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
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
%
% Exception handling for importing sample data
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
    
        msgID = 'IaM:FileError';
        msg = 'Error carrying out interpolation, check the file location is correct, the delimiter is correctly specified and the sample data is a regular sized matrix';
        baseException = MException(msgID,msg);

        throw(baseException);
        
    end

end

% -------------------------------------------------------------------------

