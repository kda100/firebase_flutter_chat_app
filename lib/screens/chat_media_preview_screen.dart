import 'package:firebase_chat_app/constants/color_palette.dart';
import 'package:firebase_chat_app/models/chat_item_type.dart';
import 'package:firebase_chat_app/widgets/image_preview_widget.dart';
import 'package:firebase_chat_app/widgets/video_preview_widget.dart';
import 'package:firebase_chat_app/constants/strings.dart';
import 'package:flutter/material.dart';

///screen to present video and images to user.

class ChatMediaPreviewScreen extends StatelessWidget {
  final ChatItemType chatItemType;
  final String mediaPath;

  ChatMediaPreviewScreen({
    required this.chatItemType,
    required this.mediaPath,
  });

  Widget _buildMediaPreviewWidget() {
    if (chatItemType == ChatItemType.IMAGE) {
      return ImagePreviewWidget(
        imagePath: mediaPath,
      );
    } else if (chatItemType == ChatItemType.VIDEO) {
      return VideoPreviewWidget(
        videoPath: mediaPath,
      );
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
      ),
      backgroundColor: ColorPalette.secondaryBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: _buildMediaPreviewWidget(),
        ),
      ),
    );
  }
}
