import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talktive/features/auth/presentation/RegisterPage.dart';
import 'package:talktive/core/theme.dart';
import 'package:talktive/features/auth/presentation/login.dart';
import 'package:talktive/messages.dart';

import 'features/auth/cubit/auth_cubit.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Root of app
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthCubit>(create: (context) => AuthCubit())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: LoginPage(),
      ),
    );
  }
}
