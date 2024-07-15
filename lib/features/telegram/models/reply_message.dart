import 'package:equatable/equatable.dart';

class ReplyMessage extends Equatable {
  const ReplyMessage({
    this.message = '',
    this.author = '',
  });

  final String message;
  final String author;

  @override
  List<Object> get props => [
        message,
        author,
      ];
}
