
class Certificate {
  final String title;
  final String url;
  final String? assetImagePath;
  
  const Certificate({
    required this.title,
    required this.url,
    this.assetImagePath
  });

  factory Certificate.dicoding({
    required String title,
    required String url,
  }) {
    return Certificate(
      title: title, 
      url: url,
      assetImagePath: 'assets/images/dicoding_logo.jpg'
    );
  }

  Certificate copyWith({
    String? title,
    String? url,
    String? assetImagePath,
  }) {
    return Certificate(
      title: title ?? this.title,
      url: url ?? this.url,
      assetImagePath: assetImagePath ?? this.assetImagePath,
    );
  }

  @override
  String toString() => 'Certificate(title: $title, url: $url, assetImagePath: $assetImagePath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Certificate &&
      other.title == title &&
      other.url == url &&
      other.assetImagePath == assetImagePath;
  }

  @override
  int get hashCode => title.hashCode ^ url.hashCode ^ assetImagePath.hashCode;
}
