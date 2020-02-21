# UPFR

Prototype of an event reservation app to experiment with firebase remote config, Google maps and design scaling.

I honestly don't remember why I choose such a cryptic project name. It probably does not matter too much for a prototype anyway :smile:

## Setup

1. Create a firebase project and copy `google-services.json` to the `android/app/` folder.
2. Generate a Google Maps API key.
3. Update `android/app/src/main/AndroidManifest.xml` with your Google Maps API key. See [Maps SDK for Android](https://developers.google.com/maps/documentation/android-sdk/get-api-key).
4. In the Firebase console, scroll down to the `Grow` menu option and select `Remote Config`. Associate a key named 'GOOGLE_MAP_KEY' with your Google Maps API key (check this [stackoverflow answer](https://stackoverflow.com/a/57384744/12120177)).

## Current Implementation Status

App is responsive.

### Pixel 2 (5.74 in, 1080×1920 px)

Login Screen | Home Dialog
--- | ---
![Main Screen](/screenshots/pixel_2_login.png?raw=true "Main Screen") | ![Timer Dialog](/screenshots/pixel_2_home.png?raw=true "Timer Dialog")

### Nexus 9 (8.9 in, 2048×1536 px)

Home Screen | Map Dialog
--- | ---
![Main Screen](/screenshots/nexus_9_home.png?raw=true "Main Screen") | ![Timer Dialog](/screenshots/nexus_9_map.png?raw=true "Timer Dialog")

## Learn More on Flutter

Here are a few resources to get you started if you are new to Flutter:

- [Official Flutter documentation](https://flutter.dev/docs)
- [Flutter youtube channel](https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw)
- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

## Created & Maintained by

[Christophe Bonello](https://github.com/cbonello)
([LinkedIn](https://www.linkedin.com/in/christophe-bonello))
([Twitter](https://twitter.com/chbonello))

[![Open Source](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/license-MIT-purple)](https://github.com/cbonello/amiidex/blob/master/LICENSE)

## Contribution Guidelines
This project is a fully open source project, and contributions are welcome.

## Credits

I believe that the image used in this demo app are royalty free. Images were downloaded from:

- [Empire State Building](https://en.wikipedia.org/wiki/Empire_State_Building)
- [Chrysler Building](https://www.askideas.com/amazing-view-of-chrysler-building-manhattan/)
- [Statue of Liberty](https://www.pxfuel.com/en/free-photo-xshlz)


## License

```
Copyright (c) 2020 Christophe Bonello

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
