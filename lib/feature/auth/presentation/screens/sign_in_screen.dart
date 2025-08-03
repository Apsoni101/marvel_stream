import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/feature/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:marvel_stream/feature/auth/presentation/widgets/auth_provider_button.dart';
import 'package:marvel_stream/feature/auth/presentation/widgets/custom_textfield.dart';
import 'package:marvel_stream/feature/auth/presentation/widgets/dont_have_an_account_button.dart';
import 'package:marvel_stream/feature/on_boarding/presentation/widgets/forgot_password_button.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/signup_login_button.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.onLoggedIn});

  final VoidCallback? onLoggedIn;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => BlocProvider<LoginBloc>(
    create: (final BuildContext context) => AppInjector.getIt<LoginBloc>(),
    child: Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (final BuildContext context, final LoginState state)  {
          if (state is LoginError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text(AppStrings.loginSuccess)));
            widget.onLoggedIn?.call();
          }
        },
        child: BlocSelector<
          LoginBloc,
          LoginState,
          ({
            bool isLoading,
            bool showEmailError,
            bool showPasswordError,
            String email,
            String password,
          })
        >(
          selector:
              (final LoginState state) => (
                isLoading: state is LoginLoading,
                showEmailError: state is LoginUser && !state.emailValid,
                showPasswordError: state is LoginUser && !state.passwordValid,
                email: state is LoginUser ? state.email : '',
                password: state is LoginUser ? state.password : '',
              ),
          builder: (
            final BuildContext context,
            final ({
              String email,
              bool isLoading,
              String password,
              bool showEmailError,
              bool showPasswordError,
            })
            data,
          ) {
            if (data.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 68, horizontal: 30),
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 188 / 50,
                  child: SvgPicture.asset(
                    AppAssets.appTextLogo,
                    placeholderBuilder:
                        (final BuildContext context) =>
                            const CircularProgressIndicator(),
                  ),
                ),
                const SizedBox(height: 48),
                CustomTextField(
                  labelText: AppStrings.enterEmail,
                  controller: emailController,
                  onChanged: (final String value) {
                    context.read<LoginBloc>().add(EmailChanged(email: value));
                  },
                  errorText:
                      data.showEmailError ? AppStrings.emailEmptyError : null,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  labelText: AppStrings.password,
                  controller: passwordController,
                  onChanged: (final String value) {
                    context.read<LoginBloc>().add(
                      PasswordChanged(password: value),
                    );
                  },
                  errorText:
                      data.showPasswordError ? AppStrings.passwordEmptyError : null,
                ),
                const SizedBox(height: 20),
                SignupLoginButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(ResetValidationErrors());
                    context.read<LoginBloc>().add(
                      ValidateAndLogin(
                        email: data.email,
                        password: data.password,
                      ),
                    );
                  },
                  text: AppStrings.login,
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(width: 4, color: AppColors.red),
                ),
                ForgotPassword(onPressed: () {}),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.or,
                  style: AppTextStyles.forgotPasswordTxt.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 18),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.continueWith,
                  style: AppTextStyles.forgotPasswordTxt.copyWith(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  spacing: 12,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AuthProviderButton(
                      onPressed: () {},
                      asset: AppAssets.facebook,
                      title: AppStrings.facebook,
                    ),
                    AuthProviderButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          const OnGoogleLoginEvent(),
                        );
                      },
                      asset: AppAssets.google,
                      title: AppStrings.google,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DontHaveAnAccountButton(
                  onPressed: () async {
                    await context.router.replace(SignUpRoute());
                  },
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
