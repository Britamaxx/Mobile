import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';

void main() => runApp(const MateriApp());

class MateriApp extends StatefulWidget {
  const MateriApp({super.key});

  @override
  State<MateriApp> createState() => _MateriAppState();
}

class _MateriAppState extends State<MateriApp> {
  // false = dark mode, true = light mode
  bool isLight = false;

  void _ubahTema(bool value) {
    setState(() => isLight = value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
      home: KartuProfil(isLight: isLight, onThemeChanged: _ubahTema),
    );
  }
}

class KartuProfil extends StatelessWidget {
  final bool isLight;
  final ValueChanged<bool> onThemeChanged;

  const KartuProfil({
    super.key,
    required this.isLight,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: LightDarkThemeToggle(
              value: isLight,
              onChanged: onThemeChanged,
              size: 28,
              themeIconType: ThemeIconType.expand,
              tooltip: 'Ganti tema',
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage(
                  "assets/images/pasfoto_almet.jpeg",
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Muhammad Britama',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Text('Orang gabut', textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Email'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('GitHub'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}