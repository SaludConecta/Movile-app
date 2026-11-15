import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import '../../shell/presentation/main_shell.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = true;

  void _enter() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const MainShell()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: BrandMark()),
                  const SizedBox(height: 28),
                  Text(
                    'Bienvenido(a)',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Ingrese sus credenciales para acceder a su historia clínica unificada.',
                  ),
                  const SizedBox(height: 24),
                  const LabeledField(
                    label: 'Correo electrónico',
                    hint: 'ejemplo@correo.pe',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Use su correo institucional o personal registrado en RENIEC',
                    style: TextStyle(fontSize: 10, color: AppPalette.muted),
                  ),
                  const SizedBox(height: 18),
                  LabeledField(
                    label: 'Contraseña',
                    hint: '••••••••',
                    obscureText: _hidePassword,
                    suffixIcon: IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: Icon(
                        _hidePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 19,
                      ),
                      onPressed: () =>
                          setState(() => _hidePassword = !_hidePassword),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => showMockMessage(
                        context,
                        'Recuperación de contraseña de demostración.',
                      ),
                      child: const Text(
                        '¿Olvidó su contraseña?',
                        style: TextStyle(
                          color: AppPalette.ink,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(label: 'Ingresar', onPressed: _enter),
                  const SizedBox(height: 18),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('o'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text('¿No tiene cuenta? '),
                        TextButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const SignupScreen(),
                            ),
                          ),
                          child: const Text(
                            'Crear cuenta',
                            style: TextStyle(
                              color: AppPalette.ink,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.lock_outline,
                        size: 17,
                        color: AppPalette.muted,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Su información está protegida y cada acceso queda registrado bajo normativa de confidencialidad médica MINSA.',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppPalette.muted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
