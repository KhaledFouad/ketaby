import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/slider_model/slider_model.dart';
import 'package:ketaby/feature/home/data/repository/repository/home_repository.dart';
import 'package:meta/meta.dart';

part 'slider_cubit_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.homeRepository) : super(SliderInitial());
  final HomeRepository homeRepository;

  static SliderCubit get(context) => BlocProvider.of(context);

  SliderModel? sliderModel;

  Future<void> getSliderss() async {
    emit(SliderLoadingState());
    Either<Failure, SliderModel> result;
    result = await homeRepository.getSliders();
    result.fold((failure) {
      emit(SliderFailureState(failure.error));
    }, (sliderModel) {
      this.sliderModel = sliderModel;
      emit(SliderSuccessState(sliderModel));
    });
  }
}
