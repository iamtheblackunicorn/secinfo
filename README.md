<p align="center">
 <img src="assets/images/banner.png"/>
</p>

# SEC INFO :heavy_check_mark:

*A small app to test the strength of your passwords.* :heavy_check_mark:

## About :books:

A while ago I designed an algorithm to test the strength of a password. The algorithm's output would be a number. This number would decide if the password was strong or not. *Sec Info* is the graphical implementation of this algorithm. The pure console- implementation can be found [here](https://github.com/iamtheblackunicorn/securitycheck).

## Download :inbox_tray:

- ***The Black Key*** (v.1.0.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/secinfo/releases/download/v.1.0.0/SecInfo-v1.0.0-BlackKey-Release.apk) (17.1 MB)***

## Building :hammer:

Make sure that you have the following programmes installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
$ keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the Java keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *Sec Info*.

## Extending the supported languages :book:

*Sec Info* is localized for German and English. To add a language, simply create a filed called `app_languagecode.arb` in `lib/l10n` where `languagecode` represents the languagecode for the language you want to add. If it were Spanish for example, you would create a file called `app_es.arb`.
Copy and paste the contents from one of the other `*.arb` files and edit the strings accordingly.
Finally, add this line in the list `supportedLocales` in the file `lib/main.dart`.

```dart
const Locale('languagecode', ''),
```

`languagecode` represents the language you are translating for.

## Changelog :black_nib:

### Version 1.0.0: ***Black Key***

- upload to GitHub
- polishing of the logic
- minor fixes

## Note :scroll:

- *Sec Info :heavy_check_mark:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
