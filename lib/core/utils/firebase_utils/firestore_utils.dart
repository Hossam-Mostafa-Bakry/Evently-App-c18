import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_data.dart';

/// A utility class for Firestore operations related to events.
abstract class FirestoreUtils {
  /// Returns a [CollectionReference] for the events collection.
  static CollectionReference<EventData> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(EventData.collectionPath)
        .withConverter<EventData>(
          fromFirestore: (snapshot, _) =>
              EventData.fromFirestore(snapshot.data()!),
          toFirestore: (value, _) => value.toFirestore(),
        );
  }

  /// Adds an event to the Firestore database.
  ///
  /// The [eventData] parameter represents the event to be added.
  static Future<void> addEvent(EventData eventData) async {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();

    eventData.eventID = docRef.id;

    return await docRef.set(eventData);
  }

  /// Retrieves all events from the Firestore database in a one-time read.
  ///
  /// Returns a list of [EventData] objects representing the retrieved events.
  static Future<List<EventData>> getDataOneTimeRead() async {
    List<EventData> dataList = [];

    var collectionRef = getCollectionRef();
    var data = await collectionRef.get();
    for (var element in data.docs) {
      dataList.add(element.data());
    }

    return dataList;
  }

  /// Retrieves events filtered by event category ID in a real-time stream.
  ///
  /// The [eventCategoryID] parameter specifies the event category ID to filter by.
  /// Returns a [Stream] of [QuerySnapshot] objects representing the retrieved events.
  static Stream<QuerySnapshot<EventData>> getDateStream(
    String eventCategoryID,
  ) {
    var collectionRef = getCollectionRef().where(
      "event_category_id",
      isEqualTo: eventCategoryID,
    );
    return collectionRef.snapshots();
  }

  /// Retrieves favorite events in a real-time stream.
  ///
  /// Returns a [Stream] of [QuerySnapshot] objects representing the retrieved favorite events.
  static Stream<QuerySnapshot<EventData>> getFavoriteDateStream() {
    var collectionRef = getCollectionRef().where(
      "is_favourite",
      isEqualTo: true,
    );
    return collectionRef.snapshots();
  }

  /// Updates an event in the Firestore database.
  ///
  /// The [data] parameter represents the event to be updated.
  static Future<void> updateData(EventData data) async {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(data.eventID);

    return await docRef.update(data.toFirestore());
  }

  /// Deletes an event from the Firestore database.
  ///
  /// The [data] parameter represents the event to be deleted.
  static Future<void> deleteData(EventData data) async {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(data.eventID);

    return await docRef.delete();
  }
}