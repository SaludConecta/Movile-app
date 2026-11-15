import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import '../../shell/presentation/main_shell.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  static const slides = [
    (
      Icons.health_and_safety_outlined,
      'Usted decide quién ve su información',
      'Cuando un profesional solicite ver su historia clínica, le avisaremos para que autorice o deniegue el acceso.',
    ),
    (
      Icons.folder_shared_outlined,
      'Su historia clínica en un solo lugar',
      'Consulte sus atenciones médicas, resultados y referencias sincronizados.',
    ),
    (
      Icons.verified_user_outlined,
      'Mantenga el control',
      'Revise o revoque los permisos de acceso cuando lo necesite.',
    ),
  ];

  void _finish() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShell()),
      (_) => false,
    );
  }

  void _next() {
    if (_page == slides.length - 1) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _finish,
                  child: const Text(
                    'Omitir',
                    style: TextStyle(
                      color: AppPalette.muted,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: slides.length,
                  onPageChanged: (page) => setState(() => _page = page),
                  itemBuilder: (context, index) {
                    final slide = slides[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 190,
                          height: 155,
                          decoration: BoxDecoration(
                            color: AppPalette.softBlue,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            slide.$1,
                            size: 68,
                            color: AppPalette.ink,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          slide.$2,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          slide.$3,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < slides.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: _Dot(active: _page == i),
                    ),
                ],
              ),
              const SizedBox(height: 22),
              PrimaryButton(
                label: _page == slides.length - 1 ? 'Comenzar' : 'Siguiente',
                onPressed: _next,
              ),
              TextButton(
                onPressed: _finish,
                child: const Text(
                  'Omitir',
                  style: TextStyle(
                    color: AppPalette.muted,
                    decoration: TextDecoration.underline,
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

class _Dot extends StatelessWidget {
  const _Dot({this.active = false});
  final bool active;

  @override
  Widget build(BuildContext context) => Container(
    width: active ? 18 : 7,
    height: 7,
    decoration: BoxDecoration(
      color: active ? AppPalette.ink : const Color(0xFFC8CEDA),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
