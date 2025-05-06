class UrlUtils {
  static Uri getUri({required String url, Map<String, dynamic>? params}) {
    final temp = Uri.parse(url);
    if (url.contains("https://")) {
      final uri = Uri.https(
        temp.authority,
        temp.path,
        params?.map((key, value) => MapEntry(key, value.toString())),
      );
      return uri;
    } else {
      final uri = Uri.http(
        temp.authority,
        temp.path,
        params?.map((key, value) => MapEntry(key, value.toString())),
      );
      return uri;
    }
  }

  static String convertUrlToId(String url) {
    if (url.isEmpty) {
      return url;
    } else if (!url.contains("http") && (url.length == 11)) {
      return url;
    }
    url = url.trim();

    for (RegExp exp in [
      RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$",
      ),
      RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$",
      ),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$"),
    ]) {
      if (exp.hasMatch(url)) {
        return exp.firstMatch(url)!.group(1) ?? "";
      }
    }

    return "";
  }
}
