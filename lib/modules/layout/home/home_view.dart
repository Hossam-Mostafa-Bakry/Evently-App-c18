import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/utils/firebase_utils/firestore_utils.dart';
import 'package:evently_app/models/category_data.dart';
import 'package:evently_app/models/event_data.dart';
import 'package:evently_app/modules/layout/home/widgets/event_card_item.dart';
import 'package:evently_app/modules/layout/home/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final List<CategoryData> categoriesList = [
    CategoryData(
      id: "sport",
      name: "Sport",
      icon: Icons.directions_bike,
      image: Assets.images.sportImg.path,
    ),
    CategoryData(
      id: "book_club",
      name: "Book Club",
      icon: Icons.auto_stories,
      image: Assets.images.bookClubImg.path,
    ),
    CategoryData(
      id: "birthday",
      name: "Birthday",
      icon: Icons.cake_outlined,
      image: Assets.images.birthdayImg.path,
    ),
    CategoryData(
      id: "meeting",
      name: "Meeting",
      icon: Icons.meeting_room_outlined,
      image: Assets.images.meetingImg.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24),
        child: Column(
          spacing: 24,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back ✨", style: theme.textTheme.bodyMedium),
                    Text("Hossam Bakry", style: theme.textTheme.titleLarge),
                  ],
                ),
                Spacer(),
                Row(
                  spacing: 4,
                  children: [
                    Assets.icons.sun.svg(
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "EN",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            DefaultTabController(
              length: categoriesList.length,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.symmetric(horizontal: 8),
                indicator: BoxDecoration(),
                dividerColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                isScrollable: true,
                tabs: List.generate(categoriesList.length, (index) {
                  return TabItem(
                    data: categoriesList[index],
                    isSelected:
                        selectedIndex ==
                        categoriesList.indexOf(categoriesList[index]),
                    // selectedIndex
                  );
                }),
              ),
            ),
            StreamBuilder(
              stream: FirestoreUtils.getDateStream(categoriesList[selectedIndex].id),
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
            // FutureBuilder<List<EventData>>(
            //   future: FirestoreUtils.getDataOneTimeRead(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return CircularProgressIndicator();
            //     }
            //
            //     if (snapshot.hasError) {
            //       return Text("Something went wrong");
            //     }
            //
            //     List<EventData> dataList = snapshot.data ?? [];
            //     return dataList.isEmpty
            //         ? Text("No Data Found")
            //         : Expanded(
            //             child: ListView.separated(
            //               itemBuilder: (context, index) {
            //                 return EventCardItem(eventData: dataList[index]);
            //               },
            //               separatorBuilder: (context, index) {
            //                 return SizedBox(height: 10);
            //               },
            //               itemCount: dataList.length,
            //             ),
            //           );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
