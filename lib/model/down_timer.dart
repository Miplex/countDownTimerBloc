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
}
