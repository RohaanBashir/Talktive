
import 'package:talktive/entities/converstation_entity.dart';

abstract class ConversationRepo{

  Future<List<ConversationEntity?>> fetchConversations();
}