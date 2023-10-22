import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/order/data/models/checkout_model/checkout_model.dart';
import 'package:ketaby/feature/order/data/repository/order_repository.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_state.dart';

class GetCheckoutDataCubit extends Cubit<GetCheckoutDataState>{
  GetCheckoutDataCubit(this.orderRepository):super(GetCheckoutDataInitialState());

 final OrderRepository orderRepository;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var formKey =GlobalKey<FormState>();

 static GetCheckoutDataCubit get(BuildContext context)=>BlocProvider.of(context);

 CheckoutModel? checkoutModel;

 Future<void> getCheckoutData()async{
   emit(GetCheckoutDataLoadingState());
   Either<Failure,CheckoutModel> result = await orderRepository.getCheckoutData();
   result.fold((failure) {
     emit(GetCheckoutDataFailureState(failure.error));
   }, (checkoutModel) {
     this.checkoutModel= checkoutModel;
     nameController.text=checkoutModel.data!.user!.userName!;
     emailController.text=checkoutModel.data!.user!.userEmail!;
     addressController.text=checkoutModel.data!.user!.address!;
     phoneController.text=checkoutModel.data!.user!.phone!;
     emit(GetCheckoutDataSuccessState(checkoutModel));
   });
 }


}