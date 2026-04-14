class EventData {
  final String? eventID;
  final String eventTitle;
  final String eventDescription;
  final DateTime eventDateTime;
  final String eventCategory;
  final bool isFavourite;

  EventData({
    /// cloud database create id
    this.eventID,
    this.isFavourite = false,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDateTime,
    required this.eventCategory,
  });
}
