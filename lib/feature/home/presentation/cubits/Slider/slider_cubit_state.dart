part of 'slider_cubit_cubit.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}

class SliderLoadingState extends SliderState {}

class SliderSuccessState extends SliderState {
  final SliderModel sliderModel;

  SliderSuccessState(this.sliderModel);
}

class SliderFailureState extends SliderState {
  final String error;

  SliderFailureState(this.error);
}
