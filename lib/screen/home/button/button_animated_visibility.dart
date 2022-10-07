import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants.dart';
import '../../scroll/bloc/scrolling_bloc.dart';

class ButtonAnimatedVisibility extends StatelessWidget {
  const ButtonAnimatedVisibility({
    Key? key,
    required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollingBloc, ScrollingInitialState>(
      builder: (context, state) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: state.downTimer.buttonOpacity,
          child: IgnorePointer(
            ignoring: state.downTimer.isIgnoring,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 120.0),
              child: FloatingActionButton(
                onPressed: () {
                  int index = state.downTimer.index;
                  int second =  index == 0 ? 1 : index * 5;
                 // print(index);
                  print(second);
                  context.read<ScrollingBloc>().add(VisibleButtonEvent(index));
                  _controller.forward();
                  Future.delayed(const Duration(milliseconds: 800), () {
                    _controller.duration = Duration(seconds: second);
                    _controller.reverse();
                    _controller.duration = Duration(milliseconds: 800);
                  });
                },
                backgroundColor: kPrimaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
