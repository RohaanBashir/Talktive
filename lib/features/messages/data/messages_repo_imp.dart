import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:talktive/entities/message_entity.dart';
import 'package:talktive/features/messages/repository/messages_repo.dart';

import '../../../entities/base_url.dart';

class MessageRepoImp extends MessagesRepo {
  final storage = FlutterSecureStorage();
  String baseurl = apiUrl;

  @override
  Future<List<MessageEntity>> fetchMessages(String conversationId) async {
    try {
      String token = await storage.read(key: "token") ?? "";
      final response = await http.get(
        Uri.parse("$baseurl/messages/$conversationId"),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List<MessageEntity> allMessages = [];
        for (var data in responseData) {
          var conversation = MessageEntity(
            id: data['id'],
            conversationId: data['conversation_id'],
            senderId: data['sender_id'],
            content: data['content'],
            createdAt: DateTime.parse(data['created_at']),
          );
          allMessages.add(conversation);
        }
        return allMessages;
      }else{
        throw Exception("Internal Error...");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> sendMessages(MessageEntity messageEntity) {
    // TODO: implement sendMessages
    throw UnimplementedError();
  }
}
