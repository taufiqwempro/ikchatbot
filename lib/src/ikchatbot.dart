import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ikchatbot/src/response.dart';

import 'ChatMessage.dart';
import 'ike_chatbot_config.dart'; // Import the configuration class
import 'keywords.dart';

class IkChatBot extends StatefulWidget {
  final IkChatBotConfig config;

  const IkChatBot({Key? key, required this.config}) : super(key: key);

  @override
  State<IkChatBot> createState() => _IkChatBotState();
}

class _IkChatBotState extends State<IkChatBot> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  Timer? _inactivityTimer;
  Timer? _closeTimer;
  bool _isWaitingForUserResponse = true;
  bool _showTextField = true;

  @override
  void initState() {
    super.initState();
    _messages.add(ChatMessage(
      botColor: widget.config.botChatColor,
      botIcon: widget.config.botIcon,
      userColor: widget.config.userChatColor,
      userIcon: widget.config.userIcon,
      text: widget.config.initialGreeting, // Use the initial greeting from the config
      isUser: false,
      messageTime: DateTime.now(),
    ));

    _startInactivityTimer();
  }

  void _handleSubmitted(String text) {
    _inactivityTimer?.cancel();
    _closeTimer?.cancel();

    if (_isWaitingForUserResponse) {
      _handleUserResponse(text);
      return;
    }

    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        botColor: widget.config.botChatColor,
        botIcon: widget.config.botIcon,
        userColor: widget.config.userChatColor,
        userIcon: widget.config.userIcon,
        text: text,
        isUser: true,
        messageTime: DateTime.now(),
      ));
    });

    _textController.clear();

    Future.delayed( Duration(minutes: widget.config.closingTime), () {
      _handleUserResponse(text);
    });
  }

  int _findMatchingKeyword(String response) {
    for (int i = 0; i < widget.config.keywords.length; i++) {
      if (response.contains(widget.config.keywords[i])) {
        return i;
      }
    }
    return -1;
  }

  void _handleUserResponse(String response) {
    final lowerCaseResponse = response.trim().toLowerCase();

    String reply;
    String userSelectedOption;

    final int index = _findMatchingKeyword(lowerCaseResponse);

    if (index != -1) {
      userSelectedOption = response;
      reply = widget.config.responses[index];
    } else {
      userSelectedOption = "";
      reply = widget.config.defaultResponse;
    }

    if (userSelectedOption.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          botColor: widget.config.botChatColor,
          botIcon: widget.config.botIcon,
          userColor: widget.config.userChatColor,
          userIcon: widget.config.userIcon,
          text: userSelectedOption,
          isUser: true,
          messageTime: DateTime.now(),
        ));
      });
    }

    setState(() {
      _isWaitingForUserResponse = false;
    });

    // Delay for 1 second before adding the robot's reply
    Future.delayed(Duration(seconds: widget.config.delayResponse), () {
      setState(() {
        _messages.add(ChatMessage(
          botColor: widget.config.botChatColor,
          botIcon: widget.config.botIcon,
          userColor: widget.config.userChatColor,
          userIcon: widget.config.userIcon,
          text: reply,
          isUser: false,
          messageTime: DateTime.now(),
        ));
        _startInactivityTimer();
      });
      _textController.clear();
    });
  }

  void _startInactivityTimer() {
    _inactivityTimer = Timer( Duration(minutes: widget.config.waitingTime), () {
      if (!_isWaitingForUserResponse) {
        setState(() {
          _messages.add(ChatMessage(
            botColor: widget.config.botChatColor,
            botIcon: widget.config.botIcon,
            userColor: widget.config.userChatColor,
            userIcon: widget.config.userIcon,
            text: widget.config.inactivityMessage, // Use inactivity message from the config
            isUser: false,
            messageTime: DateTime.now(),
          ));
          _isWaitingForUserResponse = true;
          _startInactivityTimer();
        });
      } else {
        _startCloseTimer();
      }
    });
  }

  void _startCloseTimer() {
    _closeTimer = Timer(const Duration(minutes: 5), () {
      setState(() {
        _showTextField = false;
        _messages.add(ChatMessage(
          botColor: widget.config.botChatColor,
          botIcon: widget.config.botIcon,
          userColor: widget.config.userChatColor,
          userIcon: widget.config.userIcon,
          text: widget.config.closingMessage, // Use closing message from the config
          isUser: false,
          messageTime: DateTime.now(),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.config.backgroundImageUrl), // Use background image URL from the config
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  reverse: true,
                  itemBuilder: (_, int index) =>
                  _messages.reversed.toList()[index],
                  itemCount: _messages.length,
                ),
              ),
            ),
            const Divider(height: 1.0),
            _buildTextComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    if (!_showTextField) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.config.backgroundColor, // Use background color from the config
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                style: TextStyle(color: widget.config.chatTextColor),
                controller: _textController,
                onChanged: (text) {
                  if (!_isWaitingForUserResponse) {
                    _isWaitingForUserResponse = true;
                  }
                },
                decoration: InputDecoration.collapsed(

                  hintText: widget.config.inputHint, // Use input hint from the config
                ),
              ),
            ),
            _isWaitingForUserResponse?  IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _isWaitingForUserResponse? _handleSubmitted(_textController.text):null;
              },
            ):SizedBox(),
          ],
        ),
      ),
    );
  }
}
