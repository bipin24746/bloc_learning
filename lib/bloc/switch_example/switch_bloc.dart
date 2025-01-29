import 'package:bloc_learning/bloc/switch_example/switch_event.dart';
import 'package:bloc_learning/bloc/switch_example/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableorDisableNotification>(_enableDisable);
    on<SliderEvent>(_updateSlider);
  }

  void _enableDisable(EnableorDisableNotification event, Emitter<SwitchStates> emit) {
    // Toggle the switch state
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _updateSlider(SliderEvent event, Emitter<SwitchStates> emit) {
    // Update the slider value
    emit(state.copyWith(slider: event.sliderValue));
  }
}
