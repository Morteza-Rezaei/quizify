import 'package:quizify/constants/values/paths/home_paths.dart';

class SignUpStates {
  final String userAvatar;
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  final bool isLoading;

  const SignUpStates({
    this.userAvatar = HomePaths.avatar,
    this.userName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isLoading = false,
  });

  SignUpStates copyWith({
    String? userAvatar,
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isLoading,
  }) {
    return SignUpStates(
      userAvatar: userAvatar ?? this.userAvatar,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
