import 'package:folkloria/common/style/typography/folkloria_text_styles.dart';
import 'package:folkloria/data/models/dark_mode.dart';
import 'package:folkloria/providers/setting/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/providers/setting/dark_mode_state_provider.dart';
import 'package:folkloria/common/utils/dark_mode_state.dart';
import 'package:folkloria/ui/widgets/title_form.dart';

class DarkModeField extends StatelessWidget {
  const DarkModeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const TitleForm('Dark Mode:'),
          const SizedBox.square(dimension: 4),
          Consumer<DarkModeStateProvider>(
            builder: (_, provider, __) {
              final isDarkModeEnabled =
                  provider.darkModeState == DarkModeState.enable;
              return SwitchListTile(
                title: Text(
                  'Mode Gelap',
                  style: FolkloriaTextStyles.bodyLargeBold.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: isDarkModeEnabled,
                onChanged: (value) {
                  provider.darkModeState = value
                      ? DarkModeState.enable
                      : DarkModeState.disable;
                  saveAction(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void saveAction(BuildContext context) async {
    // todo-03-action-01: get all data from controller
    final darkModeState = context.read<DarkModeStateProvider>().darkModeState;
    final isDarkModeEnable = darkModeState.isEnable;
    final DarkMode darkMode = DarkMode(darkModeEnable: isDarkModeEnable);

    // todo-03-action-02: save value to shared preferences
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    await sharedPreferencesProvider.saveDarkModeValue(darkMode);

    scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(sharedPreferencesProvider.message)),
    );
  }
}
