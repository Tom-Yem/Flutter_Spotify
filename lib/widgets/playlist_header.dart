import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PLAYLIST",
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(fontSize: 12.0),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  playlist.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  playlist.description,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        _PlaylistButtons(followers: playlist.followers)
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  const _PlaylistButtons({Key? key, required this.followers}) : super(key: key);

  final String followers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 48),
            primary: Theme.of(context).iconTheme.color,
            backgroundColor: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            textStyle: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 12, letterSpacing: 2),
          ),
          onPressed: () {},
          child: Text("PLAY"),
        ),
        const SizedBox(
          width: 8.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          iconSize: 30,
        ),
        const Spacer(),
        Text(
          "FOLLOWERS\n$followers,",
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
