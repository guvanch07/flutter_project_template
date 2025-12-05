# Flutter Project Template Brick

A Mason brick that generates a production-ready Flutter project with Clean Architecture, Bloc, GoRouter, Dio, GetIt, and more.

## Features

- **Clean Architecture**: Separation of concerns with Data, Domain, and Presentation layers.
- **State Management**: Flutter Bloc (Cubit).
- **Navigation**: GoRouter with type-safe routes and ShellRoute for bottom navigation.
- **Dependency Injection**: Manual `GetIt` registration for full control and transparency.
- **Networking**: Dio with Retrofit for type-safe API calls.
- **Localization**: Slang (fast, type-safe, no context needed).
- **Assets**: Structured assets folder (`assets/i18n`, `assets/svg`, `assets/png`).
- **Error Handling**: `BaseFailure` and `Either` pattern for robust error handling.
- **Linting**: Strict `analysis_options.yaml` for high code quality.
- **Makefile**: Pre-configured commands for common tasks.
- **CI/CD Ready**: Includes `flutter create` hook to generate platform files automatically.

## Prerequisites

- [Dart SDK](https://dart.dev/get-dart)
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Mason CLI](https://pub.dev/packages/mason_cli)

```bash
dart pub global activate mason_cli
mason init
```

## Installation

### Option 1: Add from Git (Recommended)

You can add this brick directly from the git repository:

```bash
mason add flutter_project_template --git-url ssh://git@g.326labs.com:50022/guvanch.amanov/flutter_project_template.git
```

### Option 2: Local Usage

If you have cloned this repository locally:

```bash
mason add flutter_project_template --path ./path/to/flutter_project_template
```

## Usage

Generate a new project by running:

```bash
mason make flutter_project_template
```

Follow the prompts:
- **Project Name**: The name of your new Flutter project (e.g., `my_awesome_app`).
- **Organization**: Your organization domain (e.g., `com.example`).

### Post-Generation Setup

Once the project is generated:

1.  **Navigate to the project directory**:
    ```bash
    cd my_awesome_app
    ```

2.  **Initialize the project**:
    This command runs `flutter clean`, `flutter pub get`, generates code, and runs slang.
    ```bash
    make init
    ```

3.  **Run the app**:
    ```bash
    flutter run
    ```

## Project Structure

```
lib/
├── data/                  # Data Layer
│   ├── models/            # Data models (JSON serialization)
│   ├── remote/            # API clients (Retrofit)
│   ├── repositories/      # Repository implementations
│   └── services/          # External services (Firebase, Supabase)
├── domain/                # Domain Layer
│   ├── entities/          # Business objects & Failures
│   └── repositories/      # Repository interfaces
├── internal/              # Internal utilities
│   ├── analytics/         # Analytics abstraction & providers
│   └── styles/            # App theming
├── presentation/          # Presentation Layer
│   ├── blocs/             # State management (Cubits)
│   ├── route/             # Navigation (GoRouter)
│   ├── screens/           # UI Screens
│   └── widgets/           # Reusable widgets
├── injection.dart         # Dependency Injection setup
└── main.dart              # Entry point
```

## Commands (Makefile)

- `make init`: Full initialization (clean, pub get, build_runner, slang).
- `make clean`: Runs `flutter clean`.
- `make pub_get`: Runs `flutter pub get`.
- `make generate_models`: Runs `build_runner build`.
- `make slang`: Generates translations.
