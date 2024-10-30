import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/sign_up_blocs/sign_up_blocs.dart';
import 'package:quizify/blocs/sign_up_blocs/sign_up_events.dart';
import 'package:quizify/blocs/sign_up_blocs/sign_up_states.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/paths/auth_paths.dart';
import 'package:quizify/constants/values/strings/sign_up_text.dart';
import 'package:quizify/widgets/app_widgets.dart';
import 'package:quizify/widgets/auth_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // the form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocs, SignUpStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
          ),
          body: Form(
            key: _formKey,
            child: SafeArea(
              child: CustomScrollView(
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
                          // Tile Text
                          authInScreenTitle(
                            context: context,
                            title: SignUpText.title,
                          ),

                          // Description Text
                          authScreenDescriptionText(
                            context: context,
                            text: SignUpText.description,
                          ),

                          // UserName TextFormField
                          authScreenTextFormField(
                            fieldType: 'username',
                            hintText: SignUpText.labelName,
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              context
                                  .read<SignUpBlocs>()
                                  .add(UserNameEvent(value));
                            },
                          ),

                          // Email TextFormField
                          authScreenTextFormField(
                            fieldType: 'email',
                            hintText: SignUpText.labelEmail,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              context
                                  .read<SignUpBlocs>()
                                  .add(EmailEvent(value));
                            },
                          ),

                          // Password TextFormField
                          authScreenTextFormField(
                            fieldType: 'password',
                            hintText: SignUpText.labelPassword,
                            obscureText: true,
                            onSaved: (value) {
                              context
                                  .read<SignUpBlocs>()
                                  .add(PasswordEvent(value));
                            },
                          ),

                          // Confirm Password TextFormField
                          authScreenTextFormField(
                            fieldType: 'password',
                            hintText: SignUpText.labelPasswordAgain,
                            obscureText: true,
                            onSaved: (value) {
                              context
                                  .read<SignUpBlocs>()
                                  .add(ConfirmPasswordEvent(value));
                            },
                          ),

                          // Sign Up Button
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: kInBetweenSpacing,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Processing Data'),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                SignUpText.signUpButton,
                              ),
                            ),
                          ),

                          // third party sign in
                          dividerTextDivider(
                            context: context,
                            text: SignUpText.signUpOr,
                          ),
                          // Google Sign In
                          googleSignInButton(
                            context: context,
                            iconPath: AuthPaths.googleIcon,
                            label: SignUpText.signUpWithGoogle,
                          ),

                          const Spacer(),

                          authPagesNavigationTextButton(
                            context: context,
                            text1: SignUpText.signUpAlreadyHaveAccount1,
                            text2: SignUpText.signUpAlreadyHaveAccount2,
                            onPressed: () {
                              // pop the current screen and navigate to the sign in screen
                              Navigator.pop(context);
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
