import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_blocs.dart';
import 'package:quizify/blocs/landing_blocs/landing_blocs.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        /// Returns a list of all BlocProviders used throughout the app.
        ///
        /// `lazy: true` (default) means the Bloc will only be created when first accessed.
        /// If `lazy` is set to `false`, the Bloc is instantiated immediately when the Widget is built.
        BlocProvider(
          // Instantiates LandingBloc immediately upon widget build
          lazy: false,
          create: (context) => LandingBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordBlocs(),
        ),
      ];
}
