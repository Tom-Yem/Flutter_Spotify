import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/widgets.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key, required this.playlist}) : super(key: key);

  final Playlist playlist;

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 140.0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_outlined,
                size: 30.0,
              ),
              label: Text("Tom Yem"),
            ),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {},
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFAF1018),
                  Theme.of(context).backgroundColor
                ],
                stops: [
                  0,
                  0.3
                ]),
          ),
          child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                children: [
                  PlaylistHeader(playlist: widget.playlist),
                  TracksList(tracks: widget.playlist.songs)
                ],
              )),
        ));
  }
}
