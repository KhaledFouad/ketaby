import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/home/data/models/categories_model/categories_model.dart';
import 'package:ketaby/feature/home/data/repository/repository/home_repository.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepository) : super(CategoriesInitial());
  final HomeRepository homeRepository;

  static CategoriesCubit get(context) => BlocProvider.of(context);

  CategoriesModel? categoriesModel;

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    Either<Failure, CategoriesModel> result;
    result = await homeRepository.getCategories();
    result.fold((failure) {
      emit(CategoriesFailureState(failure.error));
    }, (categoriesModel) {
      this.categoriesModel = categoriesModel;
      emit(CategoriesSuccessState(categoriesModel));
    });
  }
}
