import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/down_timer.dart';

part 'scrolling_event.dart';
part 'scrolling_state.dart';

class ScrollingBloc extends Bloc<ScrollingEvent, ScrollingInitialState> {
late DownTimer _downTimer;

  ScrollingBloc(DownTimer downTimer) :  super(ScrollingInitialState(downTimer)) {
    _downTimer = downTimer;

    on<IndexScrollEvent>((event, emit) {
      addIndex(event.index);
      emit(ScrollingInitialState(_downTimer));
      playSound();
    });

    on<VisibleButtonEvent>((event, emit){
      addIndex(event.index);
      clickButton(true);
      countDownTime();
      emit(ScrollingInitialState(_downTimer));
    });
    on<TimeUpdateEvent>((event, emit){
      emit(ScrollingInitialState(_downTimer));
    });

  }


  int _index = 0;
  int get getIndex => _index;


  void countDownTime() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_downTimer.timerSecond == 0) {
        clickButton(false);
        swipeBlocked(false);
        timer.cancel();
        add(TimeUpdateEvent());
      } else {
        clickButton(true);
        swipeBlocked(true);
       _downTimer = _downTimer.copyWith(timerSecond: _downTimer.timerSecond - 1);
        add(TimeUpdateEvent());
      }
    });
  }


  addIndex(int index)  {
    _index = index;
    _downTimer = _downTimer.copyWith(index: index, timerSecond: index = index == 0 ? 1 : index * 5);
  }

  void playSound() {
    final player = AudioCache();
    player.play('audio/select.wav');
  }

  void clickButton(bool click) {
    if (click == false) {
      _downTimer = _downTimer.copyWith(countDownOpacity: 0.0, scrollOpacity: 1.0, buttonOpacity: 1.0);
      visibleButton();
    } else if (click == true) {
      _downTimer = _downTimer.copyWith(countDownOpacity: 1.0, scrollOpacity: 0.0, buttonOpacity: 0.0);
      visibleButton();
    }
  }

  void visibleButton() {
    if (_downTimer.buttonOpacity == 1.0) {
      _downTimer = _downTimer.copyWith(isIgnoring: false);
    } else if (_downTimer.buttonOpacity == 0.0) {
      _downTimer = _downTimer.copyWith(isIgnoring: true);
    }
  }

  void swipeBlocked(bool click) {
    if (click == false) {
     _downTimer = _downTimer.copyWith(isSwipeBlocked: false);
    } else if (click == true) {
     _downTimer = _downTimer.copyWith(isSwipeBlocked: true);
    }
  }


}
