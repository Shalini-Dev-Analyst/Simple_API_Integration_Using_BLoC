class LoginState {
  final String email;
  final String password;
  final bool isloading;
  final bool issuccess;
  final String? errorMessage;

  LoginState({
    this.email = "",
    this.password = "",
    this.isloading = false,
    this.issuccess = false,
    this.errorMessage
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isloading,
    bool? issuccess,
    String? errorMessage
}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        isloading: isloading ?? this.isloading,
        issuccess: issuccess ?? this.issuccess,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }
}