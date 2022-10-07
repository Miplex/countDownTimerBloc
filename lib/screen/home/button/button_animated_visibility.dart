import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/down_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants.dart';
import 'bloc/button_bloc.dart';

class ButtonAnimatedVisibility extends StatelessWidget {
  const ButtonAnimatedVisibility({
    Key? key,
    required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: state.isOpaque,
          child: Visibility(
            visible: state.isVisible,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 120.0),
              child: FloatingActionButton(
                onPressed: () {
                  int index = (context)
                      .read<DownTimer>()
                      .getIndex;
                  (context).read<DownTimer>().addIndex(index);
                  (context).read<DownTimer>().clickButton(true);
                  context.read<ButtonBloc>().add(ButtonRemoveOpacityEvent());
                  // _homeBloc.add(ButtonUnVisibleEvent());
                  _controller.forward();
                  //  print(state.isVisible);

                  Future.delayed(const Duration(milliseconds: 800), () {
                    _controller.duration =
                        Duration(seconds: (context)
                            .read<DownTimer>()
                            .getData);
                    //_controller.reverse();
                    _controller.reverse().whenComplete(() =>
                        context.read<ButtonBloc>().add(
                            ButtonAddOpacityEvent()));
                    _controller.duration = Duration(milliseconds: 800);
                  });
                  if (_controller.isAnimating) {
                    (context).read<DownTimer>().countDownTime();
                  }
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
