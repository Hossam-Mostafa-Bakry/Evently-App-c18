import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/utils/firebase_utils/firestore_utils.dart';
import 'package:evently_app/models/event_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCardItem extends StatefulWidget {
  final EventData eventData;

  const EventCardItem({super.key, required this.eventData});

  @override
  State<EventCardItem> createState() => _EventCardItemState();
}

class _EventCardItemState extends State<EventCardItem> {
  late bool _isFavourite;

  @override
  void initState() {
    super.initState();
    _isFavourite = widget.eventData.isFavourite;
  }

  Future<void> _toggleFavorite() async {
    setState(() {
      _isFavourite = !_isFavourite;
    });

    final updatedEvent = EventData(
      eventID: widget.eventData.eventID,
      eventTitle: widget.eventData.eventTitle,
      eventDescription: widget.eventData.eventDescription,
      eventDateTime: widget.eventData.eventDateTime,
      eventCategoryID: widget.eventData.eventCategoryID,
      eventCategoryImage: widget.eventData.eventCategoryImage,
      isFavourite: _isFavourite,
    );

    try {
      await FirestoreUtils.updateData(updatedEvent);
    } catch (e) {
      setState(() {
        _isFavourite = !_isFavourite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 190,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.strokeBorder),
        image: DecorationImage(
          image: AssetImage(widget.eventData.eventCategoryImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF4F7FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              DateFormat("dd MMM").format(widget.eventData.eventDateTime),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF4F7FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  widget.eventData.eventTitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.mainText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: _toggleFavorite,
                  child: _isFavourite
                      ? Assets.icons.heartActiveIcn.svg()
                      : Assets.icons.heartIcn.svg(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
