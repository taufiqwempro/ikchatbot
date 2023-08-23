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

ikChatBot Flutter Package

The ikChatBot Flutter package provides an easy way to integrate a customizable chatbot into your Flutter applications. This package allows you to quickly add a chat interface with interactive responses and user-friendly configuration options. With ikChatBot, you can enhance user engagement and provide automated assistance through a chat-based interface.


## Features

![Screenshot_1692811715](https://github.com/iksoft/ikchatbot/assets/62053085/3651c184-d70b-432a-a387-25a87b7128cd)

![Screenshot_1692812340](https://github.com/iksoft/ikchatbot/assets/62053085/62039c04-c9ec-4264-b9ef-97d2aac7d502)

![Screenshot_1692812345](https://github.com/iksoft/ikchatbot/assets/62053085/27608f5b-7f87-4211-ab03-cb4eba95fff9)

![Screenshot_1692812351](https://github.com/iksoft/ikchatbot/assets/62053085/29047cea-c895-4521-a32f-041258f3c8a8)

![Screenshot_1692812357](https://github.com/iksoft/ikchatbot/assets/62053085/be15065f-0ca4-4d3f-8567-928204e61150)

![Screenshot_1692812371](https://github.com/iksoft/ikchatbot/assets/62053085/02ef884b-3b91-4dda-97b5-dace0e2ad8c7)


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


Whether you're building a customer support app or just looking to add some interactivity to your application, ikChatBot can help you create a dynamic chatbot experience tailored to your needs.

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
```yaml
final chatBotConfig = IkChatBotConfig(
    userIcon: const Icon(Icons.person, color: Colors.white),
    botIcon: const Icon(Icons.android, color: Colors.white),
    botChatColor: const Color.fromARGB(255, 81, 80, 80),
    closingTime: 5, // in minutes
    delayResponse: 5, // in secods
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
```

Create a class to hold your keywords and resoponse for the bot
```yaml
final List<String> keywords = [
  'who are you',
  'what is flutter',
  'fuck',
  'sorry'
];

final List<String> responses = [
  'I am a bot created by Iksoft Original, a proud Ghanaian',
  'Flutter transforms the app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase.',
  'You are such an idiot to tell me this. you dont have future. Look for Iksoft Original and seek for knowledge. here is his number +233550138086. call him you lazy deep shit',
  'Good! i have forgiven you. dont do that again!'
];
```

```yaml
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
