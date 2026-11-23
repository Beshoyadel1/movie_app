<img width="900" height="1200" alt="1-profile_full" src="https://github.com/user-attachments/assets/781e2087-8111-4d60-9fc6-f2b37a762c6e" />
# Movie App

A Flutter movie discovery app: browse popular and top-rated titles, search the catalog, and keep your own favorites list and watchlist. Fully localized in English and Arabic.

## Features

- Browse popular, top-rated and genre-based movie lists
- Fast search across the catalog
- Movie details: overview, rating, cast and similar titles
- Favorites and watchlist saved per account
- Sign in with email/password or Google
- English and Arabic localization with RTL support

## Tech Stack

- Flutter & Dart
- State management: flutter_bloc (Cubit) + provider
- Networking: dio against REST APIs (YTS and Route movie APIs)
- Auth: Firebase Authentication with Google Sign-In
- Navigation: go_router
- Caching: cached_network_image, shared_preferences

## Screenshots

<p>
  <img width="260" alt="Onboarding" src="https://github.com/user-attachments/assets/0fff5f81-ec9c-4b01-914e-2f9b6581af2b" />
  <img width="260" alt="Authentication" src="https://github.com/user-attachments/assets/a26fa095-af7e-46fd-98c8-7482d32f1caf" />
  <img width="260" alt="Home" src="https://github.com/user-attachments/assets/53ff9d78-ef80-498f-9955-faafdda9dfe3" />
  <img width="260" alt="Search" src="https://github.com/user-attachments/assets/6a9420d7-5b97-436d-8d50-8122231c2c5d" />
</p>

## Getting Started

```bash
flutter pub get
flutter run
```
