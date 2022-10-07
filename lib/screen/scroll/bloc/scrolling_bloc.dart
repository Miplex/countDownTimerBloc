import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scrolling_event.dart';
part 'scrolling_state.dart';

class ScrollingBloc extends Bloc<ScrollingEvent, ScrollingState> {
  ScrollingBloc() : super(ScrollingInitial()) {
    on<ScrollingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
