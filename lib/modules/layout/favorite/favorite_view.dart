import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/utils/firebase_utils/firestore_utils.dart';
import 'package:evently_app/core/widgets/custom_text_form_filed.dart';
import 'package:evently_app/models/event_data.dart';
import 'package:evently_app/modules/layout/home/widgets/event_card_item.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 16,
          children: [
            CustomTextFormFiled(
              suffixIcon: Assets.icons.searchIcn.svg(),
              hintText: "Search For Events",
            ),
            StreamBuilder(
              stream: FirestoreUtils.getFavoriteDateStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                List<EventData> dataList = [];

                for (var element in snapshot.data!.docs) {
                  dataList.add(element.data());
                }

                return dataList.isEmpty
                    ? Text("No Data Found")
                    : Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return EventCardItem(eventData: dataList[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10);
                          },
                          itemCount: dataList.length,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
