import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/down_timer.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../scroll/scroll_widget.dart';


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
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (context).watch<DownTimer>().getButtonOpacity,
        child: Visibility(
          visible: (context).watch<DownTimer>().getVisibleButton,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 120.0),
            child: FloatingActionButton(
              onPressed: () {
                int index = (context).read<DownTimer>().getIndex;

                (context).read<DownTimer>().addIndex(index);
                (context).read<DownTimer>().clickButton(true);
                _controller.forward();

                Future.delayed(const Duration(milliseconds: 800), () {
                  _controller.duration =
                      Duration(seconds: (context).read<DownTimer>().getData);
                  _controller.reverse();
                  _controller.duration = Duration(milliseconds: 800);
                });
                if (_controller.isAnimating) {
                  (context).read<DownTimer>().countDownTime();
                }

                //print((context).read<DownTimer>().getClick);
              },
              backgroundColor: kPrimaryColor,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
