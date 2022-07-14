part of 'scrolling_bloc.dart';

abstract class ScrollingState extends Equatable {
  const ScrollingState();
}

class ScrollingInitial extends ScrollingState {
  @override
  List<Object> get props => [];
}
