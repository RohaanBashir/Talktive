import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:talktive/entities/message_entity.dart';
import 'package:talktive/entities/socket_service.dart';
import 'package:talktive/features/auth/cubit/auth_cubit.dart';
import 'package:talktive/features/messages/data/messages_repo_imp.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  final socketService = SocketService();
  final List<MessageEntity> _messages = [];
  final messageRepo = MessageRepoImp();
  final _storage = FlutterSecureStorage();
  String? _currentUserId;

  Future<void> loadMessages(String conversationId) async {
    emit(MessageLoading());
    try {
      _currentUserId = await _storage.read(key: 'userId');
      final messages = await messageRepo.fetchMessages(conversationId);
      _messages.clear();
      _messages.addAll(messages);
      emit(MessageLoadSuccess(messages: List.from(_messages)));

      socketService.socket.emit('joinConversation', conversationId);
      socketService.socket.off('newMessage');
      socketService.socket.on('newMessage', (data) {
        onReceiverMessage(data);
      });
    } catch (e) {
      emit(MessageError(error: e.toString()));
    }
  }

  Future<void> sendMessage(
      String conversationId,
      String content,
      String senderId,
      ) async {
    try {
      final newMessage = {
        'conversationId': conversationId,
        'content': content,
        'senderId': senderId,
      };
      socketService.socket.emit('sendMessage', newMessage);

      // Don't add to local list here - wait for server response
    } catch (e) {
      emit(MessageError(error: e.toString()));
    }
  }

  Future<void> onReceiverMessage(dynamic messageEntity) async {
    try {
      final temp = messageEntity as Map<String, dynamic>;
      // Check if message already exists in local list
      if (_messages.any((m) => m.id == temp['id'])) return;
      final message = MessageEntity(
        id: temp['id'],
        conversationId: temp['conversation_id'],
        senderId: temp['sender_id'],
        content: temp['content'],
        createdAt: DateTime.parse(temp['created_at']),
      );
      _messages.add(message);
      emit(MessageLoadSuccess(messages: List.from(_messages)));
    } catch (e) {
      emit(MessageError(error: e.toString()));
    }
  }
}