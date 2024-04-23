# Task 02: Harry Potter Character List App
## Project Description

This Flutter application retrieves a character list from a RESTful API and displays it on one screen. Users can tap on a character item to view detailed information on a separate screen.

## Features

- Fetches character data from the [Harry Potter API](https://hp-api.onrender.com/api/characters).

- Displays a list of characters with four attributes: picture, name, actor name, and house name.
- Navigates to a detailed character screen upon tapping a list item.
- Employs standard Material Design UI.

## Clean Architecture

- Data Layer:
  - Defines a Character model class to represent character data.
  - Implements a CharacterRepository interface with methods for fetching characters.
  - Provides a concrete ApiService class to handle API requests using the [retrofit](https://pub.dev/packages/retrofit) package.
- Business Logic Layer:
  - Implements a CharacterUseCase interface for fetching character data.
  - Provides a concrete GetCharactersUseCase class that interacts with the CharacterRepository.
- Presentation Layer:
  - Displays the character list screen using widgets like ListView.builder.
  - Fetches data from the GetCharactersUseCase and populates character list items.
  - Navigates to the character detail screen upon list item tap.