import 'package:animated/animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/down_timer.dart';
import 'package:provider/provider.dart';

class ScrollWidget extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 0.4);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AnimatedOpacity(
                    opacity: (context).watch<DownTimer>().getScrollOpacity,
                    duration: const Duration(milliseconds: 100),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                        physics: (context).watch<DownTimer>().getSwipeBlocked
                            ? NeverScrollableScrollPhysics()
                            : null,
                        itemCount: 13,
                        controller: _pageController,
                        onPageChanged: (int index) {
                          (context).read<DownTimer>().addIndex(index);
                          (context).read<DownTimer>().playSound();
                        },
                        itemBuilder: (context, i) {
                          return Opacity(
                            opacity: i == (context).read<DownTimer>().getIndex
                                ? 1
                                : 0.3,
                            child: Animated(
                              value: i == (context).read<DownTimer>().getIndex
                                  ? 2
                                  : 0.9,
                              duration: const Duration(milliseconds: 250),
                              builder: (context, child, animation) =>
                                  Transform.scale(
                                scale: animation.value,
                                child: Center(
                                  child: Text(
                                    '${context.watch<DownTimer>().getSecond[i]}',
                                    style: TextStyle(
                                        fontFamily: 'RobotoLight',
                                        fontSize: 60,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        AnimatedOpacity(
          opacity: (context).watch<DownTimer>().getCountDownOpacity,
          duration: const Duration(milliseconds: 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 65.0),
            child: Center(
              child: Transform.scale(
                scale: 2,
                child: Text('${context.watch<DownTimer>().getData}',
                    style: TextStyle(
                        fontFamily: 'RobotoLight',
                        fontSize: 60,
                        color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
