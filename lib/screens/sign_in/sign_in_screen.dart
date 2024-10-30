import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_blocs.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_events.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_states.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/paths/auth_paths.dart';
import 'package:quizify/constants/values/strings/sign_in_text.dart';
import 'package:quizify/data/service/storage_constants.dart';
import 'package:quizify/global.dart';
import 'package:quizify/screens/home/home_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
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
                            fieldType: 'email',
                            hintText: SignInText.labelEmail,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),

                          //Password TextFormField
                          authScreenTextFormField(
                            fieldType: 'password',
                            hintText: SignInText.labelPassword,
                            obscureText: true,
                            onSaved: (value) {
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
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.

                                // this will trigger the onSaved method of the text form fields
                                _formKey.currentState!.save();

                                // we just hard code the user token for now
                                Global.storageService.setString(
                                    StorageConstants.userToken, 'userToken');

                                // for now we just navigate to the home screen
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                  (route) => false,
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
                                  builder: (context) => const SignUpScreen(),
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
