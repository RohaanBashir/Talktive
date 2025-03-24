
class ConversationEntity{

  String conversationId;
  String participantName;
  String lastMessage;
  DateTime time;

  
  ConversationEntity({required this.conversationId, required this.participantName, required this.lastMessage, required this.time});
}