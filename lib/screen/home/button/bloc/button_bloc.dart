import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {

  ButtonBloc() : super(ButtonVisibleState(isOpaque: 1.0, isVisible: true)) {
    on<ButtonAddOpacityEvent>((event, emit) => emit(ButtonVisibleState(isOpaque: 1.0, isVisible: true)));
    // print(ButtonVisibleEvent());

    on<ButtonRemoveOpacityEvent>((event, emit) => emit(ButtonVisibleState(isOpaque: 0.0, isVisible: false)));

    // on<ButtonVisibleEvent>((event, emit) => emit(ButtonVisibleState(isOpaque: 1.0, isVisible: true)));
    //
    // on<ButtonUnVisibleEvent>((event, emit) => emit(ButtonVisibleState(isOpaque: 0.0, isVisible: false)));
    // print(ButtonUnVisibleEvent());
  }

// void _visibled(ButtonVisibleEvent event, Emitter<ButtonState> emit){
//   emit(ButtonVisible(false));
//   emit(ButtonVisible(true));
//   print(event);
// }
}
