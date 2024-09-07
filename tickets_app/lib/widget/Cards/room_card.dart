import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/get_size.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/widget/rate_widget.dart';

class RoomCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final double rating;
  final Image image;
  final Function()? onPressed;

  const RoomCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.rating,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.3,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: C.card,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: image,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RateWidget(rating: rating),
                          IconButton(
                            onPressed: onPressed,
                            icon: Icon(
                              Icons.add_box_rounded,
                              color: C.accent,
                              size: context.getScreenSize(multiplyWidth: 0.08),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        title,
                      ).styled(weight: FontWeight.w800, size: 16),
                      Text(subTitle).styled(lineLimit: 2, size: 11),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: "From ",
                                style: TextStyle(
                                    color: C.text3,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12)),
                            TextSpan(
                                text: price,
                                style: const TextStyle(
                                  color: C.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                            const TextSpan(
                                text: " Night",
                                style: TextStyle(
                                    color: C.text3,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

