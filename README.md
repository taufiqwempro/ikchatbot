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
![thumbnail](https://github.com/iksoft/ikchatbot/assets/62053085/bdf6530e-475a-424f-a065-b60cfe8bcdc7)
<div align="center">
    <img src="https://github.com/iksoft/ikchatbot/assets/62053085/3651c184-d70b-432a-a387-25a87b7128cd" alt="Screenshot 1" width="200"/>
    <img src="https://github.com/iksoft/ikchatbot/assets/62053085/62039c04-c9ec-4264-b9ef-97d2aac7d502" alt="Screenshot 2" width="200"/>
    <img src="https://github.com/iksoft/ikchatbot/assets/62053085/8d675799-4fe0-4ff0-b6f6-7dadf64e0502" alt="Screenshot 2" width="200"/>
    <img src="https://github.com/iksoft/ikchatbot/assets/62053085/6a598e63-091d-433e-982e-42cb8561c9ee" alt="Screenshot 2" width="200"/>
   
</div>


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
- Add Rating to your Chat Bot
- Send Rating feedback to your Mail
- Use SMTP for secure Mail Sending
- Use Bot typing.. features


Whether you're building a customer support app or just looking to add some interactivity to your application, ikChatBot can help you create a dynamic chatbot experience tailored to your needs.

## Getting Started

To use this package, add `ikchatbot` to your `pubspec.yaml` file:

```yaml
dependencies:
  ikchatbot: ^1.0.2
```
Import the package to your screen
```yaml
import 'package:ikchatbot/ikchatbot.dart';
```
Copy and Paste this fuction to use the features of the plugin
```yaml
final chatBotConfig = IkChatBotConfig(
    //SMTP Rating to your mail Settings
    ratingIconYes: const Icon(Icons.star),
    ratingIconNo: const Icon(Icons.star_border),
    ratingIconColor: Colors.black,
    ratingBackgroundColor: Colors.white,
    ratingButtonText: 'Submit Rating',
    thankyouText: 'Thanks for your rating!',
    ratingText: 'Rate your experience:',
    ratingTitle: 'Thank you for using the chatbot!',
    body: 'This is a test email sent from Flutter and Dart.',
    subject: 'Test Rating',
    recipient: 'recipient@example.com',
    isSecure: false,
    senderName: 'Your Name',
    smtpUsername: 'Your Email',
    smtpPassword: 'your password',
    smtpServer: 'stmp.gmail.com',
    smtpPort: 587,
    //Settings to your system Configurations
    sendIcon: const Icon(Icons.send, color: Colors.black),
    userIcon: const Icon(Icons.person, color: Colors.white),
    botIcon: const Icon(Icons.android, color: Colors.white),
    botChatColor: const Color.fromARGB(255, 81, 80, 80),
    delayBot: 100,
    closingTime: 1,
    delayResponse: 1,
    userChatColor: Colors.blue,
    waitingTime: 1,
    keywords: keywords,
    responses: responses,
    backgroundColor: Colors.white,
    backgroundImageUrl: 'https://cdn.wallpapersafari.com/54/0/HluF7g.jpg',
    initialGreeting:
    "👋 Hello! \nWelcome to IkBot\nHow can I assist you today?",
    defaultResponse: "Sorry, I didn't understand your response.",
    inactivityMessage: "Is there anything else you need help with?",
    closingMessage: "This conversation will now close.",
    inputHint: 'Send a message',
    waitingText: 'Please wait...',
  );
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

Full Example on how to use this plugin
```yaml
import 'package:example/response.dart';
import 'package:flutter/material.dart';
import 'package:ikchatbot/ikchatbot.dart';

import 'keywords.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final chatBotConfig = IkChatBotConfig(
    //SMTP Rating to your mail Settings
    ratingIconYes: const Icon(Icons.star),
    ratingIconNo: const Icon(Icons.star_border),
    ratingIconColor: Colors.black,
    ratingBackgroundColor: Colors.white,
    ratingButtonText: 'Submit Rating',
    thankyouText: 'Thanks for your rating!',
    ratingText: 'Rate your experience:',
    ratingTitle: 'Thank you for using the chatbot!',
    body: 'This is a test email sent from Flutter and Dart.',
    subject: 'Test Rating',
    recipient: 'recipient@example.com',
    isSecure: false,
    senderName: 'Your Name',
    smtpUsername: 'Your Email',
    smtpPassword: 'your password',
    smtpServer: 'stmp.gmail.com',
    smtpPort: 587,
    //Settings to your system Configurations
    sendIcon: const Icon(Icons.send, color: Colors.black),
    userIcon: const Icon(Icons.person, color: Colors.white),
    botIcon: const Icon(Icons.android, color: Colors.white),
    botChatColor: const Color.fromARGB(255, 81, 80, 80),
    delayBot: 100,
    closingTime: 1,
    delayResponse: 1,
    userChatColor: Colors.blue,
    waitingTime: 1,
    keywords: keywords,
    responses: responses,
    backgroundColor: Colors.white,
    backgroundImageUrl: 'https://cdn.wallpapersafari.com/54/0/HluF7g.jpg',
    initialGreeting:
    "👋 Hello! \nWelcome to IkBot\nHow can I assist you today?",
    defaultResponse: "Sorry, I didn't understand your response.",
    inactivityMessage: "Is there anything else you need help with?",
    closingMessage: "This conversation will now close.",
    inputHint: 'Send a message',
    waitingText: 'Please wait...',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ikChatBot Example'),
      ),
      body: IkChatBot(config: chatBotConfig),
    );
  }
}


```

## Additional information

To find more information, check out the package documentation.

Contributions are welcome! If you'd like to contribute to this package, please submit issues or pull requests on GitHub.


If you encounter any issues or need support, feel free to file issues on GitHub or contact us at iksofttechnologiesgh@gmail.com.

Our team will do their best to respond promptly to issues and inquiries.
