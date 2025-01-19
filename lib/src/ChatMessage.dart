import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final bool showButton;
  final DateTime messageTime;
  final Color botColor;
  final Color userColor;
  final Widget botIcon;
  final Widget userIcon;
  final List<VoidCallback>? onPressedHandlers; // List of button handlers

  const ChatMessage({
    required this.text,
    required this.isUser,
    required this.messageTime,
    required this.botIcon,
    required this.userIcon,
    required this.botColor,
    required this.userColor,
    required this.showButton,
    this.onPressedHandlers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isUser)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: ClipOval(child: botIcon),
                  ),
                ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: isUser ? userColor : botColor,
                  borderRadius: isUser
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight:
                              showButton ? FontWeight.w500 : FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (showButton)
                      Column(
                        mainAxisSize: MainAxisSize
                            .min, // Prevents extra space in the column
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Aligns buttons tightly
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildItemsButton(
                              label: "Order Cancel",
                              onPressed: onPressedHandlers![0],
                              context: context),
                          _buildItemsButton(
                              label: "Earnings and Tips",
                              onPressed: onPressedHandlers![1],
                              context: context),
                          _buildItemsButton(
                              label: "Chat with Human",
                              onPressed: onPressedHandlers![2],
                              context: context),
                        ],
                      ),
                  ],
                ),
              ),
              if (isUser)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: userColor,
                    radius: 20.0,
                    child: userIcon,
                  ),
                ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
        //   child: Text(
        //     "${messageTime.hour}:${messageTime.minute}:${messageTime.second}",
        //     style: const TextStyle(color: Colors.grey),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildItemsButton(
      {required String label,
      required VoidCallback onPressed,
      required BuildContext context}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height * 0.04,
        width: width * 0.6,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: Center(
            child: Text(
          label,
          style: TextStyle(
              color: Colors.black, fontSize: 11, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

// return ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.white,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//
// fixedSize: Size(width * 0.6, height * 0.04), // Adjust height as before
// padding: EdgeInsets.symmetric(vertical: 0), // Ensure no vertical padding
// minimumSize: Size(width * 0.6, height * 0.04),
//
//
// ),
// onPressed: onPressed, child: Text(label,style: TextStyle(color: Colors.black,fontSize: 11),));
