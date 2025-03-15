import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../entities/MyUser.dart';
import '../data/auth_repo_imp.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final authRepo = AuthRepoImplementation();
  MyUser? currentUser;

  Future<void> login(String email, String password) async {

    try{
      emit(AuthLoading());
      currentUser = await authRepo.login(email, password);
      if(currentUser!=null){
        emit(AuthSuccess());
      }else{
        emit(AuthError(message: "Something went wrong..."));
      }
    }catch(e){
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> register(String name ,String email, String password) async {
    emit(AuthLoading());
    try{
      final status = await authRepo.register(name, email, password);
      if(status == "success"){
        emit(AuthSuccess());
      }else{
        emit(AuthError(message: "Something went wrong..."));
      }
    }catch(e){
      emit(AuthError(message: e.toString()));
    }
  }
}
