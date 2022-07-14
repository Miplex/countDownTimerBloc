import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screen/home/button/bloc/button_bloc.dart';
import 'package:flutter_application_1/screen/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'model/down_timer.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => DownTimer()),
    ], child: MyApp()),
  );
}

//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   runApp(
//     MultiBlocProvider(
//         providers: [
//           BlocProvider<DownTimer>(
//               create:  (_) => DownTimer()
//           )
//     ], child: MyApp()),
//   );
// }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ButtonBloc>(
      create: (context) => ButtonBloc(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
