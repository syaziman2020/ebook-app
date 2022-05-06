import 'package:ebook_app/cubit/auth_cubit.dart';
import 'package:ebook_app/cubit/current_page_cubit.dart';
import 'package:ebook_app/ui/pages/detail_page.dart';
import 'package:ebook_app/ui/pages/login_page.dart';
import 'package:ebook_app/ui/pages/main_page.dart';
import 'package:ebook_app/ui/pages/register_page.dart';
import 'package:ebook_app/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentPageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/register': (context) => RegisterPage(),
          '/login': (context) => LoginPage(),
          '/main': (context) => const MainPage(),
          '/detail': (context) => const DetailPage(),
        },
      ),
    );
  }
}
