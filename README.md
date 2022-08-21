# sample_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

## Installing
To install this app

```
git clone https://github.com/Rhemi7/Sample-app.git
```

And then in terminal install the required dependencies

```
flutter pub get
```

## Running the tests
Open a test file and run test cases in terminal

```
flutter test --no-sound-null-safety
```

## App Development Info
Folder Structure

  - Core: This contains things that were reused throughout thr project.
  - Feature: This is where every major feature in the project is located.
     - data: all calls made to the remote data/api are included here.
     - domain: represents bridge between the data layer and presentation layer, here all abstractions are made before being sent to the presentation layer
     - presentation: includes all classes and methods that make up the screens/pages of the app.
     
     
## Plugins
| Name | Description |
| --- | --- |
| Hooks Riverpod | Used for state management |
| Get it | Dependency Injection |
| Dartz | Functional programming in Dart |
| Mockito | Used for testing |
| Shared Preferences | Used for local storage |
| Http | Used for making network request |

