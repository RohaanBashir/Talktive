part of 'message_cubit.dart';

@immutable
sealed class MessageState {}

final class MessageInitial extends MessageState {}

final class MessageLoadSuccess extends MessageState {

  List<MessageEntity> messages;
  MessageLoadSuccess({required this.messages});
}

final class MessageError extends MessageState {

  String error;
  MessageError({required this.error});
}

final class MessageLoading extends MessageState {}
