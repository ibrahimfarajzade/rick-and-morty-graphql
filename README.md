# Rick and Morty Characters App

**Rick and Morty Characters App** is a Flutter app that displays a list of characters from the popular animated TV show *Rick and Morty*. The app fetches data from the public [Rick and Morty API](https://rickandmortyapi.com/) using GraphQL and presents it in a clean, user-friendly interface.

## Features

- **GraphQL Integration**: Fetches character data using GraphQL queries from the Rick and Morty API.
- **BLoC Pattern**: State management is handled using the BLoC (Business Logic Component) pattern to manage states like loading, success, and error.
- **Clean Architecture**: The app follows clean architecture principles with separation of concerns into layers: Data, Domain, and Presentation.
- **Dependency Injection**: Uses `GetIt` for service and dependency injection to manage app dependencies and lifecycle.

## Technologies Used

- **Flutter**: A UI toolkit for building natively compiled applications for mobile from a single codebase.
- **GraphQL**: A query language for your API and runtime for executing queries with your existing data.
- **BLoC Pattern**: A state management approach to separate business logic from UI code.
- **GetIt**: A service locator for managing app dependencies and instances.