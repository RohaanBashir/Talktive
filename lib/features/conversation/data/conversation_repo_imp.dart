import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:talktive/entities/converstation_entity.dart';

import '../../../entities/base_url.dart';
import '../repository/conversation_repo.dart';

class ConversationRepoImp extends ConversationRepo {

  String baseurl = apiUrl;
  final _storage = FlutterSecureStorage();
  @override
  Future<List<ConversationEntity?>> fetchConversations() async {
    try{
      var token = await _storage.read(key: "token") ?? '';
      final response = await http.get(
        Uri.parse("$baseurl/conversations"),
        headers: {'Authorization': 'Bearer $token'},
      ); // Add timeout here
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List<ConversationEntity> allConversations = [];
        for(var data in responseData){
          var conversation = ConversationEntity(
              conversationId: data['conversation_id'],
              participantName: data['participant_name'],
              lastMessage: data['last_message'],
              time: DateTime.parse(data['last_message_time']));
          allConversations.add(conversation);
        }
        return allConversations;
      }else if(response.statusCode == 403){
        throw Exception("No token provided...");
      }else{
        throw Exception("Internal Error...");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}