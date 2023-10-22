import 'package:ketaby/feature/home/data/models/categories_model/categories_model.dart';

abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final CategoriesModel categoriesModel;

  CategoriesSuccessState(this.categoriesModel);
}

class CategoriesFailureState extends CategoriesState {
  final String error;

  CategoriesFailureState(this.error);
}
