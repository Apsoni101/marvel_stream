import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/core/controller/onboarding_page_controller.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/feature/on_boarding/presentation/widgets/background_image_foreground_text_widget.dart';
import 'package:marvel_stream/feature/on_boarding/presentation/widgets/onboarding_bottom_buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, this.onLoggedIn});

  final Future<void> Function({bool isFromSignup})? onLoggedIn;

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
          children: <Widget>[
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding1,
              text: context.locale.onboardingTxt1,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding2,
              text: context.locale.onboardingTxt2,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding3,
              text: context.locale.onboardingTxt3,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding4,
              text: context.locale.onboardingTxt4,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding5,
              text: context.locale.getStartedTxt,
            ),
            BackgroundImageForegroundTextWidget(
              image: AppAssets.onboarding6,
              text: context.locale.signupOrLogin,
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
                  effect: SlideEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: context.appColors.permanentWhite,
                    activeDotColor: context.appColors.red,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: OnboardingBottomButtons(
              onLoggedIn: widget.onLoggedIn,
              pageController: _onboardingPageController,
              onContinue: _goToNextPage,
            ),
          ),
        ],
      ),
    ],
  );
}
