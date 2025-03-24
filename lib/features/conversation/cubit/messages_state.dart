part of 'messages_cubit.dart';

@immutable
sealed class MessagesState {}

final class MessagesInitial extends MessagesState {}

final class ConversationsFetchSuccess extends MessagesState{

  final List<ConversationEntity?> conversations;
  ConversationsFetchSuccess({required this.conversations});

}
final class MessagesStateError extends MessagesState{

  String error;
  MessagesStateError({required this.error});
}

final class MessagesStateLoading extends MessagesState{

  String status;
  MessagesStateLoading({required this.status});
}
