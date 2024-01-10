# simple_news

A simple, user friendly news app that consumes the API from [newsapi.org](https://newsapi.org).

## Getting Started
1. Install the most recent version of [Flutter](https://docs.flutter.dev/get-started/install), and make sure you also set up the `ios` and `android` platforms.
2. Install the dependencies:
```bash
flutter pub get
```
3. Run code generation:
```bash
dart run build_runner build
```
4. Start your emulator/simulator.
5. Verify if you instalation is correct:
```bash
flutter doctor
```
6. We fetch data from [newsapi.org](https://newsapi.org). To fetch the content, you will need an `API_KEY`, so please create an account.
7. Copy your API key from the [account](https://newsapi.org/account) section.
8. Replace with your `API_KEY` and run the app:
```sh
flutter run --dart-define API_KEY=REPLACEMEWITHYOURAPIKEY
```

## Running tests
Run unit tests run on your terminal:
```sh
flutter test
```

Run integration test on your terminal 

_NOTE: Integration tests require an emulator/simulator to run_:
```sh
flutter test integration_test
```

## Installing the artifact
This project contains a Github Actions Workflow to build an `APK`. This apk uses my personal `API_KEY` to fetch the data,
which if exceeds the permited usage, can be blocked for 1 day, this is not suppossed to happen easily, so if you want to test
the app quickly you can install this `APK` in your android device:
1. Navigate to [GHA](https://github.com/wanosoft/simple_news/actions/workflows/flutter-ci.yml).
2. Click on the most recent run.
3. Download the artifact.
4. Extract it and install it on your device.

## App Features
1. Fetch sources.
2. Pull to refresh.
3. Fetch sources from the background every 15 mins (If the app instance is not destroyed).
4. Fetch top-articles by source.
5. Save favorite articles in local storage.
6. Display a list of favorite articles.
7. Remove favorite articles.

## TODOs
This application was developed in a short time, so we're missing some features listed here:
1. Implement pagination (for remote and local content).
2. Enhance error handling