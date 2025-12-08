class CardDetailsEntity {
  final String fileName;
  final String remoteImageUrl;
  final CardDetails details;

  const CardDetailsEntity({
    required this.fileName,
    required this.remoteImageUrl,
    required this.details,
  });
}

class CardDetails {
  final String about;

  const CardDetails({required this.about});
}
