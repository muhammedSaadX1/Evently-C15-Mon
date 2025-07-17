import 'package:evently_c15_mon/features/authentication/login/login_screen.dart';
import 'package:evently_c15_mon/features/authentication/register/register_screen.dart';
import 'package:evently_c15_mon/features/create_event/create_event.dart';
import 'package:evently_c15_mon/features/main_layout/layout.dart';
import 'package:flutter/cupertino.dart';

class RoutesManger{
  static const String login = "/login";
  static const String register = "/register";
  static const String mainLayout = "/mainLayout";
  static const String createEvent = "/createEvent";

  static Route? getRoute(RouteSettings settings){
    switch(settings.name){
      case login:{
        return CupertinoPageRoute(builder: (context) => LoginScreen(),);
      }
      case register:{
        return CupertinoPageRoute(builder: (context) => RegisterScreen(),);

      }
      case mainLayout:{
        return CupertinoPageRoute(builder: (context) => LayoutScreen(),);

      }
      case createEvent:{
        return CupertinoPageRoute(builder: (context) => CreateEvent(),);

      }

    }
  }
}