import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/controller/onboarding_page_controller.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/signup_login_button.dart';
import 'package:marvel_stream/feature/on_boarding/presentation/widgets/continue_button.dart';

class OnboardingBottomButtons extends StatelessWidget {
  const OnboardingBottomButtons({
    required this.pageController,
    required this.onContinue,
    super.key,
    this.onLoggedIn,
  });

  final VoidCallback? onLoggedIn;
  final OnboardingPageController pageController;
  final VoidCallback onContinue;

  @override
  Widget build(final BuildContext context) => ValueListenableBuilder<int>(
    valueListenable: pageController,
    builder:
        (final BuildContext context, final int pageIndex, _) => Column(
      spacing: 32,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (pageIndex != 5) ContinueButton(onPressed: onContinue),
        if (pageIndex == 5) ...<Widget>[
          SignupLoginButton(
            onPressed: () async {
              await context.router.replace(SignUpRoute(onLoggedIn: onLoggedIn));
            },
            text: AppStrings.signup,
          ),
          SignupLoginButton(
            onPressed: () async {
              await context.router.replace(SignInRoute(onLoggedIn: onLoggedIn));
            },
            text: AppStrings.login,
            backgroundColor: Colors.transparent,
            side: const BorderSide(width: 4, color: AppColors.red),
          ),
        ],
      ],
    ),
  );
}