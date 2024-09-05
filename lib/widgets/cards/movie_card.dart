import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project6/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

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
                  ? Image.asset(
                      movie.posterImg,
                      width: 173,
                      height: 224,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(movie.posterImg),
                      width: 173,
                      height: 224,
                      fit: BoxFit.cover,
                    )),
          const SizedBox(
            height: 16,
          ),
          Text(
            movie.name,
            style: const TextStyle(
                color: Color(0xff6F43F5), fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Icon(Icons.videocam_outlined, size: 16, color: Color(0xffF2F2F2),),
              Text(
                movie.category,
                style: const TextStyle(color: Color(0xffDEDEDE), fontSize: 12),
              ),
            ],
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 173),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 16,
                      color: Color(0xffF2F2F2),
                    ),
                    Text(
                      movie.date,
                      style:
                          const TextStyle(color: Color(0xffDEDEDE), fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      size: 20,
                      color: Color(0xffF8F8F8),
                    ),
                    Icon(
                      Icons.delete_outline_outlined,
                      size: 20,
                      color: Color(0xffCE4949),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
