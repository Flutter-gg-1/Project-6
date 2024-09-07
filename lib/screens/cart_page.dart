import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/components/custom_alert_dialog_widget.dart';
import 'package:project6/components/custom_app_bar_widget.dart';
import 'package:project6/components/custom_cart_container_widget.dart';
import 'package:project6/components/custom_rich_text_widget.dart';
import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/screens/bloc/coffee_bloc.dart';
import 'package:project6/setup/init.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeBloc(),
      child: Builder(builder: (context) {
        context.read<CoffeeBloc>().add(LoadDataEvent());
        return Scaffold(
          backgroundColor: const Color(0xffFAF4EE),
          appBar: const CustomAppBarWidget(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: CustomRichTextWidget()),
                  const SizedBox(
                    height: 70,
                  ),
                  Expanded(
                    child: BlocBuilder<CoffeeBloc, CoffeeState>(
                      builder: (context, state) {
                        if (state is LoadedDataState) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 345,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: getIt
                                        .get<CoffeeData>()
                                        .dataLayer
                                        .map(
                                          (e) => BlocBuilder<CoffeeBloc,
                                              CoffeeState>(
                                            builder: (context, state) {
                                              if (state is LoadedDataState) {
                                                return CustomCartContainerWidget(
                                                  image: e.nameOfCoffee ??
                                                      "assets/images/Latte.png",
                                                  amount: e.amount!,
                                                  onAddPressed: () {
                                                    e.amount = e.amount! + 1;
                                                    context
                                                        .read<CoffeeBloc>()
                                                        .add(
                                                            ChangeAmountEvent());
                                                  },
                                                  onRemovePressed: () {
                                                    context
                                                        .read<CoffeeBloc>()
                                                        .add(
                                                            ChangeAmountEvent());

                                                    if (e.amount! <= 1) {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return CustomAlertDialogWidget(
                                                                onPressedYes:
                                                                    () {
                                                              getIt
                                                                  .get<
                                                                      CoffeeData>()
                                                                  .removeCoffee(
                                                                      e.nameOfCoffee!);
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          });
                                                    } else {
                                                      e.amount = e.amount! - 1;
                                                    }
                                                  },
                                                );
                                              }
                                              return const Text("It's empty!");
                                            },
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Total:",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      BlocBuilder<CoffeeBloc, CoffeeState>(
                                        builder: (context, state) {
                                          return Text(
                                            "${getIt.get<CoffeeData>().getTotalPrice()} SAR",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          );
                        }
                        return const Text("No data yet.");
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}