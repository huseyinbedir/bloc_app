import 'package:bloc_app/core/models/response_model.dart';
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoading extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashControl extends SplashState {
  final bool isPermission;
  SplashControl({
    required this.isPermission,
  });
  @override
  List<Object?> get props => [isPermission];
}

class SplashLogin extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashFailure extends SplashState {
  final ResponseModel response;

  SplashFailure({required this.response});
  @override
  List<Object?> get props => [response];
}
