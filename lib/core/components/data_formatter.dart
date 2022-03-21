class DataFormatter {
  static String formatImageUrl(String url) {
    return url.replaceAll('k__image__', '');
  }
}
