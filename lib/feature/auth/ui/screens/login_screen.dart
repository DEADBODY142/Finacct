// import 'package:collector_app/common/shared_pref.dart';
// import 'package:collector_app/feature/auth/cubit/login_cubit.dart';
// import 'package:collector_app/feature/auth/resources/user_repository.dart';
// import 'package:collector_app/feature/auth/ui/widgets/login_widget.dart';
// import 'package:collector_app/views/dashboard.dart';
import 'package:finacct/common/shared_pref.dart';
import 'package:finacct/feature/auth/cubit/login_cubit.dart';
import 'package:finacct/feature/auth/resources/user_repository.dart';
import 'package:finacct/feature/auth/ui/widgets/login_widget.dart';
import 'package:finacct/pages/login.dart';
import 'package:finacct/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginCubit(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
      child: FutureBuilder<bool>(
        future: SharedPref.getRememberMe(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Error loading state');
          } else {
            return snapshot.data == true ? Menu() : const LoginWidget();
          }
        }),
      ),
    );
  }
}
