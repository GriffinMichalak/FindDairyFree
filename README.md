# <img src="https://github.com/GriffinMichalak/FindDairyFree/assets/81431781/5f515894-b522-4b71-b919-593d240a2be8" alt="Alternative text" width="100" height="100" style="vertical-align: middle;"> Find Dairy Free


An estimated 32 million adults have food allergies in the United States alone, and that number is continually rising ([AAFA](https://aafa.org/allergies/types-of-allergies/food-allergies/)). As such, it is becoming more and more important for individuals to 
find out-of-the-house options where they are comfortable eating, particually making sure they are aware of [cross-contact](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6324195/), as well as finding food options that are safe for them. 

⭐️ FindDairyFree is a free, open-source, map-based iOS application that is designed to help users locate nearby
restaurants, bakeries, and cafes that are "safe" for someone with a dairy allergy to eat at.

## Requirements
* iOS 15.0+

## Installation
To install and run this app locally, follow the steps below:

1. Clone this repository: 

```
git clone https://github.com/GriffinMichalak/FindDairyFree
```

2. Open the project in XCode:

```
cd FindDairyFree
open FindDairyFree.xcodeproj
```

3. Build and run the app:
* Select the target device or simulator from the toolbar.
* Press the "Run" (▶️) button or use the shortcut `Cmd+R` or `Cmd+B` to build the project.

## Features
* 🗺️ An interactive map interface that displays the user's location (if they allow) via Apple Maps (with 3D capabilities). Note that this app will not work to its full potential unless location services are enabled. 
* 📍 The ability to see all of the locations of restaurants (based on [Go Dairy Free's Database](https://www.godairyfree.org/dining-out/massachusetts-dairy-free-restaurants)) on a map interface. 
* ⚡️ Dynamic data loading from a live database
* ⏰ Hours available for each location
* ℹ️ Upon clicking on a particular restaurant on the app, the user can view the following information about it:
  *   The name of the restaurant
  *   Its address
  *   A link to their website (particularly the allergy information page if it is available).
  *   A description of the dairy-free options available, as given by [Go Dairy Free's Database](https://www.godairyfree.org/dining-out/massachusetts-dairy-free-restaurants). 
  *   Any tags the restaurant may have including but not limited to: Bakery, BBQ, Breakfast, Burger, Cafe, Dessert, Drink, Greek, Grill, Healthy, Ice Cream, Japanese, Lunch/Dinner, Mexican, Pizza, Plant-Based, Pretze, Ramen, Sandwich, Spanish, Star, Thai, Top-9, Vegan, Vietnamese. (The user will also have the ability to create and add their own tags to a restaurant).  
* 📍 The user can add more locations manually if they want more options to display that are not listed already. The user will also have the option to fill out a form suggesting a new restaurant with dairy-free options.
* 🔎 Search for a particular restaurant or tag.
* 🚶 Once they choose a place in which they would like to travel to, they can click on a button with its address that will bring them to the Apple Maps app and give them directions to their destination. 
* ⚙️ A settings page that allows the user to view and manage tags, view and manage favorite locations, as well as change the theme (Light/Dark).
* 📝 The ability to add suggestions for new restaurants not listed on the app via [this form](https://forms.gle/ANr687gyHsKiG8WH6).

## Constraints 
* Supports iOS 15.0 and higher.
* For the time being, this will only work for restaurants in Massachusetts.
* Search bar is not currently functional.
* Does not yet include most national chains.
* Cannot yet filter by tag.
* Cannot yet add custom tags.
* Cannot yet favorite locations.

## Documentation
Coming soon...

## Usage
* Upon launching the app, the home screen displays a map with annotations for dairy-free locations near the user's location.
To search for specific locations, enter keywords in the search bar at the top of the screen. The map will update to display only the matching locations.
* Tap on an annotation to view detailed information about a location. Swipe up on the detail view to dismiss it.
* To customize the app's theme, tap the gear icon in the top right corner of the home screen to open the settings. In the settings, select a theme (light, dark, or system).
* In the settings, you can also manage tags and favorites. Tap on "Manage Tags" to view and modify tags associated with locations. Tap on "Manage Favorites" to view and modify your favorite locations.

## Contributing and Contact
Contributions are welcome! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request.

If you have any questions or suggestions regarding FindDairyFree, please feel free to contact me at michalak.g@northeastern.edu.

## License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/GriffinMichalak/FindDairyFree/blob/main/LICENSE)
 file for details.

## Resources
* [Go Dairy Free](https://www.godairyfree.org/dining-out/massachusetts-dairy-free-restaurants)
* [Dairy-Free Database](https://docs.google.com/spreadsheets/d/1vquABTsStPYlnAoUd3v8wYRGziONnKeIpgHt5pkgf3g/edit#gid=0)
* [Proof of concept](https://www.google.com/maps/d/u/0/edit?mid=1tUeAencjJkK68huPsJLdf7cAsES5b-U&usp=sharing)
  * Links are not active, Cannot filter by tag, cannot search for particular location, no key for tags, cannot add custom tags, must click on location to see name (inefficient)
* [Social Media Promo](https://www.instagram.com/finddairyfree/)
