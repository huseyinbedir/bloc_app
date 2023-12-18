import 'package:bloc_app/features/splash/bloc/splash_state.dart';
import 'package:bloc_app/features/splash/model/token_model.dart';
import 'package:bloc_app/features/splash/service/splash_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    permissionCheck();
  }

  SplashService service = SplashService();
  Future<void> permissionCheck() async {
    emit(SplashLoading());
    final response = await service.controlUser();
    if (response is TokenModel) return emit(SplashLogin());
    return emit(SplashFailure(response: response));
  }
}
