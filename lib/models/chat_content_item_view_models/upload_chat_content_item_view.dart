import 'package:firebase_chat_app/models/chat_content_item_models/upload_chat_content_item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../chat_content_item_type.dart';
import 'chat_content_item_view.dart';

///view class for chat content items where the data has come from a UploadChatContentItem.
class UploadChatContentItemView extends ChatContentItemView {
  final UploadChatContentItem _uploadChatContentItem;

  UploadChatContentItemView({
    required String id,
    required bool showName,
    required bool showDateHeading,
    required UploadChatContentItem uploadChatContentItem,
  })  : _uploadChatContentItem = uploadChatContentItem,
        super(
          id: id,
          showDateHeading: showDateHeading,
          showName: showName,
          chatContentItem: uploadChatContentItem,
        );

  Stream<TaskSnapshot>? get taskSnapshotEvents =>
      _uploadChatContentItem.uploadTask?.snapshotEvents;
}
