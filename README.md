# simple_news

A simple, user friendly news app that consumes the API from [newsapi.org](https://newsapi.org).

## Getting Started
1. [Install the most recent version of Flutter](https://docs.flutter.dev/get-started/install), and make sure you also set up `ios` and `android` platforms.
```bash
flutter pub get
```
3. Run code generation.
```bash
dart run build_runner build
```
4. Start your emulator/simulator.
5. Verify if you instalation is correct:
```bash
flutter doctor
```

Since we fetch data from [newsapi.org](https://newsapi.org), we will need an `API_KEY` to fetch the content.

6. Copy your API key in the [account](https://newsapi.org/account) section.
7. Run the app with your API key in your bash:
```bash
flutter run --dart-define API_KEY=REPLACEMEWITHYOURAPIKEY
```

## App Features
### Sources view
1. Fetch sources.
2. Pull to refresh.
3. Navigate to top-articles view.

### Top articles view
4. Fetch top-articles by source.
5. Pull to refresh.
6. Save favourite articles in local storage.

### Favourites view
7. Display a list of favorite articles.
8. Remove favorite articles.

## TODOs
This application was developed in short time so we're missing some features listed here:
1. Implement pagination (for remote and local content).
2. Enhance error handling
3. Background updates