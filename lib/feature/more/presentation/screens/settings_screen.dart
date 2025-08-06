import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/controller/language_controller.dart';
import 'package:marvel_stream/core/controller/theme_controller.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/enums/app_languages.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final ThemeController themeController =
        AppInjector.getIt<ThemeController>();
    final LanguageController languageController =
        AppInjector.getIt<LanguageController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.locale.settingsTitle,
          style: AppTextStyles.movieDetailTitle.copyWith(
            fontSize: 24,
            color: context.appColors.white,
          ),
        ),
        backgroundColor: context.appColors.black,
      ),
      body: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeController,
        builder:
            (
              final BuildContext context,
              final ThemeMode themeMode,
              _,
            ) => ValueListenableBuilder<AppLanguage>(
              valueListenable: languageController,
              builder:
                  (
                    final BuildContext context,
                    final AppLanguage currentLanguage,
                    _,
                  ) => ListView(
                    padding: const EdgeInsets.all(12),
                    children: <Widget>[
                      // Theme Settings Section
                      Text(
                        context.locale.changeTheme,
                        style: AppTextStyles.sectionTitle,
                        textAlign: TextAlign.start,
                      ),
                      RadioListTile<ThemeMode>(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        title: Text(
                          context.locale.lightMode,
                          style: AppTextStyles.hintTxtStyle.copyWith(
                            color: context.appColors.white,
                          ),
                        ),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: ThemeMode.light,
                        groupValue: themeMode,
                        onChanged: (final ThemeMode? mode) async {
                          if (mode != null) {
                            await themeController.setTheme(mode);
                          }
                        },
                      ),
                      RadioListTile<ThemeMode>(
                        title: Text(
                          context.locale.darkMode,
                          style: AppTextStyles.hintTxtStyle.copyWith(
                            color: context.appColors.white,
                          ),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        value: ThemeMode.dark,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        groupValue: themeMode,
                        onChanged: (final ThemeMode? mode) async {
                          if (mode != null) {
                            await themeController.setTheme(mode);
                          }
                        },
                      ),
                      RadioListTile<ThemeMode>(
                        title: Text(
                          context.locale.useSystemTheme,
                          style: AppTextStyles.hintTxtStyle.copyWith(
                            color: context.appColors.white,
                          ),
                        ),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: ThemeMode.system,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        groupValue: themeMode,
                        onChanged: (final ThemeMode? mode) async {
                          if (mode != null) {
                            await themeController.setTheme(mode);
                          }
                        },
                      ),

                      // Language Settings Section
                      const SizedBox(height: 24),
                      Text(
                        context.locale.changeLanguage,
                        style: AppTextStyles.sectionTitle,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.appColors.white.withValues(
                              alpha: 0.3,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<AppLanguage>(
                          value: currentLanguage,
                          isExpanded: true,
                          underline: const SizedBox.shrink(),
                          dropdownColor: context.appColors.black,
                          style: AppTextStyles.hintTxtStyle.copyWith(
                            color: context.appColors.white,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: context.appColors.white,
                          ),
                          items:
                              AppLanguage.values
                                  .map<DropdownMenuItem<AppLanguage>>(
                                    (final AppLanguage language) =>
                                        DropdownMenuItem<AppLanguage>(
                                          value: language,
                                          child: Text(
                                            language.label,
                                            style: AppTextStyles.hintTxtStyle
                                                .copyWith(
                                                  color:
                                                      context.appColors.white,
                                                ),
                                          ),
                                        ),
                                  )
                                  .toList(),
                          onChanged: (final AppLanguage? language) async {
                            if (language != null &&
                                language != currentLanguage) {
                              await languageController.setLanguage(language);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
            ),
      ),
    );
  }
}
