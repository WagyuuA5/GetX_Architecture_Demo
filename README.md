# GetX Architecture Demo

A comprehensive Flutter boilerplate and demonstration project utilizing [GetX](https://pub.dev/packages/get) for state management, routing, dependency injection, and more. This repository serves as a reference architecture for building scalable and maintainable Flutter applications with GetX.

##  Features Demonstrated

- **Route Management**: Named routes, navigation, and structured `app_pages.dart` / `app_routes.dart`.
- **Dependency Injection**: Bindings for separate lifecycles (`Get.lazyPut`, `Get.put`, `Get.putAsync`).
- **Middleware**: Route protection and redirection using `GetMiddleware`.
- **State Management (Reactive vs Simple)**: Side-by-side comparison of `.obs` (Obx) vs `GetBuilder`.
- **Services**: Persistent background services (`GetxService`).
- **GetStorage**: Simple and fast local storage for persisting data (Favorites feature).
- **Network Requests**: API fetching mapped to strongly-typed models using `Dio`.
- **GetX UI Elements**: Usage of `Get.snackbar`, `Get.defaultDialog`, and `Get.bottomSheet` without context.
- **Internationalization (I18n)**: Seamless language switching (English & Indonesian) using `Translations` and `.tr`.
- **Unit Testing**: Controller tests bypassing UI logic with `Get.testMode`.
- **CI/CD**: GitHub Actions workflow for automated testing and linting.

##  Folder Structure

This project follows a modular, feature-by-layer structure, heavily inspired by the official GetX CLI pattern:

```
lib/
│
├── app/
│   ├── bindings/       # Dependency injection classes for each route
│   ├── controllers/    # Business logic and state holders
│   ├── data/
│   │   └── models/     # Plain Dart objects (e.g., ProductModel)
│   ├── routes/         # Routing configurations (AppPages, AppRoutes, Middlewares)
│   ├── services/       # Persistent services (SessionService, FavoritesService)
│   ├── translation/    # I18n dictionaries (AppTranslations)
│   └── views/          # UI/Screens (LoginView, ProductListView, etc.)
│
└── main.dart           # App entry point & initialization
```

##  Getting Started

### Prerequisites

Ensure you have the latest stable version of Flutter installed.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/WagyuuA5/GetX_Architecture_Demo.git
   ```
2. Navigate to the project directory:
   ```bash
   cd GetX_Architecture_Demo
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

##  Testing

To run the automated controller unit tests and widget tests locally:

```bash
flutter test
```

##  CI / CD

This repository is equipped with GitHub Actions. On every push or pull request to the `main` branch, the workflow will automatically:
1. Setup Flutter
2. Run `flutter analyze`
3. Run `flutter test`

## Contributing

Feel free to fork this project and submit pull requests if you want to add more GetX advanced use cases!
