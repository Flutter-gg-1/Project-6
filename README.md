# 'Coffee Hub' App

## Overview

'Coffee Hub' is a coffee ordering App is a fully functional application designed to provide users with an intuitive experience for ordering coffee. It implements core features and essential concepts, allowing users to browse coffee types, customize their orders, and manage their cart seamlessly. The following link displays the interfaces design: https://www.figma.com/design/Ue7vb97b9EtBQqtgDlBm72/Simple-looking-Coffee-Shop-app-Minimal-Clean-UI-design-(Community)?node-id=4-12&t=CwfWQNjXda2sFVRJ-1

## Core Functionality

### User Authentication
- **Sign In**: Users can  sign into their accounts.
- **Sign Up**: New users can create an account to start using the app.

### Coffee Ordering Features
- **Display Coffee Types**: Users can browse a variety of coffee options.
- **Coffee Customization**: Users can select:
  - Amount of coffee
  - Size (small, medium, large)
  - Sugar amount
- **Add to Cart**: Users can add customized coffee orders to their cart.

### Cart Management
- **Display Cart**: Users can view their selected coffee items in the cart.
- **Modify Cart**: Users can update quantities or remove items from the cart.

### Profile Management
- **Profile Page**: Users can view their username and access a sign-out button.

## App Structure

The Coffee Ordering App consists of several screens, each serving a specific purpose:

```
┣📂lib
┣ 📂components
┃ ┣ 📂alert_dialog_widgets
┃ ┃ ┣ 📜custom_alert_dialog_widget.dart
┃ ┃ ┗ 📜success_dialog_signup.dart
┃ ┣ 📂app_bar_widget
┃ ┃ ┗ 📜custom_app_bar_widget.dart
┃ ┣ 📂button_widgets
┃ ┃ ┣ 📜custom_button.dart
┃ ┃ ┗ 📜custom_elevated_button_widget.dart
┃ ┣ 📂buy_widget
┃ ┃ ┗ 📜buy_more.dart
┃ ┣ 📂container_widget
┃ ┃ ┗ 📜custom_cart_container_widget.dart
┃ ┣ 📂form_widgets
┃ ┃ ┣ 📜login_form.dart
┃ ┃ ┗ 📜signup_form.dart
┃ ┣ 📂menu_widget
┃ ┃ ┗ 📜coffee_menu.dart
┃ ┣ 📂shimmer_widgets
┃ ┃ ┣ 📜shimmer_custom.dart
┃ ┃ ┗ 📜shimmer_loading.dart
┃ ┣ 📂text_field_widgets
┃ ┃ ┣ 📜custom_text_field_login.dart
┃ ┃ ┣ 📜custom_text_field_signup.dart
┃ ┃ ┗ 📜custom_text_field.dart
┃ ┗ 📂text_widgets
┃   ┣ 📜custom_rich_text_widget.dart
┃   ┗ 📜text_custom.dart
┣ 📂data_layer
┃ ┣ 📂data
┃ ┃ ┗ 📜coffee_data.dart
┃ ┗ 📂models
┃   ┗ 📜coffees_model.dart
┣ 📂screens
┃ ┣ 📂auth_screens
┃ ┃ ┣ 📜loading_screen.dart
┃ ┃ ┣ 📜login_screen.dart
┃ ┃ ┣ 📜signup_screen.dart
┃ ┃ ┗ 📜welcome_screen.dart
┃ ┣ 📂bloc
┃ ┃ ┣ 📜coffee_bloc.dart
┃ ┃ ┣ 📜coffee_event.dart
┃ ┃ ┗ 📜coffee_state.dart
┃ ┣ 📂bottom_navigaton_bar_screens
┃ ┃ ┣ 📜cart_screen.dart
┃ ┃ ┣ 📜home_screen.dart
┃ ┃ ┗ 📜profile_scrreen.dart
┃ ┣ 📜add_coffee_screen.dart
┃ ┣ 📜bottom_nav_bar.dart
┃ ┗ 📜nav_bar.dart
┣ 📂services
┃ ┗ 📜setup.dart
┗ 📜main.dart

```

## Technologies Used

### State Management
- **BLoC**: The app uses the BLoC (Business Logic Component) pattern for efficient state management, ensuring a reactive and maintainable codebase.

### Dependency Injection
- **GetIt**: Utilized for dependency injection, allowing for better management of services and data throughout the app.

### Data Storage
- **GetStorage**: A lightweight storage solution for persisting user and item information.

### Custom Widgets and Animations
The app features multiple custom widgets to maintain a clean code structure and enhance user experience with animations.

## Packages Used

The following packages are included in the project:

- `flutter_bloc: ^8.1.6`: For state management using the BLoC pattern.
- `flutter_svg: ^2.0.10+1`: For rendering SVG images.
- `get_it: ^7.7.0`: For dependency injection.
- `get_storage: ^2.1.1`: For local data storage.
- `lottie: ^3.1.2`: For integrating Lottie animations.
- `shimmer_animation: ^2.2.1`: For adding shimmer effects during loading states.

## Setup Instructions
### Prerequisites
- Flutter SDK
- Dart
- GetStorage package
### Installation
- Clone the repository:
- flutter pub get
- Run the app

## Team Members:
- Nouf Alqahtani
- Abdulaziz Alruwaily
- Amjad Elahi
- Linda Almakramy

