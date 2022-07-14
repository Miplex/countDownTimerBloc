part of 'button_bloc.dart';

// abstract class ButtonState extends Equatable {
//   // final bool isVisible;
//   const ButtonState();
//   List<Object> get props => [];
// }


class ButtonVisibleState extends Equatable{
  final double isOpaque;
  final bool isVisible;
  const ButtonVisibleState({required this.isOpaque, required this.isVisible}) : super();
  @override
  List<Object> get props => [isOpaque, isVisible];
}

