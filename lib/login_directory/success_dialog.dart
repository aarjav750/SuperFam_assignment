import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_fam/providers/login_page_providers.dart';
import 'package:super_fam/theme.dart';

void showSuccessDialog(BuildContext context, WidgetRef ref) {
  final phoneNumber = ref.read(phoneNumberProvider);
  final otp = ref.read(otpProvider);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Login Successful',
        style: darkBlueLightBlueAccentTheme.textTheme.bodyMedium,
      ),
      content: Text(
        'Phone Number: $phoneNumber\nOTP: $otp',
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            resetLoginProviders(ref);
          },
          child: const Text('Return'),
        ),
      ],
    ),
  );
}
