part of 'scrolling_bloc.dart';

abstract class ScrollingState {
   ScrollingState();

}

class ScrollingInitialState extends ScrollingState {
 final DownTimer downTimer;
 ScrollingInitialState(this.downTimer);
 }

