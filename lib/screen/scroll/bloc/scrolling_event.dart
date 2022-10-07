part of 'scrolling_bloc.dart';

abstract class ScrollingEvent extends Equatable {
  const ScrollingEvent();
  List<Object?> get props => [];
}


class TimeScrollEvent extends ScrollingEvent{}
class IndexScrollEvent extends ScrollingEvent{
  final int index;

  IndexScrollEvent(this.index);
  List<Object?> get props => [index];
}

class VisibleButtonEvent extends ScrollingEvent{
 final int index;
  VisibleButtonEvent(this.index);
}

class ScrollSwipeBlocEvent extends ScrollingEvent{}

class TimeUpdateEvent extends ScrollingEvent{

}