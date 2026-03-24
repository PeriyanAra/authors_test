# Authors

`authors` is a Flutter app that currently focuses on searching and browsing authors from the Open Library API.

## Requirements

- Flutter: `3.41.4`
- Dart SDK: `^3.7.2`

If you are not using FVM, replace `fvm flutter` with `flutter`.

## Setup

Install dependencies:

```bash
fvm flutter pub get
```

Generate the Chopper client:

```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## Run

```bash
fvm flutter run
```

Example targets:

```bash
fvm flutter run -d ios
fvm flutter run -d android
```

## Test

```bash
fvm flutter test
```

There are currently no Dart test files in the repository, so this command is mainly useful once tests are added.

## Current functionality

- Search authors through the Open Library endpoint `https://openlibrary.org/search/authors.json`
- Display loading, empty, loaded, and error states with `AuthorsCubit`
- Show author summary data such as name, top work, work count, dates, alternate names, and top subjects
- Open a separate settings screen from the main authors screen
- Toggle and persist light or dark theme with `ThemeCubit` and shared preferences

## Architecture

The app follows a simple layered structure:

- `lib/app/`: app bootstrap, dependency registration, and root widget
- `lib/presentation/`: routes, screens, widgets, Cubits, and presentation theme setup
- `lib/domain/`: entities and repository mapping
- `lib/data/`: DTOs, Chopper service, and remote data source
- `lib/authors_app_shared/`: shared DI, storage, result/failure types, parsing helpers, and common providers
- `lib/authors_ui_foundations/`: reusable UI components and theme extensions

Data flow:

1. `AuthorsCubit` receives search input.
2. `AuthorRepository` requests data from `AuthorRemoteDataSource`.
3. `AuthorApiService` calls Open Library through Chopper.
4. DTOs are mapped into domain entities with safe parsing helpers.
5. Presentation models are emitted to the UI.

## Routing

The app currently has two routes:

- `/authors`
- `/settings`

## State management

- `flutter_bloc` is used for screen state
- `AuthorsCubit` handles author search state
- `ThemeCubit` loads and persists theme mode
- `provider` is used through `CommonDependenciesProvider` for shared dependency access

## Dependency wiring

Dependencies are registered in `registerAppDependencies()` in this order:

1. `CoreDependencies`
2. `DeviceDependencies`
3. `DataDependencies`
4. `DomainDependencies`
5. `PresentationDependencies`

The DI abstraction is `DI`, backed by `GetItDI`.

## UI and theming

The app uses the naming that exists in the codebase today:

- Root widget: `AuthorsApp`
- Theme entrypoint: `AuthorsAppTheme`
- Theme extensions: `AuthorsColorTheme`, `AuthorsTextTheme`, `AuthorsTextFieldTheme`
- UI package: `authors_ui_foundations`
- Shared package: `authors_app_shared`

The light and dark themes are attached to `MaterialApp.router`, and the active theme mode is stored locally.
