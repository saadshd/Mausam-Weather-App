# Mausam - Flutter Weather App

## Introduction

A **Flutter** weather app is designed to provide users with accurate information using their current location to display current weather data. It uses an API to display current weather data. This app is well-managed using **MVVM** architecture and **GETX**.

![Mausam Main](https://github.com/saadshd/Mausam-Weather-App/assets/101456852/177c00c9-d18b-47e1-8dc4-ead5d6af99ae)

![Mausam](https://github.com/saadshd/Mausam-Weather-App/assets/101456852/1ce32ec7-23b6-4e3d-b53d-bdf7fe629c68)


## Features

- Display current weather conditions including temperature, humidity, wind speed, and more from Weather API.
- Weather condition based app theme.
- Automatic user location detection for accurate weather information.
- Icons based on weather from API.
- User-friendly minimal interface.
- Error handling for API requests and network connectivity issues.

## Getting Started

Follow these steps to get the app up and running:

1. Clone the repository: `git clone https://github.com/saadshd/Mausam-Weather-App.git`
2. Install dependencies: `flutter pub get`
3. Add OpenWeatherMap API KEY on lib/res/app_url/api_key.dart `const apiKey = '<YOUR API KEY>';`
4. Run the app: `flutter run`

## API Key

The app integrates with a weather API to fetch weather data. The API key should be placed in the `lib/res/app_url/api_key.dart` file. You can obtain an API key by signing up on the [OpenWeatherMap API](https://openweathermap.org/) website. Must use your own API key.

## Dependencies

- [GetX](https://pub.dev/packages/get) - State management and dependency injection.
- [Http](https://pub.dev/packages/http) - For making HTTP requests to the weather API.
- [Intl](https://pub.dev/packages/intl) - Internationalization and formatting of dates.
- [Geolocator](https://pub.dev/packages/geolocator) - Getting device location.
- [Geocoding](https://pub.dev/packages/geocoding) - Getting latitude and longitude from address.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch `git checkout -b feature/AmazingFeature`
3. Commit your Changes `git commit -m 'Add some AmazingFeature'`
4. Push to the Branch `git push origin feature/AmazingFeature`
5. Open a Pull Request

## Show your support
Give a ⭐ if this project helped you! 

