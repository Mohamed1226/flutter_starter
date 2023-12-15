# starter

A starter Flutter project.

This starter project follow clean Architecture ,it supposed that you need to build app that need to
connection with API,
so i used data layer with abstraction and i used dio package just add your BASE_URL in api constants and go on...
but i prefer to add it in env.

if you need to use any other package just write your code and implement (NetProvider) class

# this project support

1- Localization stored in local storage (just and new keys then save)
2- Change app mode stored in local storage
3- Abstraction data source layer
4- Reusable widgets (PNGImageAsset(),SVGImageAsset(),AppTextFormFiled(),AppButton,etc)
5- Reusable screen StateFul,Stateless can make our UI changeable
6- styles (with google fonts)
7- Responsive ui
8- some ready animation
9- Reusable dialogs ,toast and snackBar
10- ready error handle
11- ready validators to use
12- DI with get_it package
13- Using JsonSerializable to generate models example in (app_url_model file) if you need to add new changes just run this command after editing
    dart run build_runner build --delete-conflicting-outputs
14- Using fvm (flutter version manager)



# note

This app build with new flutter version 3.13.8
APP is handling error just you need to integrate with crashlytics to record errors (AppErrorReporter class)


dart run build_runner build --delete-conflicting-outputs



![Screenshot_13](https://github.com/Mohamed1226/flutter_starter/assets/65566252/de523905-427c-414e-ba80-4c3e2b389417)
![Screenshot_11](https://github.com/Mohamed1226/flutter_starter/assets/65566252/0d318c92-fb5a-4ee6-a3e4-53b1d5e3290a)


