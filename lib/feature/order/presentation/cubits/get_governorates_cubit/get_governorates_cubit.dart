import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/order/data/models/governorates_model/governorates_model.dart';
import 'package:ketaby/feature/order/data/repository/order_repository.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_governorates_cubit/get_governorates_state.dart';

class GetGovernoratesCubit extends Cubit<GetGovernoratesState> {
  GetGovernoratesCubit(this.orderRepository)
      : super(GetGovernoratesInitialState());
  final OrderRepository orderRepository;

  static GetGovernoratesCubit get(context) => BlocProvider.of(context);

  GovernoratesModel? governoratesModel;

  Future<void> getGovernorates() async {
    emit(GetGovernoratesLoadingState());
    Either<Failure, GovernoratesModel> result;
    result = await orderRepository.getGovernorates();
    result.fold((failure) {
      emit(GetGovernoratesFailureState(failure.error));
    }, (governoratesModel) {
      this.governoratesModel = governoratesModel;
      emit(GetGovernoratesSuccessState(governoratesModel));
    });
  }

  String? dropdownValue;
}
