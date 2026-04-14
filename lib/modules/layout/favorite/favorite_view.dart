import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/core/widgets/custom_text_form_filed.dart';
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
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return EventCardItem();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16.0);
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
