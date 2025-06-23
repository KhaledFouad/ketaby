import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/authentication/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: AnnotatedRegion(
        value: AppConstants.systemUiOverlayStyleDark,
        child: RegisterViewBody(),
      ),
    );
  }
}
