
<h1 align="center">
<b>DarkSkyWeather</b>
   <br><img width="275" height="500" src="https://user-images.githubusercontent.com/16679908/50728547-778ad880-10f9-11e9-8dfb-dadc3165def9.gif">
</h1>

## An example of consumption of the DarkSky.net API, the most accurate source of local weather information.

The backend request is done with NSURLSession.
The JSON serialization is done by conforming the Data Model to the Decodable Protocol.
All tasks are run through NsOperationQueue

The master view is a list of forecasts for the week with a summary for each day. The master has a header section with the current position and detailed conditions of the hour.

Selecting a day navigates to the detail view for that day.
The detail view displays fields as: 
- Sunrise and Sunset; 
- Precipitation Probability and Humidity;
- Speed and Wind Gust;
- Visibility and  Pressure;

The user can navigate back to the main list by touching the "Back" button in the navigation bar.



