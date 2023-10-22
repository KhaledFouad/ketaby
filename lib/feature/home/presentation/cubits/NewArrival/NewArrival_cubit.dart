import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/new_arrival_model/new_arrival_model.dart';
import 'package:ketaby/feature/home/data/repository/repository/home_repository.dart';
import 'package:ketaby/feature/home/presentation/cubits/NewArrival/NewArrival_state.dart';

class NewArrivalCubit extends Cubit<NewArrivalState> {
  NewArrivalCubit(this.homeRepository) : super(NewArrivalInitial());

  final HomeRepository homeRepository;

  static NewArrivalCubit get(context) => BlocProvider.of(context);

  NewArrivalModel? newArrivalModel;

  Future<void> getNewArrivl() async {
    emit(NewArrivalLoadingState());
    Either<Failure, NewArrivalModel> result;
    result = await homeRepository.getNewArrival();
    result.fold((failure) {
      emit(NewArrivalFailureState(failure.error));
    }, (newArrivalModel) {
      this.newArrivalModel = newArrivalModel;
      emit(NewArrivalSuccessState(newArrivalModel));
    });
  }
}
