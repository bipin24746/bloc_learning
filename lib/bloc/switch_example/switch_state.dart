import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable{
  bool isSwitch;
  double slider;
  SwitchStates({
    this.slider = 1.0,
    this.isSwitch = false});

  SwitchStates copyWith({bool? isSwitch,double? slider}){
    return SwitchStates(
      isSwitch: isSwitch ?? this.isSwitch,
      slider : slider ?? this.slider,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch,slider];


}