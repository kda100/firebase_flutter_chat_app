import 'package:firebase_chat_app/models/chat_item_models/upload_chat_item.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'chat_item_view.dart';

///view class for chat content items where the data has come from a UploadChatContentItem.
class UploadChatItemView extends ChatItemView {
  final UploadChatItem _uploadChatContentItem;

  UploadChatItemView({
    required String id,
    required bool showName,
    required bool showDateHeading,
    required UploadChatItem uploadChatContentItem,
  })  : _uploadChatContentItem = uploadChatContentItem,
        super(
          id: id,
          showDateHeading: showDateHeading,
          showName: showName,
          chatItem: uploadChatContentItem,
        );

  Stream<TaskSnapshot>? get taskSnapshotEvents =>
      _uploadChatContentItem.uploadTask?.snapshotEvents;
}
