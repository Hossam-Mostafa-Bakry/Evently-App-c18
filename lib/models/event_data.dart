class EventData {
  static const String collectionPath = "events_collection";

  String? eventID;
  final String eventTitle;
  final String eventDescription;
  final DateTime eventDateTime;
  final String eventCategoryID;
  final bool isFavourite;
  final String eventCategoryImage;

  EventData({
    this.eventID,
    this.isFavourite = false,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDateTime,
    required this.eventCategoryID,
    required this.eventCategoryImage,
  });

  factory EventData.fromFirestore(Map<String, dynamic> json) {
    return EventData(
      eventID: json["event_id"],
      eventTitle: json["event_title"],
      eventDescription: json["event_description"],
      eventDateTime: DateTime.fromMillisecondsSinceEpoch(
        json["event_datetime"],
      ),
      eventCategoryID: json["event_category_id"],
      eventCategoryImage: json["event_category_image"],
      isFavourite: json["is_favourite"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "event_id": eventID,
      "event_title": eventTitle,
      "event_description": eventDescription,
      "event_datetime": eventDateTime.millisecondsSinceEpoch,
      "event_category_id": eventCategoryID,
      "is_favourite": isFavourite,
      "event_category_image": eventCategoryImage,
    };
  }
}
