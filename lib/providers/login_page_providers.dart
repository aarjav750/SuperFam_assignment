import 'package:flutter_riverpod/flutter_riverpod.dart';

final phoneNumberProvider = StateProvider((ref) => '');
final otpProvider = StateProvider((ref) => '');
final isLoadingProvider = StateProvider((ref) => false);
final otpSentProvider = StateProvider((ref) => false);

void resetLoginProviders(WidgetRef ref) {
  ref.read(phoneNumberProvider.notifier).state = '';
  ref.read(otpSentProvider.notifier).state = false;
  ref.read(otpProvider.notifier).state = '';
  ref.read(isLoadingProvider.notifier).state = false;
}
