import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/img_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';

class ReservationCard extends StatelessWidget {
  final String roomId;
  final String nights;
  final String date;
  final Function()? onPressed;
  final Function()? onDelete;

  const ReservationCard({
    super.key,
    required this.roomId,
    required this.nights,
    required this.date,
    required this.onPressed,
    required this.onDelete,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const SizedBox(
                  height: 120,
                  width: 120,
                  child: Image(
                    image: Img.lobby,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Room number: $roomId",
                      ).styled(weight: FontWeight.w800, size: 16),
                      subtitle: Text(
                        "Number of Nights: $nights\nDate: $date",
                      ).styled(
                          color: C.text3, weight: FontWeight.w600, size: 14),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: onPressed,
                          icon: const Icon(
                            Icons.edit,
                            color: C.accent,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: onDelete,
                          icon: const Icon(
                            Icons.delete,
                            color: C.red,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
