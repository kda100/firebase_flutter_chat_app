import 'dart:io';
import 'package:firebase_chat_app/constants/color_palette.dart';
import 'package:firebase_chat_app/models/chat_item_type.dart';
import 'package:firebase_chat_app/models/chat_item_view_models/upload_chat_item_view.dart';
import 'package:firebase_chat_app/utilities/ui_util.dart';
import 'package:firebase_chat_app/widgets/platform_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/chat_provider.dart';
import '../../placeholder_widgets.dart';
import 'custom_linear_progress.dart';

///Widget used to display images and videos that are being uploaded to Firestore.
///They contain a progress bar so user can see progress of upload
///and a cancel button so user can cancel the operation at any time.

class UploadChatImageAndVideoWidget extends StatelessWidget {
  final UploadChatItemView uploadChatItemView;

  UploadChatImageAndVideoWidget({required this.uploadChatItemView});

  @override
  Widget build(BuildContext context) {
    final UIUtil uiUtil = UIUtil(context);
    var imagePath = uploadChatItemView.content; //image file path
    if (uploadChatItemView.chatItemType == ChatItemType.VIDEO) {
      imagePath = uploadChatItemView.content[1]; //thumbnail file path.
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: uiUtil.maxChatItemHeight,
            maxWidth: uiUtil.maxChatItemWidth,
            minWidth: uiUtil.maxChatItemWidth,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: ColorPalette.secondaryBackgroundColor,
            ),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Image.file(
                  File(imagePath),
                  errorBuilder: (context, exception, stackTrace) =>
                      BrokenImagePlaceHolderWidget(),
                ),
                if (uploadChatItemView.taskSnapshotEvents != null)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PlatformIconButton(
                        //button to cancel upload.
                        onPressed: () => Provider.of<ChatProvider>(
                          context,
                          listen: false,
                        ).cancelMediaUpload(id: uploadChatItemView.id),
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: uiUtil.iconSize,
                        ),
                      ),
                    ),
                  ),
                if (uploadChatItemView.chatItemType == ChatItemType.VIDEO)
                  Center(
                    child: Icon(
                      Icons.play_arrow,
                      size: uiUtil.iconSize * 4,
                      color: Platform.isIOS
                          ? CupertinoTheme.of(context).primaryColor
                          : Theme.of(context).primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
        CustomLinearProgress(
            taskSnapshotsEvents: uploadChatItemView.taskSnapshotEvents!),
      ],
    );
  }
}
