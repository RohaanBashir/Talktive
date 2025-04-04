
import 'package:talktive/entities/message_entity.dart';

abstract class MessagesRepo{
  Future<List<MessageEntity>> fetchMessages(String conversationId);
  Future<void> sendMessages(MessageEntity messageEntity);
}