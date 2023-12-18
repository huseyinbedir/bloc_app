import 'package:bloc_app/core/extensions/size_extension.dart';
import 'package:bloc_app/core/helpers/view_helper.dart';
import 'package:bloc_app/core/navigations/router_const.dart';
import 'package:bloc_app/features/splash/bloc/splash_bloc.dart';
import 'package:bloc_app/features/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        color: Colors.blue.shade100,
        child: BlocProvider<SplashCubit>(
          create: (context) => SplashCubit(),
          child: Center(child: contentSplash(context)),
        ),
      ),
    );
  }

  contentSplash(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(builder: (context, state) {
      if (state is SplashLoading) {
        return loadingIndicator();
      } else if (state is SplashFailure) {
        return alertContainer(
            context, state.response.status!, state.response.description!);
      }
      return const SizedBox();
    }, listener: (context, state) {
      if (state is SplashLogin) {
        context.replace(RouterConst.home);
      }
    });
  }
}
