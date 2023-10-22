import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Text("user name"),
        ),
        ListTile(
          leading: const Icon(
            Icons.history_edu_rounded,
            color: Colors.orange,
          ),
          title: const Text('Order history'),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const CreateUser()),
            // );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.edit,
            color: Colors.green,
          ),
          title: const Text('Edit Profile'),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const CreateDepartmentScreen()),
            // );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.published_with_changes_rounded,
            color: Colors.purple,
          ),
          title: const Text('Change password'),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const CreateTaskScreen()),
            // );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.red,
          ),
          title: const Text('logout'),
          onTap: () {
            // CacheHelper.clearData(
            //   key: 'token',
            // ).then((value) {
            //   Const.userType = "";
            //   Navigator.pushReplacement<void, void>(
            //     context,
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) => const LoginScreen(),
            //     ),
            //   );
            // });
          },
        )
      ],
    );
  }
}
