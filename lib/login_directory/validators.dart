String? validatePhoneField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter phone number';
  } else if (value.length != 10) {
    return 'Please enter a valid 10 digit phone number';
  }
  return null;
}

String? validateOTPField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter OTP';
  } else if (value.length != 6) {
    return 'Please enter 6 digit OTP ';
  }
  return null;
}
