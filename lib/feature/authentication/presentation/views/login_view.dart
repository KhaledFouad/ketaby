import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/authentication/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion(
        value: AppConstants.systemUiOverlayStyleDark,
        child: LoginViewBody(),
      ),
    );
  }
}
