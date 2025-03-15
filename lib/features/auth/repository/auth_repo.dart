

import '../../../entities/MyUser.dart';

abstract class AuthRepository{

  Future<MyUser?> login(String email, String password);
  Future<String?> register(String name, String email, String password);

}