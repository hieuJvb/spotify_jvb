import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  final String songTitle;
  final String artist;
  final String duration;
  final bool isPlaying;

  const PlaylistItem({
    Key? key,
    required this.songTitle,
    required this.artist,
    required this.duration,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            isPlaying ? Icons.radio_button_checked : Icons.radio_button_unchecked,
            color: isPlaying ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                artist,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          Text(duration),
        ],
      ),
    );
  }
}
