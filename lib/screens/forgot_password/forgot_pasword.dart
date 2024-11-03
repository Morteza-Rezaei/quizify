import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_blocs.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_events.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_states.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/paths/auth_paths.dart';
import 'package:quizify/constants/values/strings/forgot_password_text.dart';
import 'package:quizify/data/service/email_reset_password.dart';
import 'package:quizify/screens/loading/loading.dart';
import 'package:quizify/widgets/app_widgets.dart';
import 'package:quizify/widgets/auth_widgets.dart';

class ForgotPaswordScreen extends StatefulWidget {
  const ForgotPaswordScreen({super.key});

  @override
  State<ForgotPaswordScreen> createState() => _ForgotPaswordScreenState();
}

class _ForgotPaswordScreenState extends State<ForgotPaswordScreen> {
  // the form key
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers for each text field
  // for saving the user input after showing loading screen
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBlocs, ForgotPasswordStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: state.isLoading
                  ? const LoadingScreen()
                  : CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Title Image
                              authScreenTitleImage(
                                imagePath: AuthPaths.forgotPassword,
                                height: kDefaultPadding * 12,
                              ),

                              // Title Text
                              authInScreenTitle(
                                context: context,
                                title: ForgotPasswordText.title,
                              ),

                              // Description Text
                              authScreenDescriptionText(
                                context: context,
                                text: ForgotPasswordText.description,
                              ),

                              //Email TextFormField
                              authScreenTextFormField(
                                controller: _emailController,
                                fieldType: 'email',
                                hintText: ForgotPasswordText.labelEmail,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  context
                                      .read<ForgotPasswordBlocs>()
                                      .add(EmailEvent(value));
                                },
                              ),

                              // Reset Password Button
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: kInBetweenSpacing,
                                  bottom: kInBetweenSpacing * 3,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      emailResetPassword(context: context);
                                    }
                                  },
                                  child: const Text(
                                    ForgotPasswordText.resetPasswordButton,
                                  ),
                                ),
                              ),
                            ],
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
