# Routine Checker

This is a solution to an interview challenge.

## Flutter

Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.

This project is built with flutter.

To check if you have flutter installed, run

```
flutter doctor 
```
if you don't have flutter installed and setup, follow this: [How to setup Flutter](https://docs.flutter.dev/get-started/install)


## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/JustineUgo/routine_checker.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Connect your mobile phone or emulator and run this command:

```
flutter run
```

## Modules

* Home
* Routine - convers the aspect of creating and updating routines

## Details

* Framewort: [Flutter](https://flutter.dev/) > 2.5 with Null Safety
* Architectural pattern: MVC(Model-View-Controller)
* Storage(local): [GetStorage](https://pub.dev/packages/get_storage)
* State management: [GetX](https://github.com/mobxjs/mobx.dart)

## Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- test
|- web
```

Here is the folder structure we have been using in this project

```
lib/app
|- data/
|- modules/
|- routes.dart
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.



## Conclusion

I will be happy to answer any questions that you may have on this project. 🙂

If you liked my work, don’t forget to ⭐ star the repo.
