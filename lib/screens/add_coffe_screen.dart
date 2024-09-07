import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/components/buy_more.dart';
import 'package:project6/components/custom_button.dart';
import 'package:project6/components/shimmer_loading.dart';
import 'package:project6/components/text_custom.dart';
import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/data_layer/models/coffees_model.dart';
import 'package:project6/screens/bloc/coffee_bloc.dart';
import 'package:project6/screens/cart_page.dart';
import 'package:project6/screens/nav_bar.dart';
import 'package:project6/setup/init.dart';

class AddCoffeScreen extends StatelessWidget {
  AddCoffeScreen({
    super.key,
    required this.image,
    required this.price,
    required this.nameOfCoffee,
  });
  final String image;
  final double price;
  int amount = 1;
  final String nameOfCoffee;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<CoffeeBloc>();
        bloc.add(AddCoffeeLoadEvent());
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                SizedBox(
                  height: 370,
                  width: 370,
                  child: Image.asset(
                    "assets/images/Asset 3 1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(top: 145, left: 145, child: Image.asset(image)),
              ]),
              BlocBuilder<CoffeeBloc, CoffeeState>(
                builder: (context, state) {
                  if (state is AddCoffeeLoading) {
                    return const ShimmerLoading();
                  }
                  return Expanded(
                    child: Container(
                      color: const Color(0xfffaf4ee),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustom(
                                title: nameOfCoffee,
                                color: Colors.black,
                                weight: FontWeight.w500,
                                size: 22),
                            BlocBuilder<CoffeeBloc, CoffeeState>(
                              builder: (context, state) {
                                return BuyMore(
                                  price: (price * amount).toInt(),
                                  amount: amount,
                                  onTapDecrease: () {
                                    amount--;
                                    bloc.add(ChangeAmountEvent());
                                  },
                                  onTapIncrease: () {
                                    amount++;
                                    bloc.add(ChangeAmountEvent());
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextCustom(
                                title: "Size",
                                color: Colors.black,
                                weight: FontWeight.w400,
                                size: 22),
                            const SizedBox(
                              height: 6,
                            ),
                            BlocBuilder<CoffeeBloc, CoffeeState>(
                              builder: (context, state) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        bloc.add(
                                            ChooseCupSizeEvent(cupSize: 0));
                                      },
                                      child: SvgPicture.asset(
                                        "assets/svg/Vector.svg",
                                        colorFilter: ColorFilter.mode(
                                            Color(bloc.size == 0
                                                ? 0xff58352E
                                                : 0xffADA3A1),
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 26,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        bloc.add(
                                            ChooseCupSizeEvent(cupSize: 1));
                                      },
                                      child: SvgPicture.asset(
                                        "assets/svg/Vector.svg",
                                        colorFilter: ColorFilter.mode(
                                            Color(bloc.size == 1
                                                ? 0xff58352E
                                                : 0xffADA3A1),
                                            BlendMode.srcIn),
                                        width: 36,
                                        height: 36,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 26,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        bloc.add(
                                            ChooseCupSizeEvent(cupSize: 2));
                                      },
                                      child: SvgPicture.asset(
                                        "assets/svg/Vector.svg",
                                        colorFilter: ColorFilter.mode(
                                            Color(bloc.size == 2
                                                ? 0xff58352E
                                                : 0xffADA3A1),
                                            BlendMode.srcIn),
                                        width: 42,
                                        height: 42,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextCustom(
                                title: "Sugar cubes",
                                color: Colors.black,
                                weight: FontWeight.w500,
                                size: 22),
                            const SizedBox(
                              height: 6,
                            ),
                            BlocBuilder<CoffeeBloc, CoffeeState>(
                              builder: (context, state) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        bloc.add(ChooseCupEvent(sugarCubes: 0));
                                      },
                                      child: SvgPicture.asset(
                                        "assets/svg/iconoir_delete-circle.svg",
                                        color: Color(bloc.sugar == 0
                                            ? 0xff58352E
                                            : 0xffADA3A1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 26,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        bloc.add(ChooseCupEvent(sugarCubes: 1));
                                      },
                                      child: SvgPicture.asset(
                                        "assets/svg/arcticons_cube-escape.svg",
                                        color: Color(bloc.sugar == 1
                                            ? 0xff58352E
                                            : 0xffADA3A1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 21,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          bloc.add(
                                              ChooseCupEvent(sugarCubes: 2));
                                        },
                                        child: SvgPicture.asset(
                                          "assets/svg/Frame 7.svg",
                                          color: Color(bloc.sugar == 2
                                              ? 0xff58352E
                                              : 0xffADA3A1),
                                        )),
                                    const SizedBox(
                                      width: 21,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          bloc.add(
                                              ChooseCupEvent(sugarCubes: 3));
                                        },
                                        child: SvgPicture.asset(
                                          "assets/svg/Frame 8.svg",
                                          color: Color(bloc.sugar == 3
                                              ? 0xff58352E
                                              : 0xffADA3A1),
                                        ))
                                  ],
                                );
                              },
                            ),
                            const SizedBox(
                              height: 42,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Color(0xffB98875),
                                          content: Text(
                                              'Successfully added to cart!')));

                                  final sizeCup = switch (bloc.size) {
                                    0 => "small",
                                    1 => "medium",
                                    2 => "large",
                                    _ => "unknown"
                                  };
                                  getIt.get<CoffeeData>().addNewCoffee(
                                      coffee: CoffeeModel(
                                          coffeeImage: image,
                                          amount: amount,
                                          nameOfCoffee: image,
                                          price: price,
                                          size: sizeCup,
                                          sugar: bloc.sugar));
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavBar()));
                                },
                                child: Container(
                                  height: 46,
                                  width: 206,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffB98875),
                                      borderRadius: BorderRadius.circular(41),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 4),
                                            blurRadius: 1)
                                      ]),
                                  child: const Center(
                                    child: TextCustom(
                                        title: "Add to cart",
                                        color: Colors.white,
                                        weight: FontWeight.w500,
                                        size: 15),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
