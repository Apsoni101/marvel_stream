import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/feature/more/presentation/bloc/more_bloc.dart';
import 'package:marvel_stream/feature/more/presentation/widgets/profile_header.dart';
import 'package:marvel_stream/feature/more/presentation/widgets/settings_tile.dart';
import 'package:marvel_stream/feature/more/presentation/widgets/sign_out_button.dart';

@RoutePage()
class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(final BuildContext context) => BlocProvider<MoreBloc>(
    create: (final BuildContext context) => AppInjector.getIt<MoreBloc>(),
    child: Scaffold(
      body: BlocListener<MoreBloc, MoreState>(
        listener: (final BuildContext context, final MoreState state) async {
          if (state is SignOutSuccess) {
            await context.router.replaceAll(<PageRouteInfo<Object?>>[
              const SplashRoute(),
            ]);
          } else if (state is SignOutFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.failure.message)));
          }
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 56),
          children: <Widget>[
            const ProfileHeader(),
            const SizedBox(height: 20),
            SettingsTile(title: context.locale.account, onTap: () {}),
            SettingsTile(
              title: context.locale.settings,
              onTap: () {
                context.router.push(const SettingsRoute());
              },
            ),
            SettingsTile(title: context.locale.legal, onTap: () {}),
            SettingsTile(title: context.locale.support, onTap: () {}),
            SettingsTile(title: context.locale.privacySettings, onTap: () {}),
            SettingsTile(title: context.locale.parentalControl, onTap: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Divider(height: 2, color: context.appColors.white50),
            ),
            BlocSelector<MoreBloc, MoreState, bool>(
              selector: (final MoreState state) => state is SignOutInProgress,
              builder:
                  (final BuildContext context, final bool isLoading) =>
                      SignOutButton(
                        onPressed:
                            isLoading
                                ? null
                                : () => context.read<MoreBloc>().add(
                                  const SignOutRequested(),
                                ),
                        isLoading: isLoading,
                      ),
            ),
          ],
        ),
      ),
    ),
  );
}
