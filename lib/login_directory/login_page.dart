import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_fam/login_directory/success_dialog.dart';
import 'package:super_fam/login_directory/validators.dart';
import 'package:super_fam/providers/login_page_providers.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneKey = GlobalKey<FormFieldState>();
    final otpKey = GlobalKey<FormFieldState>();

    String phone = '';
    String otpValue = '';

    final phoneNumber = ref.watch(phoneNumberProvider);
    final otp = ref.watch(otpProvider);
    final otpSent = ref.watch(otpSentProvider);

    final Widget sendOTPwidget = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          key: phoneKey,
          validator: (value) => validatePhoneField(value),
          readOnly: otpSent,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            phone = value;
          },
          maxLength: 10,
          decoration: InputDecoration(
            hintText: "Enter phone number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide:
                  const BorderSide(color: Colors.pinkAccent, width: 2.0),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            if (phoneKey.currentState!.validate()) {
              ref.read(otpSentProvider.notifier).state = true;
              ref.read(phoneNumberProvider.notifier).state = phone;
            }
          },
          child: const Text('Send OTP'),
        ),
      ],
    );

    final Widget loginWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: Text('OTP is sent to: $phoneNumber')),
        const SizedBox(height: 10.0),
        TextFormField(
          key: otpKey,
          validator: (value) => validateOTPField(value),
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 6,
          decoration: InputDecoration(
            hintText: "Enter OTP",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide:
                  const BorderSide(color: Colors.pinkAccent, width: 2.0),
            ),
          ),
          onChanged: (value) {
            otpValue = value;
          },
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            if (otpKey.currentState!.validate()) {
              ref.read(otpProvider.notifier).state = otpValue;
              showSuccessDialog(context, ref);
            }
          },
          child: const Text('Login'),
        ),
      ],
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "myAssets/logo.png",
                scale: 1.35,
              ),
              const SizedBox(height: 20.0),
              if (otpSent) loginWidget,
              if (!otpSent) sendOTPwidget
            ],
          ),
        ),
      ),
    );
  }
}
