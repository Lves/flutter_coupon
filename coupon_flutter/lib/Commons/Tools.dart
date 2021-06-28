
extension Url on String {
  String appendHttps() {
    if (this == null) {
      return null;
    }
    if (this.startsWith("http:")) {
      return this.replaceFirst("http", "https");
    } else if (this.startsWith("https:")) {
      return this;
    } else {
      return "https:${this}";
    }
  }
}