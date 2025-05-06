import 'package:bloc/bloc.dart';
// import 'package:collector_app/common/bloc/data_state.dart';
// import 'package:collector_app/common/http/response.dart';
// import 'package:collector_app/common/models/users.dart';
// import 'package:collector_app/feature/auth/resources/user_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finacct/common/bloc/data_state.dart';
import 'package:finacct/common/http/response.dart';
import 'package:finacct/common/models/users.dart';
import 'package:finacct/feature/auth/resources/user_repository.dart';

class LoginCubit extends Cubit<CommonState> {
  LoginCubit({required this.userRepository}) : super(CommonInitial());

  UserRepository userRepository;

  Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  loginUser({
    required String username,
    required String password,
    required String clientAlias,
    required String actualBaseUrl,
  }) async {
    bool isConnected = await hasInternetConnection();
    emit(CommonLoading());
    final res = await userRepository.loginUser(
      username: username,
      password: password,
      clientAlias: clientAlias,
      actualBaseUrl: actualBaseUrl,
    );
    if (res.status == Status.Success && res.data != null) {
      emit(CommonStateSuccess<User>(data: res.data!));
    } else if (!isConnected) {
      emit(const CommonNoData());
    } else {
      emit(
        CommonError(
          message: res.toString() ?? "Error logging in.",
          statusCode: res.statusCode,
        ),
      );
    }
  }
}
