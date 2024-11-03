import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_blocs.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_events.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_states.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/paths/auth_paths.dart';
import 'package:quizify/constants/values/strings/sign_in_text.dart';
import 'package:quizify/data/service/email_sign_in.dart';
import 'package:quizify/screens/loading/loading.dart';
import 'package:quizify/screens/sign_up/sign_up.dart';
import 'package:quizify/widgets/auth_widgets.dart';
import 'package:quizify/widgets/sign_in_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // the form key
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers for each text field
  // for saving the user input after showing loading screen
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: _formKey,
            child: SafeArea(
              child: state.isLoading
                  ? const LoadingScreen()
                  : CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: kHorizontalPadding,
                            ),
                            child: Column(
                              children: [
                                const Spacer(),
                                // Tile Image
                                authScreenTitleImage(
                                  imagePath: AuthPaths.signIn,
                                  height: kDefaultPadding * 4,
                                ),
                                // Title Text
                                authInScreenTitle(
                                  context: context,
                                  title: SignInText.title,
                                ),
                                //Email TextFormField
                                authScreenTextFormField(
                                  controller: _emailController,
                                  fieldType: 'email',
                                  hintText: SignInText.labelEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    context
                                        .read<SignInBloc>()
                                        .add(EmailEvent(value));
                                  },
                                ),

                                //Password TextFormField
                                authScreenTextFormField(
                                  controller: _passwordController,
                                  fieldType: 'password',
                                  hintText: SignInText.labelPassword,
                                  obscureText: true,
                                  onChanged: (value) {
                                    context
                                        .read<SignInBloc>()
                                        .add(PasswordEvent(value));
                                  },
                                ),

                                // forgot password text button
                                forgotPasswordTextButton(context),

                                // sign in password
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      emailSignIn(
                                        context: context,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    SignInText.signInButton,
                                  ),
                                ),

                                // third party sign in
                                dividerTextDivider(
                                  context: context,
                                  text: SignInText.signInOr,
                                ),
                                // Google Sign In
                                googleSignInButton(
                                  context: context,
                                  iconPath: AuthPaths.googleIcon,
                                  label: SignInText.signInWithGoogle,
                                ),

                                const Spacer(),

                                authPagesNavigationTextButton(
                                  context: context,
                                  text1: SignInText.signInDontHaveAccount1,
                                  text2: SignInText.signInDontHaveAccount2,
                                  onPressed: () {
                                    // push the sign up screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
