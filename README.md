## Demo Weather App for Wipro

This is an app developed in the MVVM-C architecture showcasing Swift 4's new Codable protocol and utilising Protocol Oriented Programming concepts throughout.

The chosen architecture is designed to make the code highly readable, maintainable and reusable. All communication between objects is via protocols.


## Build & Run

Requires Xcode 9.

The app is hardcoded with a valid API key and the location of London, UK. It will run directly in the simulator.


## Terminology

Model - The Entities and services which are unrelated to specific views or viewModels
View - The combination of both the View Controller and the View
ViewModel - Provides data to be displayed by the View Controller by conforming to various services
Coordinator - Responsible for creating the View/ViewModel stacks and handling navigation between screens


### Future Improvements

Before implementing any other features I would want to add unit tests to ensure all of the APIs are working correctly.

There are many improvements I would make to both the code and UI with more time. I would focus on displaying in an extremely clear and concise way so that the user can quickly see the forecasts. I would ensure it uses the user's location to display local forecasts as well as having the option to choose any other location. A detail view would be provided to show more detailed information where required.


