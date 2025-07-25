import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/core/controller/onboarding_page_controller.dart';
import 'package:marvel_stream/feature/on_boarding/presentation/widgets/background_image_foreground_text_widget.dart';
import 'package:marvel_stream/feature/on_boarding/presentation/widgets/onboarding_bottom_buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  final OnboardingPageController _onboardingPageController =
      OnboardingPageController();


  Future<void> _goToNextPage() async {
    if (_onboardingPageController.value < 5) {
      _onboardingPageController.value++;
      await _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _onboardingPageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Stack(
    children: <Widget>[
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: const <Widget>[
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding1,
              text: AppStrings.onboardingTxt1,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding2,
              text: AppStrings.onboardingTxt2,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding3,
              text: AppStrings.onboardingTxt3,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding4,
              text: AppStrings.onboardingTxt4,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding5,
              text: AppStrings.getStartedTxt,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding6,
              text: AppStrings.signupOrLogin,
            ),
          ],
        ),
      ),
      Column(
        spacing: 82,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              spacing: 68,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 188 / 40,
                  child: SvgPicture.asset(AppAssets.appTextLogo),
                ),
                SmoothPageIndicator(
                  controller: _controller, // PageController
                  count: 6,
                  effect: const SlideEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: AppColors.white,
                    activeDotColor: AppColors.red,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: OnboardingBottomButtons(
              pageController: _onboardingPageController,
              onContinue: _goToNextPage,
            ),
          ),
        ],
      ),
    ],
  );
}
