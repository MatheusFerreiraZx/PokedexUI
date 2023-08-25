# PokedexUI

README - SwiftUI Pokédex using MVVM Architecture

*Description*

This is a simple Pokédex developed in Swift using the SwiftUI framework, following the MVVM (Model-View-ViewModel) architecture. The Pokédex fetches data from the public PokéAPI to display information about different species of Pokémon.

<img src="https://github.com/MatheusFerreiraZx/PokedexUI/assets/75784609/eb27ca0a-7a9d-4227-926b-4d7ff19f8de3" width="300">

*Features*

Pokémon List: Displays a paginated list of different Pokémon with their names and identification numbers.
MVVM Architecture: The app follows the Model-View-ViewModel architecture for clear organization and separation of responsibilities.

*System Requirements*

Xcode 12 or later
Device/simulator running iOS 14 or later

*How to Use*

Clone this repository to your local environment.
Open the project file Pokedex.xcodeproj in Xcode.
Navigate to the Constants folder and edit the APIConstants.swift file to configure the base URL of the PokéAPI, if necessary.
Build and run the app on the simulator or device.

*MVVM Architecture*

The MVVM (Model-View-ViewModel) architecture has been employed in this project to clearly separate responsibilities and enhance code maintainability. Here's an overview of the three main components of the architecture:

Model: Represents the data and business logic. In this case, the models are the structures defining the properties of Pokémon and other related entities.

View: Handles the presentation of data and user interaction. In SwiftUI, Views are built declaratively.

ViewModel: Acts as an intermediary between the Model and the View. It holds presentation logic, data formatting, and interactions. It can also handle data retrieval from the Model.

*Credits*

This app uses the PokéAPI, which provides the Pokémon data.

*Contribution*

Contributions are welcome! Feel free to fork this repository, make improvements, and submit a pull request.

*License*

This project is licensed under the MIT License.

