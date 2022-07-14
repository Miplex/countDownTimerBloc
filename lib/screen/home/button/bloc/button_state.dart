part of 'button_bloc.dart';

abstract class ButtonState extends Equatable {
  final double isOpaque;
  final bool isVisible;
  const ButtonState(this.isOpaque, this.isVisible);
  List<Object> get props => [];
}


class ButtonVisibleState extends ButtonState{
  final double isOpaque;
  final bool isVisible;
  const ButtonVisibleState({required this.isOpaque, required this.isVisible}) : super(isOpaque, isVisible);
  @override
  List<Object> get props => [isOpaque, isVisible];
}
