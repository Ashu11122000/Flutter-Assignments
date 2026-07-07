# Flutter Counter App

A simple Flutter Counter Application created to learn the basics of Flutter development, widget tree, state management using `setState()`, button interactions, and Material Design.

This project is part of my Flutter learning assignments.

---

# Project Preview

Current Features

- Increment Counter
- Decrement Counter
- Reset Counter
- Responsive Material UI
- Stateful Widget
- Clean Folder Structure

---

# Tech Stack

- Flutter
- Dart
- Material Design

---

# Flutter Version

```text
Flutter 3.x
Dart 3.12.x
```

---

# Project Structure

```

counter_app/
│
├── android/                 Android Platform
├── ios/                     iOS Platform
├── linux/                   Linux Platform
├── macos/                   macOS Platform
├── windows/                 Windows Platform
├── web/                     Web Platform
│
├── lib/
│   ├── main.dart
│   └── counter_screen.dart
│
├── test/
│
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
├── README.md
│
└── .gitignore

```

---

# Folder Explanation

## android/

Contains native Android application code.

---

## ios/

Contains native iOS application code.

---

## linux/

Contains Linux desktop support.

---

## macos/

Contains macOS desktop support.

---

## windows/

Contains Windows desktop support.

---

## web/

Contains Flutter Web configuration.

---

## lib/

Contains all Dart source code.

### main.dart

- Application entry point.
- Calls `runApp()`.
- Loads Counter Screen.

### counter_screen.dart

Contains

- UI
- Counter variable
- Buttons
- Business Logic
- setState()

---

## test/

Contains widget tests and unit tests.

---

## pubspec.yaml

Project configuration file.

Contains

- Project name
- Version
- SDK version
- Dependencies
- Assets
- Fonts

---

## pubspec.lock

Automatically generated lock file.

Stores exact versions of installed packages.

Do not edit manually.

---

## analysis_options.yaml

Contains Dart lint rules and coding standards.

---

## .gitignore

Specifies files ignored by Git.

Examples

- build/
- .dart_tool/
- .idea/

---

# Project Workflow

```

main.dart
↓

CounterApp Widget
↓

CounterScreen
↓

StatefulWidget
↓

Counter Variable
↓

setState()

↓

UI Updates

```

---

# Prerequisites

Install

- Flutter SDK
- Dart SDK (comes with Flutter)
- Android Studio
- VS Code
- Android Emulator or Physical Device

Verify installation

```bash
flutter doctor
```

Everything should show ✓.

---

# Creating Project

Create a new Flutter project

```bash
flutter create counter_app
```

Move into project

```bash
cd counter_app
```

Open VS Code

```bash
code .
```

---

# Installing Dependencies

Download packages

```bash
flutter pub get
```

Upgrade packages

```bash
flutter pub upgrade
```

Clean project

```bash
flutter clean
```

Get packages again

```bash
flutter pub get
```

---

# Dependencies

## Main Dependency

| Package | Version | Purpose |
|----------|---------|----------|
| flutter | SDK | Flutter Framework |
| cupertino_icons | ^1.0.9 | iOS style icons |

---

## Development Dependencies

| Package       | Version|         Purpose        |
|---------------|--------|------------------------|
| flutter_test  |   SDK  |     Widget Testing     |
| flutter_lints | ^6.0.0 | Recommended Lint Rules |

---

# Transitive Dependencies

Installed automatically by Flutter.

Examples

- async
- collection
- meta
- path
- vector_math
- matcher
- stack_trace
- stream_channel
- test_api

No need to install them manually.

---

# Running Project

Run on connected device

```bash
flutter run
```

Run on Chrome

```bash
flutter run -d chrome
```

Run on Windows

```bash
flutter run -d windows
```

List connected devices

```bash
flutter devices
```

---

# Useful Flutter Commands

Check Flutter

```bash
flutter doctor
```

Get packages

```bash
flutter pub get
```

Upgrade packages

```bash
flutter pub upgrade
```

Analyze code

```bash
flutter analyze
```

Run tests

```bash
flutter test
```

Format code

```bash
dart format .
```

Hot Reload

```
r
```

Hot Restart

```
R
```

Quit application

```
q
```

---

# Concepts Learned

- Flutter Project Structure
- Widgets
- StatelessWidget
- StatefulWidget
- BuildContext
- Scaffold
- AppBar
- FloatingActionButton
- MaterialApp
- setState()
- State Management (Basic)
- Widget Tree
- Button Interaction
- Counter Logic

---

# Future Improvements

- Dark Mode
- Theme Switching
- Animated Counter
- Multiple Counters
- Persistent Counter (SharedPreferences)
- Riverpod State Management
- Provider State Management
- Bloc State Management

---
