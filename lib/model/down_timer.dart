import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DownTimer with ChangeNotifier {
  int _timerSecond = 1;
  int _index = 0;
  double _scrollOpacity = 1.0;
  double _countdownOpacity = 0.0;
  bool _visible = true;
  bool _isSwipeBlocked = false;
  double _buttonOpacity = 1.0;

  double get getButtonOpacity => _buttonOpacity;
  bool get getVisibleButton => _visible;
  bool get getSwipeBlocked => _isSwipeBlocked;
  double get getScrollOpacity => _scrollOpacity;

  double get getCountDownOpacity => _countdownOpacity;

  int get getIndex => _index;

  int get getData => _timerSecond;

  List _list = List.generate(13, (int index) => index == 0 ? 1 : index * 5);

  List get getSecond => _list;

  void countDownTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerSecond == 0) {
        clickButton(false);
        swipeBlocked();
        timer.cancel();
        notifyListeners();
      } else {
        clickButton(true);
        swipeBlocked();
        _timerSecond--;
        notifyListeners();
      }
    });
  }

  addIndex(int index) {
    _index = index;
    _timerSecond = index == 0 ? 1 : index * 5;
    notifyListeners();
  }

  void playSound() {
    final player = AudioCache();
    player.play('audio/select.wav');
    notifyListeners();
  }

  void swipeBlocked() {
    if (_scrollOpacity == 1.0) {
      _isSwipeBlocked = false;
    } else if (_scrollOpacity == 0.0) {
      _isSwipeBlocked = true;
    }
    notifyListeners();
  }

  void visibleButton() {
    if (_buttonOpacity == 1.0) {
      _visible = true;
    } else if (_buttonOpacity == 0.0) {
      _visible = false;
    }

    notifyListeners();
  }

  void clickButton(bool click) {
    if (click == false) {
      _countdownOpacity = 0.0;
      _scrollOpacity = 1.0;
      _buttonOpacity = 1.0;
      visibleButton();
    } else if (click == true) {
      _scrollOpacity = 0.0;
      _countdownOpacity = 1.0;
      _buttonOpacity = 0.0;
      visibleButton();
    }
    notifyListeners();
  }
}
