import 'package:flutter/material.dart';

class AppAlert extends StatelessWidget {
  const AppAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor:
                              const Color(0xff333333).withOpacity(0.95),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Are you sure?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                const Text(
                                  "  you can’t undo this action",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff6F43F5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                          child: Text(
                                            "Delete",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff8F8D9C),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                          child: Text(
                                            "Cancel",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Text("data"))
          ],
        ),
      ),
    );
  }
}
