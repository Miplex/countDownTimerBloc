import 'package:flutter/material.dart';
import '../../constants.dart';
import '../scroll/scroll_widget.dart';
import 'button/button_animated_visibility.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 800),
    vsync: this,
  );

@override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  height: _controller.value * _height,
                  width: _width,
                  color: kPrimaryColor,
                  child: child,
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScrollWidget(),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ],
      ),
       floatingActionButton: ButtonAnimatedVisibility(controller: _controller),
    floatingActionButtonLocation: FloatingActionButtonLocation
        .centerDocked,
    );
  }
}
