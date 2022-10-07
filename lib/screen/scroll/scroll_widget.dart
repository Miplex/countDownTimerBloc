import 'package:animated/animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/scrolling_bloc.dart';




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
                  child:  BlocBuilder<ScrollingBloc, ScrollingInitialState>(
                  builder: (context, state) {
                    return AnimatedOpacity(
                    opacity: state.downTimer.scrollOpacity,
                    duration: const Duration(milliseconds: 100),
                    child:  SizedBox(
                      height: 200,
                      child: PageView.builder(
                        physics: state.downTimer.isSwipeBlocked
                            ? NeverScrollableScrollPhysics()
                            : null,
                        itemCount: 13,
                        controller: _pageController,
                        onPageChanged: (int index) {
                          context.read<ScrollingBloc>().add(IndexScrollEvent(index));
                        },
                        itemBuilder: (context, i) {
                          return Opacity(
                            opacity: i ==  context.read<ScrollingBloc>().getIndex
                                ? 1
                                : 0.3,
                            child: Animated(
                              value: i ==  context.read<ScrollingBloc>().getIndex
                                  ? 2
                                  : 0.9,
                              duration: const Duration(milliseconds: 250),
                              builder: (context, child, animation) =>
                                  Transform.scale(
                                scale: animation.value,
                                child: Center(
                                  child: Text(
                                      '${state.downTimer.list[i]}',
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
);

  },
),
                ),
              ],
            ),
          ],
        ),
        BlocBuilder<ScrollingBloc, ScrollingInitialState>(
          builder: (context, state) {
        return AnimatedOpacity(
          opacity: state.downTimer.countDownOpacity,
          duration: const Duration(milliseconds: 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 65.0),
            child: Center(
              child: Transform.scale(
                scale: 2,
                child: Text( '${state.downTimer.timerSecond}',
                    style: TextStyle(
                        fontFamily: 'RobotoLight',
                        fontSize: 60,
                        color: Colors.white)),
              ),
            ),
          ),
        );
  },
),
      ],
    );
  }
}
