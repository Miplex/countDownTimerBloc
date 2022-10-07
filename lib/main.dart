import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screen/home/home_screen.dart';
import 'package:flutter_application_1/screen/scroll/bloc/scrolling_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/down_timer.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScrollingBloc>(
          create: (context) => ScrollingBloc(DownTimer(
            timerSecond: 1,
            index: 0,
            scrollOpacity: 1.0,
            countDownOpacity: 0.0,
            buttonOpacity: 1.0,
            isIgnoring: false,
            isSwipeBlocked: false,
            list: List.generate(13, (int index) => index == 0 ? 1 : index * 5),

          )),


      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
