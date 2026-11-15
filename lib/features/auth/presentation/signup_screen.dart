import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/widgets/app_ui.dart';
import 'onboarding_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool accepted = false;
  bool hidePassword = true;

  void _createAccount() {
    if (!accepted) {
      showMockMessage(context, 'Acepte los términos para continuar.');
      return;
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear cuenta',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.account_circle, size: 20),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(18, 8, 18, 22),
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Paso 1 de 2: Datos de identificación',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Text(
                    '50% completado',
                    style: TextStyle(fontSize: 10, color: AppPalette.muted),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const LinearProgressIndicator(
                  value: .5,
                  minHeight: 5,
                  color: AppPalette.ink,
                  backgroundColor: AppPalette.line,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ingrese sus datos personales conforme figuran en su documento oficial.',
                style: TextStyle(fontSize: 11),
              ),
              const SizedBox(height: 14),
              const _SelectField(
                label: 'Tipo de documento *',
                value: 'DNI · Documento Nacional de Identidad',
              ),
              const SizedBox(height: 11),
              const LabeledField(
                label: 'Número de documento *',
                hint: '45120988',
                keyboardType: TextInputType.number,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'ⓘ  Ingrese los 8 dígitos de su DNI.',
                  style: TextStyle(fontSize: 10, color: AppPalette.muted),
                ),
              ),
              const SizedBox(height: 11),
              const LabeledField(label: 'Nombres *', hint: 'Ej. Rosa'),
              const SizedBox(height: 11),
              const LabeledField(
                label: 'Apellidos *',
                hint: 'Ej. Huamán Quispe',
              ),
              const SizedBox(height: 11),
              const LabeledField(
                label: 'Correo electrónico *',
                hint: 'ejemplo@correo.pe',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 11),
              const LabeledField(
                label: 'Celular (opcional)',
                hint: '999 000 000',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 11),
              LabeledField(
                label: 'Contraseña *',
                hint: 'Mínimo 8 caracteres',
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () => setState(() => hidePassword = !hidePassword),
                  icon: const Icon(Icons.visibility_outlined, size: 18),
                ),
              ),
              const SizedBox(height: 11),
              const LabeledField(
                label: 'Confirmar contraseña *',
                hint: '••••••••',
                obscureText: true,
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: Checkbox(
                      value: accepted,
                      onChanged: (value) =>
                          setState(() => accepted = value ?? false),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        'Acepto los términos y la política de privacidad',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Crear cuenta',
                icon: Icons.arrow_forward,
                onPressed: _createAccount,
              ),
              const SizedBox(height: 7),
              Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      '¿Ya tiene una cuenta? ',
                      style: TextStyle(fontSize: 10),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Inicie sesión aquí',
                        style: TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectField extends StatelessWidget {
  const _SelectField({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppPalette.line),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
