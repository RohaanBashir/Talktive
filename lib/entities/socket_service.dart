import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:talktive/entities/base_url.dart';

class SocketService {

  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;

  String baseUrl = apiUrl;

  late IO.Socket _socket;
  final storage = FlutterSecureStorage();

  SocketService._internal(){
    initSocket();
  }

  Future<void> initSocket() async {
    String token = await storage.read(key: "token") ?? "";
    _socket = IO.io(
      baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({'Authorization': 'Bearer $token'})
          .build(),
    );

    _socket.connect();
    _socket.onConnect((_) {
      print('Connected to socket ${_socket.id}');
    });

    _socket.onDisconnect((_) {
      print('Disconnected to socket ${_socket.id}');
    });

  }

  IO.Socket get socket => _socket;
}
