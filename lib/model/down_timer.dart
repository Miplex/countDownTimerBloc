

class DownTimer {
  //принято переменные делать final потом использовать copyWith
 final int timerSecond;
 final int index;
 final double scrollOpacity;
 final double countDownOpacity;
 final double buttonOpacity;
 final bool isIgnoring;
 final bool isSwipeBlocked;
 final List list;


  DownTimer({
    required this.timerSecond,
    required this.index,
    required this.scrollOpacity,
    required this.countDownOpacity,
    required this.isIgnoring,
    required this.isSwipeBlocked,
    required this.buttonOpacity,
    required this.list
  });

 DownTimer copyWith({
   int? timerSecond,
   int? index,
   double? scrollOpacity,
   double? countDownOpacity,
   double? buttonOpacity,
   bool? isIgnoring,
   bool? isSwipeBlocked,
   List? list
 }) {
   return DownTimer(
       timerSecond: timerSecond ?? this.timerSecond,
       index: index ?? this.index,
       scrollOpacity: scrollOpacity ?? this.scrollOpacity,
       countDownOpacity: countDownOpacity ?? this.countDownOpacity,
       buttonOpacity: buttonOpacity ?? this.buttonOpacity,
       isIgnoring: isIgnoring ?? this.isIgnoring,
       isSwipeBlocked: isSwipeBlocked ?? this.isSwipeBlocked,
       list: list ?? this.list
   );
 }
// class DownTimer {
//  final int timerSecond;
//  final int index;
//  final double scrollOpacity;
//  final double countDownOpacity;
//  final bool visible;
//  final bool isSwipeBlocked;
//  final double buttonOpacity;
//
//  DownTimer({
//    required this.timerSecond,
//    required this.index,
//    required this.scrollOpacity,
//    required this.countDownOpacity,
//    required this.visible,
//    required this.isSwipeBlocked,
//    required this.buttonOpacity
// });
//
//  DownTimer copyWith({
//    int? timerSecond,
//    int? index,
//    double? scrollOpacity,
//    double? countDownOpacity,
//    double? buttonOpacity,
//    bool? visible,
//    bool? isSwipeBlocked,
// }){
//    return DownTimer(
//        timerSecond: timerSecond ?? this.timerSecond,
//        index: index ?? this.index,
//        scrollOpacity: scrollOpacity ?? this.scrollOpacity,
//        countDownOpacity: countDownOpacity ?? this.countDownOpacity,
//        buttonOpacity: buttonOpacity ?? this.buttonOpacity,
//        visible: visible ?? this.visible,
//        isSwipeBlocked: isSwipeBlocked ?? this.isSwipeBlocked,
//
//    );
//  }
//   double get getButtonOpacity => _buttonOpacity;
//   bool get getVisibleButton => _visible;
//   bool get getSwipeBlocked => _isSwipeBlocked;
//   double get getScrollOpacity => _scrollOpacity;
//
//   double get getCountDownOpacity => _countdownOpacity;
//
//   int get getIndex => _index;
//
//   int get getData => _timerSecond;

 // List _list = List.generate(13, (int index) => index == 0 ? 1 : index * 5);

//  List get getSecond => _list;

   /*void countDownTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerSecond == 0) {
        clickButton(false);
        swipeBlocked();
        timer.cancel();
       // notifyListeners();
      } else {
        clickButton(true);
        swipeBlocked();
        timerSecond--;
      //  notifyListeners();
      }
    });
  }

  addIndex(int index) {
    index = index;
    timerSecond = index == 0 ? 1 : index * 5;
  //  notifyListeners();
  }

  void playSound() {
    final player = AudioCache();
    player.play('audio/select.wav');
   // notifyListeners();
  }

  void swipeBlocked() {
    if (scrollOpacity == 1.0) {
      isSwipeBlocked = false;
    } else if (scrollOpacity == 0.0) {
      isSwipeBlocked = true;
    }
    //notifyListeners();
  }

  void visibleButton() {
    if (buttonOpacity == 1.0) {
      visible = true;
    } else if (buttonOpacity == 0.0) {
      visible = false;
    }

   // notifyListeners();
  }

  void clickButton(bool click) {
    if (click == false) {
      countDownOpacity = 0.0;
      scrollOpacity = 1.0;
      buttonOpacity = 1.0;
      visibleButton();
    } else if (click == true) {
      scrollOpacity = 0.0;
      countDownOpacity = 1.0;
      buttonOpacity = 0.0;
      visibleButton();
    }
    //notifyListeners();
  }
*/

}
