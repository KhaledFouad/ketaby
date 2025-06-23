import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/widgets/custom_dropdown.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_governorates_cubit/get_governorates_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_governorates_cubit/get_governorates_state.dart';

class GovernoratesDropdown extends StatelessWidget {
  const GovernoratesDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGovernoratesCubit, GetGovernoratesState>(
      builder: (context, state) {
        if (state is GetGovernoratesSuccessState) {
          return CustomDropdown(
            title: 'City',
            hintText: 'Enter your city',
            messageForValidate: 'Please enter your city',
            items: state.governoratesModel.data!
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.governorateNameEn!),
                  ),
                )
                .toList(),
            onChange: (value) {
              GetGovernoratesCubit.get(context).dropdownValue =
                  value.id.toString();
            },
          );
        } else if (state is GetGovernoratesFailureState) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is GetGovernoratesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
