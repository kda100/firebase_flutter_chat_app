import 'dart:io';

import 'package:firebase_chat_app/constants/color_palette.dart';
import 'package:firebase_chat_app/providers/chat_provider.dart';
import 'package:firebase_chat_app/widgets/placeholder_widgets.dart';
import 'package:firebase_chat_app/screens/profile_pic_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///displays profile pic of chat user.

class FixedProfilePicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final String recipientName =
            Provider.of<ChatProvider>(context, listen: false).recipientName;
        Navigator.of(context).push(
          Platform.isIOS
              ? CupertinoPageRoute(
                  builder: (context) => ProfilePicScreen(
                    recipientName: recipientName,
                  ),
                )
              : MaterialPageRoute(
                  builder: (context) => ProfilePicScreen(
                    recipientName: recipientName,
                  ),
                ),
        );
      },
      child: CircleAvatar(
        backgroundColor: ColorPalette.primaryBackgroundColor,
        child: ClipOval(
          child: PersonPlaceHolderWidget(),
        ),
      ),
    );
  }
}
