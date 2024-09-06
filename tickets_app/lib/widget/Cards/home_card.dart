import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/get_size.dart';
import 'package:tickets_app/widget/rate_widget.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final double rate;
  final ImageProvider image;
  final Function()? onPressed;

  const HomeCard({
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
      color: C.Card,
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
            SizedBox(width: 8.0),
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
                  SizedBox(height: 8.0),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      title,
                      style: TextStyle(
                        color: C.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      subTitle,
                      style: TextStyle(
                          color: C.text3, fontWeight: FontWeight.w600),
                    ),
                    isThreeLine: true,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "From ",
                        style: TextStyle(
                            color: C.text3, fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: price,
                        style: TextStyle(
                          color: C.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )),
                    TextSpan(
                        text: " Night",
                        style: TextStyle(
                            color: C.text3, fontWeight: FontWeight.w600)),
                  ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
