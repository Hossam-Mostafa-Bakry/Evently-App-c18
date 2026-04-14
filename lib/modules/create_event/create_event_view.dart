import 'dart:developer';

import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/services/snackbar_service.dart';
import 'package:evently_app/core/widgets/custom_app_bar.dart';
import 'package:evently_app/core/widgets/custom_button_widget.dart';
import 'package:evently_app/core/widgets/custom_text_form_filed.dart';
import 'package:evently_app/models/category_data.dart';
import 'package:evently_app/models/event_data.dart';
import 'package:evently_app/modules/create_event/widgets/tab_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key});

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  int selectedIndex = 0;
  DateTime? selectedDate;

  final formKey = GlobalKey<FormState>();
  final TextEditingController eventTitleController = TextEditingController();
  final TextEditingController eventDescriptionController =
      TextEditingController();

  final List<CategoryData> categoriesList = [
    CategoryData(
      id: "sport",
      name: "Sport",
      icon: Icons.directions_bike,
      image: Assets.images.sportImg.image(),
    ),
    CategoryData(
      id: "book_club",
      name: "Book Club",
      icon: Icons.auto_stories,
      image: Assets.images.bookClubImg.image(),
    ),
    CategoryData(
      id: "birthday",
      name: "Birthday",
      icon: Icons.cake_outlined,
      image: Assets.images.birthdayImg.image(),
    ),
    CategoryData(
      id: "meeting",
      name: "Meeting",
      icon: Icons.meeting_room_outlined,
      image: Assets.images.meetingImg.image(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(leading: CustomLeadingBar(), title: Text("Add event")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: categoriesList[selectedIndex].image,
                    ),
                    SizedBox(height: 16),
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
                          return TabItemWidget(
                            data: categoriesList[index],
                            isSelected:
                                selectedIndex ==
                                categoriesList.indexOf(categoriesList[index]),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Title",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.mainText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextFormFiled(
                      controller: eventTitleController,
                      hintText: "Event Title",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Event Title is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Description",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.mainText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextFormFiled(
                      controller: eventDescriptionController,
                      hintText: "Event Description",
                      maxLines: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Event Description is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    Row(
                      spacing: 8,
                      children: [
                        Assets.icons.calendarIcn.svg(),
                        Text(
                          "Event Date",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: AppColors.mainText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            _chooseDate();
                          },
                          child: Text(
                            selectedDate != null
                                ? DateFormat(
                                    "dd MMM yyyy",
                                  ).format(selectedDate!)
                                : "Choose date",
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 90),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButtonWidget(
                    buttonTitle: "Add Event",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (selectedDate == null) {
                          SnackBarService.showErrorMessage(
                            "You Must Select Event Date",
                          );
                          return;
                        }
                        final data = EventData(
                          eventTitle: eventTitleController.text,
                          eventDescription: eventDescriptionController.text,
                          eventCategory: categoriesList[selectedIndex].id,
                          eventDateTime: selectedDate!,
                        );

                        /// TODO: save event data on CloudStore then navigate to home screen
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _chooseDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    setState(() {
      selectedDate = chosenDate;
    });
    log(chosenDate.toString());
  }
}
