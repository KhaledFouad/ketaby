import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/best_seller_model/best_seller_model.dart';
import 'package:ketaby/feature/home/data/repository/repository/home_repository.dart';
import 'package:ketaby/feature/home/presentation/cubits/BestSeller/best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepository) : super(BestSellerInitial());

  final HomeRepository homeRepository;

  static BestSellerCubit get(context) => BlocProvider.of(context);

  BestSellerModel? bestSellerModel;

  Future<void> getBestSeller() async {
    emit(BestSellerLoadingState());
    Either<Failure, BestSellerModel> result;
    result = await homeRepository.getBestSeller();
    result.fold((failure) {
      emit(BestSellerFailureState(failure.error));
    }, (bestsellerModel) {
      bestSellerModel = bestsellerModel;
      emit(BestSellerSuccessState(bestsellerModel));
    });
  }
}
