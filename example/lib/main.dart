import 'package:example/response.dart';
import 'package:flutter/material.dart';
import 'package:ikchatbot/ikChatBot.dart';

import 'keywords.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final chatBotConfig = IkChatBotConfig(
      userIcon: const Icon(Icons.person,color: Colors.white,),
      botIcon:  Image.asset("assets/appIcon.png"),
      botChatColor: Color(0xFFE9E9E9),
      closingTime: 5, //This is calculated in minutes
      delayResponse: 5, //This is calculated in minutes
      userChatColor: Color(0xFFE9E9E9),
      waitingTime: 5, //This is calculated in minutes
      keywords: keywords,
      responses: responses,
      backgroundColor: Colors.white,
      backgroundImageUrl: 'https://cdn.wallpapersafari.com/54/0/HluF7g.jpg',
      initialGreeting: "👋 ?Hello! \nWelcome to IkBot\nHow can I assist you today?",
      defaultResponse: "Sorry, I didn't understand your response.",
      inactivityMessage: "Is there anything else you need help with?",
      closingMessage: "This conversation will now close.",
      inputHint: 'Send a message', chatTextColor: Colors.black, onPressed: () {  },
    );

    return MaterialApp(
      title: 'Flutter Demo',
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
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   if(_chatIsOpened =  false) {
      //     setState(() {
      //     _chatIsOpened = true;
      //     });
      //   }else {
      //     setState(() {
      //       _chatIsOpened = false;
      //     });
      //   }
      //
      // },
      // child: Icon(Icons.chat),),
      body: _chatIsOpened ? Center(
        child: Text('Welcome to my app,'),
      ) : IkChatBot(config: widget.chatBotConfig)
    );
  }
}
