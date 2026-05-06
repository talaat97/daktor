# Daktor (دكتور)

Daktor is a professional healthcare application built with Flutter, designed to provide a seamless experience for finding doctors and managing medical consultations.

## 🚀 Features

- **Authentication & Security**: Secure login and sign-up with token-based authentication using Secure Storage.
- **Interactive Onboarding**: Smooth introduction flow for new users.
- **Home Dashboard**: Explore specialties, top doctors, and upcoming appointments.
- **Responsive UI**: Fully adapted for different screen sizes and orientations.
- **Offline Caching & State Management**: Robust handling of network requests and app state.

## 🛠 Tech Stack & Architecture

This project strictly adheres to **Clean Architecture** principles and a **Feature-First** folder structure to ensure scalability, maintainability, and testability.

### Core Technologies
- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it)
- **Networking**: [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit) for API calls.
- **Data Models / Generation**: [Freezed](https://pub.dev/packages/freezed) & [Json Serializable](https://pub.dev/packages/json_serializable)
- **Local Storage**: [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) & [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **UI Components**: [ScreenUtil](https://pub.dev/packages/flutter_screenutil) (for responsiveness), [Flutter SVG](https://pub.dev/packages/flutter_svg), [Shimmer](https://pub.dev/packages/shimmer), [Cached Network Image](https://pub.dev/packages/cached_network_image)

### Architecture
The project is structured by features. Inside `lib/`:
- `core/`: Contains globally shared utilities, widgets, networking configuration, theming, routing, and DI.
- `features/`: Contains the core functionalities of the app (`home`, `login`, `sign_up`, `onboarding`, etc.). Each feature is broken down into:
  - `data/`: Models, Repositories, and API Services.
  - `logic/`: BLoC / Cubit for state management.
  - `ui/`: Screens and feature-specific widgets.

## 🌍 Environments

The application supports multiple environments (flavors) for safe development and production deployments:

- **Staging**: `lib/main_staging.dart` - Used for active development and QA testing.
- **Production**: `lib/main_production.dart` - Used for the live release on App Store & Google Play.

## 💻 Getting Started

### Prerequisites
- Flutter SDK `^3.8.1`
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the code generator (Required for Freezed, Retrofit, and JSON Serializable):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

### Running the App

To run the application, specify the target environment file:

**For Staging:**
```bash
flutter run -t lib/main_staging.dart
```

**For Production:**
```bash
flutter run -t lib/main_production.dart
```

## 🤝 Contributing
When contributing to this repository, please ensure you follow the established Feature-First architecture. Run `dart format` and `flutter analyze` to verify code quality before creating a pull request.
