import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/get_size.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/widget/rate_widget.dart';

class RoomCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final double rate;
  final ImageProvider image;
  final Function()? onPressed;

  const RoomCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.rate,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: C.card,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: context.getScreenSize(multiplyWidth: 0.30),
              height: context.getScreenSize(multiplyWidth: 0.35),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RateWidget(rate: rate),
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
                  const SizedBox(height: 8.0),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      title,
                    ).styled(
                      color: C.black,
                      weight: FontWeight.w800,
                      size: 16,
                    ),
                    subtitle: Text(
                      subTitle,
                    ).styled(color: C.text3, weight: FontWeight.w600),
                    isThreeLine: true,
                  ),
                  Text("\$$price",
                      style: const TextStyle(
                        color: C.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
