import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/extensions/screen_size.dart';
import 'package:project6/models/movie.dart';
import 'package:project6/widgets/button_widget.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function()? onEdit;
  final Function()? onDelete;
  const MovieCard({super.key, required this.movie, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: movie.posterImg.contains('assets')
            ? Image.asset(movie.posterImg,width: 173, height: 224, fit: BoxFit.cover)
            : Image.file(File(movie.posterImg),width: 173, height: 224, fit: BoxFit.cover)
          ),
          const SizedBox(height: 16),
          Text(
            movie.name,
            style: const TextStyle(
              color: Color(0xff6F43F5),
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis
            ),
          ),
          Row(
            children: [
              const Icon(Icons.videocam_outlined,size: 16, color: Color(0xffF2F2F2)),
              Text(
                movie.category,
                style: const TextStyle(color: Color(0xffDEDEDE), fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_month,size: 16, color: Color(0xffF2F2F2)),
                  Text(movie.year,style: const TextStyle(color: Color(0xffDEDEDE), fontSize: 12)),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined,size: 20, color: Color(0xffF8F8F8))
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor:const Color(0xff333333).withOpacity(0.95),
                            content: SizedBox(
                              height: context.getHeight(divideBy: 5),
                              width: context.getWidth(),
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Are you sure ?",
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),
                                  const Text(
                                    "you can't undo this action",
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ButtonWidget(title: 'Delete', width: 110, height: 30, onPressed: onDelete, fontSize: 14),
                                      ButtonWidget(title: 'Cancel', width: 110, height: 30, onPressed: ()=>context.pop(), fontSize: 14, color: const Color(0xff8F8D9C),),
                                      // GestureDetector(
                                      //   onTap: onDelete,
                                      //   child: Container(
                                      //     height: 30,
                                      //     width: 110,
                                      //     decoration: BoxDecoration(
                                      //       color:const Color(0xff6F43F5),
                                      //       borderRadius:BorderRadius.circular(10)
                                      //     ),
                                      //     child: const Center(
                                      //       child: Text("Delete",style: TextStyle(color: Colors.white)),
                                      //     ),
                                      //   ),
                                      // ),
                                      // GestureDetector(
                                      //   onTap: () => context.pop(),
                                      //   child: Container(
                                      //     height: 30,
                                      //     width: 110,
                                      //     decoration: BoxDecoration(
                                      //       color:const Color(0xff8F8D9C),
                                      //       borderRadius:BorderRadius.circular(10)
                                      //     ),
                                      //     child: const Center(
                                      //       child: Text("Cancel",style: TextStyle(color: Colors.white),),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      );
                    },
                    icon: const Icon(Icons.delete_outline_outlined,size: 20,color: Color(0xffCE4949))
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}