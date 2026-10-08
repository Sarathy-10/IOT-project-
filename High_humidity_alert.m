% Enter your MATLAB Code below
channelID = 3491866;
alertApiKey = 'TAKPNJGg0xIPFxlSLiG';

humidity = thingSpeakRead( ...
    channelID, ...
    'Fields', 2, ...
    'NumPoints', 1);

fprintf('Current Humidity = %.2f %%\n', humidity);

threshold = 70;

if isempty(humidity) || isnan(humidity)

    disp('No valid humidity data found.');

elseif humidity >= threshold

    disp('HIGH HUMIDITY ALERT!');

    alertUrl = "https://api.thingspeak.com/alerts/send";

    options = weboptions( ...
        "HeaderFields", ...
        ["ThingSpeak-Alerts-API-Key", alertApiKey]);

    alertSubject = "IoT Weather Station - High Humidity";

    alertBody = sprintf( ...
        "Humidity threshold exceeded.\nCurrent Humidity: %.2f %%\nLimit: %.2f %%", ...
        humidity, threshold);

    webwrite( ...
        alertUrl, ...
        "body", alertBody, ...
        "subject", alertSubject, ...
        options);

    disp('Humidity email request accepted!');

else

    disp('Humidity is normal.');

end
