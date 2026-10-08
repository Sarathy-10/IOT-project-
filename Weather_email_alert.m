% Enter your MATLAB Code below
% ==========================================
% IOT WEATHER STATION - EMAIL ALERT
% ==========================================

channelID = 3491866;
alertApiKey = 'TAKPNJGg0xIPFxlSLiG';

% Read the latest temperature from Field 1
temperature = thingSpeakRead( ...
    channelID, ...
    'Fields', 1, ...
    'NumPoints', 1);

fprintf('Current Temperature = %.2f °C\n', temperature);

% Temperature threshold
threshold = 30;

if isempty(temperature) || isnan(temperature)

    disp('No valid temperature data found.');

elseif temperature >= threshold

    disp('ALERT CONDITION DETECTED!');

    alertUrl = "https://api.thingspeak.com/alerts/send";

    options = weboptions( ...
        "HeaderFields", ...
        ["ThingSpeak-Alerts-API-Key", alertApiKey]);

    alertSubject = "IoT Weather Station - High Temperature";

    alertBody = sprintf( ...
        "Temperature threshold exceeded.\nCurrent Temperature: %.2f C\nLimit: %.2f C", ...
        temperature, threshold);

    try

        webwrite( ...
            alertUrl, ...
            "body", alertBody, ...
            "subject", alertSubject, ...
            options);

        disp('EMAIL REQUEST ACCEPTED!');

    catch ME

        disp('EMAIL FAILED:');
        disp(ME.message);

    end

else

    disp('Temperature is normal.');
    disp('No alert required.');

end