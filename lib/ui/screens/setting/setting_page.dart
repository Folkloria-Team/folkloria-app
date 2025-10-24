import 'package:flutter/material.dart';
import 'package:folkloria/common/style/typography/folkloria_text_styles.dart';
import 'package:folkloria/ui/widgets/dark_mode_field.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pengaturan",
          style: FolkloriaTextStyles.titleLarge.copyWith(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              DarkModeField(),
              Divider(indent: 16, endIndent: 16),
              // Tombol tentang aplikasi
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // TODO: Tambahkan aksi ketika tombol ditekan
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox.square(dimension: 4),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Tentang Aplikasi',
                            style: FolkloriaTextStyles.bodyLargeBold.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(indent: 16, endIndent: 16),
              // Tombol Keluar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // TODO: Tambahkan aksi ketika tombol ditekan
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox.square(dimension: 4),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Keluar',
                              style: FolkloriaTextStyles.bodyLargeBold.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
