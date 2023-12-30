# Weather Application

## Environment required

- Xcode: above 15
- Flutter: 3.16.5
- Android: Kotlin 1.7.10
- IDE: Android Studio

## Features

- Search current weather throw lat/long information.
- You can know all weather information at lat/long location.


## How to run this code

- I just setup it on Android Studio IDE. You need install it if it don't have in your device.
- Open source codes and follow next steps:
- Select develop configuration and  click run/debug icon.
- I just setup develop enviroment.

## Instructions

#### Common
- Components used to save custom widget/function/config/helper
- You can use all code into `commont component` by the way:
  `import 'package:weather/common/common.dart';`
- configs: save environment variables (load from .env.develop file)
- dialogs: save dialog widgets (error/location denied dialog)
- helpers: write custom function to get current location.
- widgets: save custom widgets

#### Features
- Components used to save all app feature
- Folder tree: screen/components/items(exists if screen have listview/gridview...)

#### Network
- Components used to access network.
- api: write service to connect network core to call weather api.
- models: write model to parse from Map to Object (easy to access value).
- another files: write network base.