part of 'button_bloc.dart';

abstract class ButtonEvent extends Equatable {
  const ButtonEvent();
  @override
  List<Object?> get props => [];
}

class ButtonAddOpacityEvent extends ButtonEvent{}

class ButtonRemoveOpacityEvent extends ButtonEvent{}

class ButtonClickEvent extends ButtonEvent{}
// class ButtonVisibleEvent extends ButtonEvent{}
//
// class ButtonUnVisibleEvent extends ButtonEvent{}

