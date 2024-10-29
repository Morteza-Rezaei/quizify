class ForgotPasswordStates {
  final String email;

  const ForgotPasswordStates({
    this.email = '',
  });

  ForgotPasswordStates copyWith({
    String? email,
  }) {
    return ForgotPasswordStates(
      email: email ?? this.email,
    );
  }
}
