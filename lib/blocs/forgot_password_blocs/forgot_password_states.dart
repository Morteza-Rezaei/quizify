class ForgotPasswordStates {
  final String email;

  final bool isLoading;

  const ForgotPasswordStates({
    this.email = '',
    this.isLoading = false,
  });

  ForgotPasswordStates copyWith({
    String? email,
    bool? isLoading,
  }) {
    return ForgotPasswordStates(
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
