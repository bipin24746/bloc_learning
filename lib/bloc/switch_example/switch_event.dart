import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable{
  SwitchEvents();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class EnableorDisableNotification extends SwitchEvents{}

class SliderEvent extends SwitchEvents{
  final double sliderValue;
  SliderEvent(this.sliderValue);
}
