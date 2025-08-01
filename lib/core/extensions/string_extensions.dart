
extension EmailValidator on String {
  bool get isValidEmail {
    final RegExp emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool get isValidPassword {
    final RegExp passwordRegex = RegExp(r'^.{6,}$');
    return passwordRegex.hasMatch(this);
  }
}
extension BoxOfficeConversion on String? {
  String toInrBoxOffice({final double usdToInrRate = 83}) {
    if (this == null || this!.isEmpty) {
      return '-';
    }

    final String cleaned = this!.replaceAll(RegExp(r'[^\d.]'), '');
    final double? value = double.tryParse(cleaned);
    if (value == null) {
      return '-';
    }

    double usd = value;

    if (this!.contains('B')) {
      usd *= 1_000_000_000;
    } else if (this!.contains('M')) {
      usd *= 1_000_000;
    }

    final double inr = usd * usdToInrRate;
    final double inrCr = inr / 10_000_000;

    return '₹${inrCr.toStringAsFixed(1)} Cr';
  }
}
extension TrailerUrlExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  bool get isYouTubeUrl =>
      !isNullOrEmpty &&
          (this!.contains('youtube.com') || this!.contains('youtu.be'));

  bool get isBrightcoveUrl =>
      !isNullOrEmpty && this!.contains('brightcove.net');
}
