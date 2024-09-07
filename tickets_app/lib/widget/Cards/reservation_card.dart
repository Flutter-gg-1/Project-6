import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';

class ReservationCard extends StatelessWidget {
  final int roomId;
  final String nights;
  final String date;
  final Image img;
  final Function()? onPressed;
  final Function()? onDelete;

  const ReservationCard({
    super.key,
    required this.roomId,
    required this.nights,
    required this.date,
    required this.img,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image(
                      image: img.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Room number: ${100 + roomId}",
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
