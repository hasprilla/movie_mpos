# movie_mpos

A brief description of your project and its features.

### Image 1

![Project Screenshot](/screenshot/1.jpeg)

### Image 2

![UI Design](/screenshot/2.jpeg)

## Dependencies

This project uses the following dependencies:

- **bloc**: ^8.1.4
- **cached_network_image**: ^3.4.1
- **cupertino_icons**: ^1.0.8
- **dartz**: ^0.10.1
- **dio**: ^5.7.0
- **equatable**: ^2.0.7
- **flutter**: SDK Flutter
- **flutter_bloc**: ^8.1.6
- **flutter_screenutil**: ^5.9.3
- **get_it**: ^8.0.2
- **go_router**: ^14.6.2
- **google_fonts**: ^6.2.1
- **hydrated_bloc**: ^9.1.5
- **logger**: ^2.5.0
- **path_provider**: ^2.1.5

## Prerequisites

Before running the project, make sure you have the following installed:

- **Flutter**: Ensure that Flutter is installed and configured on your machine. You can check this by running:

  ```bash
  flutter doctor
  ```

- **Dart**: Dart comes pre-installed with Flutter, so no separate installation is needed.

- **Android Studio / VS Code**: Install one of the IDEs to run and debug your Flutter app.

## How to Run the Project

1. **Clone the repository**:

   ```bash
   git clone https://github.com/hasprilla/movie_mpos.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd movie_mpos
   ```

3. **Install dependencies**:

   Run the following command to install the required dependencies listed in `pubspec.yaml`:

   ```bash
   flutter pub get
   ```

4. **Run the application**:

   Connect your device or start an emulator, and run the following command to start the app:

   ```bash
   flutter run
   ```

   If you have multiple devices connected, use the following command to specify a device:

   ```bash
   flutter run -d <device_id>
   ```

5. **Build for release (Optional)**:

   To build the app for release (Android or iOS), run:

   For Android:

   ```bash
   flutter build apk
   ```

   For iOS:

   ```bash
   flutter build ios
   ```

## Running Tests and Generating Coverage Report

### What is a Coverage Report?

A coverage report helps measure the extent to which the codebase is tested by unit tests. It provides insights into which parts of the code are covered by tests and highlights untested sections. This is useful for maintaining high-quality code and ensuring robust testing.

### Steps to Run Tests and Generate the Report

1. **Run tests with coverage**:

   Execute the following command to run all tests in the project and generate a coverage report:

   ```bash
   flutter test --coverage
   ```

   This will create a `coverage` folder in your project directory containing a `lcov.info` file, which holds the coverage data.

2. **Generate an HTML coverage report**:

   To visualize the coverage data, you can convert the `lcov.info` file into an HTML report. This requires the `lcov` tool.

   - **Install lcov**:

     For macOS:

     ```bash
     brew install lcov
     ```

     For Linux:

     ```bash
     sudo apt-get install lcov
     ```

   - **Generate the HTML report**:

     Run the following command to create the HTML report in the `coverage/html` directory:

     ```bash
     genhtml coverage/lcov.info -o coverage/html
     ```

3. **Open the coverage report**:

   Use this command to open the HTML report in your default web browser:

   ```bash
   open coverage/html/index.html
   ```

### Benefits of a Coverage Report

- **Identify untested code**: Helps locate parts of the code that lack test coverage.
- **Improve test quality**: Encourages writing tests for uncovered code, increasing overall code reliability.
- **Maintainability**: Ensures that new changes or features are properly tested.
