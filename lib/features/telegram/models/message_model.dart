import 'package:screen_post/features/telegram/models/message_model.dart';
import 'package:screen_post/features/telegram/models/reply_message.dart';

export 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  const MessageModel({
    this.id = -1,
    this.message = '',
    this.date = '',
    this.isMe = false,
    this.replyMessage = const ReplyMessage(),
  });

  final int id;
  final String message;
  final String date;
  final bool isMe;
  final ReplyMessage replyMessage;

  @override
  List<Object> get props => [
        id,
        message,
        date,
        isMe,
        replyMessage,
      ];
}
