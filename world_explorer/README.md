# How to Launch and Navigate the App
## 1. Launch the App
Start the Application:
- If you're running the app on a physical device (e.g., Android or iOS), make sure the device is connected to your computer via USB.
- If you're using an emulator (Android Studio Emulator, iOS Simulator), make sure it is running.
- Open your terminal or command prompt on your computer and navigate to the project folder.
- Run the following command to start the app:
  
  flutter run
  
- The app should now build and launch on your connected device or emulator.
Splash Screen:

## 2. Search for a Country
Home Screen:
- The Home Screen of the app has a search bar at the top where you can look up countries.
- To search for a country, tap the search bar and start typing the name of the country you're interested in. The app will immediately begin searching as you type.
- You can search for any country in the world, and the app will show a list of matching results below the search bar.
- Each country in the list will display:
The flag of the country.
The region (e.g., Asia, Europe, Africa) the country belongs to.

## 3. View Country Details
Country Details Screen:
- After entering a country name and seeing the results, tap on any country from the list to view more details about that country.
- The app will take you to the Country Details Screen, where you'll find detailed information such as:
     - The capital city of the country.
     - The population of the country.
     - The region the country is in.
- The flag of the country, displayed prominently at the top of the screen.
- There will also be a "View Neighbors" button if the country has any neighboring countries.
  
## 4. Explore Neighboring Countries
Neighbors Screen:
- If the selected country shares borders with other countries, you'll see a "View Neighbors" button.
- Tap the button to see a list of the neighboring countries.
- The Neighbors Screen will show a list of countries that share borders with the selected country, including:
     - The name of the neighboring country.
     - The capital of the neighboring country.
- If there are no neighboring countries, the app will show a message "No neighbors found."
  
## 5. Navigation Between Screens
- Home Screen → Country Details Screen:
     After searching for a country, tap on the result you want, and the app will take you to the Country Details Screen.
- Country Details Screen → Neighbors Screen:
     If the selected country has neighbors, tap the "View Neighbors" button to navigate to the Neighbors Screen.
- Back to Home Screen:
     You can use the back arrow (usually located at the top left of the screen) to go back to the Home Screen from any other screen.

## 6. Additional Features
- Error Handling: If there’s an issue with the search or fetching data, an error message will appear informing you of the problem (e.g., "Error loading country details").
- Loading Indicator: While data is being fetched (e.g., when you search for a country), you’ll see a loading spinner until the information is ready.
