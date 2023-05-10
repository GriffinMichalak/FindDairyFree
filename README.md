# 📍🐄🙅‍♂️ FindDairyFree

An estimated 32 million adults have food allergies in the United States alone, and that number is continually rising ([AAFA](https://aafa.org/allergies/types-of-allergies/food-allergies/)). As such, it is becoming more and more important for individuals to 
find out-of-the-house options where they are comfortable eating, particually making sure they are aware of [cross-contact](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6324195/). 

⭐️ FindDairyFree is a map-based iOS application that is designed to help users locate nearby
restaurants, bakeries, and cafes that are "safe" for someone with a dairy allergy to eat at.

## Installation
To install and run this app locally, please follow the steps below:

1. Clone the repository: 
shell
     git clone <https://github.com/GriffinMichalak/FindDairyFree>

2. Open the project in XCode:
     cd FindDairyFreeApp
     open FindDairyFreeApp.xcodeproj

## Features
* 🗺️ An interactive map interface that displays the user's location (if they allow). Note that this app will not work to its full potential unless location services are enabled. 
* 📍 The ability to see all of the locations of restaurants (based on [Go Dairy Free's Database](https://www.godairyfree.org/dining-out/massachusetts-dairy-free-restaurants)) on a map interface. 
* ⚡️ Dynamic data loading from a live database
* ⏰ Hours available for each location
* ℹ️ Upon clicking on a particular restaurant on the app, the user can view the following information about it:
  *   The name of the restaurant
  *   Its address
  *   A link to their website (particularly the allergy information page if it is available).
  *   A description of the dairy-free options available, as given by [Go Dairy Free's Database](https://www.godairyfree.org/dining-out/massachusetts-dairy-free-restaurants). 
  *   Any tags the restaurant may have including but not limited to: Lunch/Dinner, Dessert, Vegan, Plant-Based, Cafe, Star, Coffee, Ice Cream, Bakery, Top-9, Japanese, Mexican, Greek, Vietnamese. (The user will also have the ability to create and add their own tags to a restaurant).  
* 📍 The user can add more locations manually if they want more options to display that are not listed already. The user will also have the option to fill out a form suggesting a new restaurant with dairy-free options.
* 🔎 Search for a particular restaurant or tag.
* 🚶 Once they choose a place in which they would like to travel to, they can click on a green "GO" button that will bring them to the Apple Maps app and give them directions to their destination. 
* ⚙️ A settings page that allows the user to change the default radius of restaurants they want to see. 
* 📝 The ability to add suggestions for new restaurants not listed on the app via [this form](https://forms.gle/ANr687gyHsKiG8WH6).

## Constraints 
* For the time being, this will only work for the Boston and Cambridge area. 
* More coming soon. 

## Documentation
Coming soon...

## Resources
* [Go Dairy Free](https://www.godairyfree.org/dining-out/massachusetts-dairy-free-restaurants)
* [Dairy-Free Database](https://docs.google.com/spreadsheets/d/1vquABTsStPYlnAoUd3v8wYRGziONnKeIpgHt5pkgf3g/edit#gid=0)
* [Proof of concept](https://www.google.com/maps/d/u/0/edit?mid=1tUeAencjJkK68huPsJLdf7cAsES5b-U&usp=sharing)
  * Links are not active, No photos, Cannot filter by tag
