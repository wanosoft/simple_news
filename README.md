# simple_news

A simple, user friendly news app that consumes the API from [newsapi.org](https://newsapi.org).

## Getting Started
1. [Install the most recent version of Flutter](https://docs.flutter.dev/get-started/install), and make sure you also set up `ios` and `android` platforms. (This application was built specifically for mobile platforms.)
2. Install dependencies and generate the code:
```bash
flutter pub get
```
3. Start your emulator/simulator.

### Setup an `API_KEY` to fetch the data.
Since we fetch data from [newsapi.org](https://newsapi.org), we will need an API_KEY to fetch the content.
4. Copy your API key in the [account](https://newsapi.org/account) section.
5. Run the app with your API key in your bash:
```bash
flutter run --dart-define API_KEY="PASTE YOUR API HEY HERE"
```