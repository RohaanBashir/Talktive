

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:talktive/features/auth/repository/auth_repo.dart';

import '../../../entities/MyUser.dart';

class AuthRepoImplementation extends AuthRepository {

  final baseurl = "http://192.168.0.102:6000/auth";
  final Duration timeoutDuration = Duration(seconds: 10);

  @override
  Future<MyUser?> login(String email, String password) async {
    try {
      // Send a POST request with a timeout
      final response = await http.post(
        Uri.parse("$baseurl/login"),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      ).timeout(timeoutDuration); // Add timeout here

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final token = responseData['token'];
        final userData = responseData['user'] as Map<String, dynamic>;

        return MyUser(
          uid: userData['uid'],
          token: token,
          name: userData['username'],
          email: userData['email'],
        );

      } else if (response.statusCode == 400) {
        throw Exception("Invalid Credentials...");
      }
      else if(response.statusCode == 404){
        throw Exception("User not found...");
      }else{
        return null;
      }
    } on TimeoutException catch (e) {
      throw Exception('Request timed out. Please try again: ${e.message}' );
    } on SocketException catch (e) {
      throw Exception('Server is offline or unreachable: ${e.message}');
    } on http.ClientException catch (e) {
      throw Exception('Failed to connect to the server: ${e.message}');
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  @override
  Future<String?> register(String name, String email, String password) async {
    try {
      final response = await http.post(Uri.parse("$baseurl/register"),
          body: jsonEncode(
              {'username': name, 'email': email, 'password': password}),
          headers: {'Content-Type': 'application/json'}
      ) as Map<String, dynamic>;

      return "success";
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}