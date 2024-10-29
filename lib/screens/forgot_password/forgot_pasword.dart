import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_blocs.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_events.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_states.dart';
import 'package:quizify/constants/padding/paddings.dart';
import 'package:quizify/constants/values/paths/auth_paths.dart';
import 'package:quizify/constants/values/strings/forgot_password_text.dart';
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
                child: CustomScrollView(
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
                            fieldType: 'email',
                            hintText: ForgotPasswordText.labelEmail,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
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
                                ForgotPasswordText.resetPasswordButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
