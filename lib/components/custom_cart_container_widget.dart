import 'package:flutter/material.dart';
import 'package:project6/components/custom_elevated_button_widget.dart';

class CustomCartContainerWidget extends StatelessWidget {
  const CustomCartContainerWidget(
      {super.key,
      this.onAddPressed,
      this.onRemovePressed,
      required this.amount, required this.image});
  final Function()? onAddPressed;
  final Function()? onRemovePressed;
  final int amount;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      width: 390,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 4),
                color: const Color(0xff000000).withOpacity(0.25))
          ],
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: const Color(0xffB98875))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(image),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Espresso",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "19 SAR",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              CustomElevatedButtonWidget(
                  icon: Icons.remove, onPressed: onRemovePressed),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 27,
                child: Center(
                  child: Text(
                    amount.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              CustomElevatedButtonWidget(
                icon: Icons.add,
                onPressed: onAddPressed,
              )
            ],
          ),
        ],
      ),
    );
  }
}
