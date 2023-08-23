<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

# ikChatBot Package

The `ikChatBot` package provides a customizable chatbot widget for Flutter applications. This widget allows you to easily integrate a chatbot into your app with various customization options.

## Features

- Customizable chatbot appearance
- User and bot icons
- Customizable chat bubble colors
- Control over inactivity and closing behavior
- Background image support
- Initial greeting and default responses
- Placeholder for user input
- Easy integration into Flutter apps

## Getting Started

To use this package, add `ikchatbot` to your `pubspec.yaml` file:

```yaml
dependencies:
  ikchatbot: ^1.0.0
```
```yaml
import 'package:flutter/material.dart';
import 'package:ikchatbot/ikChatBot.dart';
import 'keywords.dart';
```

final chatBotConfig = IkChatBotConfig(
    userIcon: const Icon(Icons.person, color: Colors.white),
    botIcon: const Icon(Icons.android, color: Colors.white),
    botChatColor: const Color.fromARGB(255, 81, 80, 80),
    closingTime: 5, // in minutes
    delayResponse: 5, // in minutes
    userChatColor: Colors.blue,
    waitingTime: 5, // in minutes
    keywords: keywords,
    responses: responses,
    backgroundColor: Colors.white,
    backgroundImageUrl: 'https://cdn.wallpapersafari.com/54/0/HluF7g.jpg',
    initialGreeting: "👋 Hello! \nWelcome to IkBot\nHow can I assist you today?",
    defaultResponse: "Sorry, I didn't understand your response.",
    inactivityMessage: "Is there anything else you need help with?",
    closingMessage: "This conversation will now close.",
    inputHint: 'Send a message',
);


  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
title: 'ikChatBot Demo',
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  ),
home: MyHomePage(chatBotConfig: chatBotConfig),
  );
}
}

class MyHomePage extends StatefulWidget {
  final IkChatBotConfig chatBotConfig;

const MyHomePage({Key? key, required this.chatBotConfig}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  class _MyHomePageState extends State<MyHomePage> {
  bool _chatIsOpened = false;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text('ikChatBot Example'),
      ),
       body: _chatIsOpened
          ? Center(
            child: Text('Welcome to my app'),
          ) : IkChatBot(config: widget.chatBotConfig),
    );
  }
}

```

## Additional information

To find more information, check out the package documentation.

Contributions are welcome! If you'd like to contribute to this package, please submit issues or pull requests on GitHub.


If you encounter any issues or need support, feel free to file issues on GitHub or contact us at support@afrilen.com.

Our team will do their best to respond promptly to issues and inquiries.
