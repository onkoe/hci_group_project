import 'package:flutter/material.dart';

void main() {
  runApp(const SpotifyDesktopApp());
}

class SpotifyDesktopApp extends StatelessWidget {
  const SpotifyDesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Desktop',
      debugShowCheckedModeBanner: false,
      home: const SpotifyHomePage(),
    );
  }
}

class SpotifyHomePage extends StatelessWidget {
  const SpotifyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: Row(
              children: [
                const Sidebar(),
                Expanded(
                  child: Column(
                    children: const [
                      Expanded(child: MainContent()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const MiniPlayer(),
        ],
      ),
    );
  }
}


class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SidebarItem(icon: Icons.library_music, label: 'Library'),
          Expanded( 
            child: VerticalAlbumList(),
          )
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const SidebarItem({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SectionTitle('Recently Played'),
                  HorizontalAlbumList(),
                  SectionTitle('Made for You'),
                  HorizontalAlbumList(),
                  SectionTitle('New Releases'),
                  HorizontalAlbumList(),
                  SectionTitle('Top Picks'),
                  HorizontalAlbumList(),
                  SectionTitle('Podcasts'),
                  HorizontalAlbumList(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.grey[700],
            ),
            const SizedBox(width: 10),
            const Text("Track Title", style: TextStyle(color: Colors.white)),
          ]),
          Row(
            children: const [
              Icon(Icons.skip_previous, color: Colors.white),
              SizedBox(width: 20),
              Icon(Icons.play_arrow, color: Colors.white),
              SizedBox(width: 20),
              Icon(Icons.skip_next, color: Colors.white),
            ],
          ),
          Icon(Icons.volume_up, color: Colors.white),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}

class HorizontalAlbumList extends StatelessWidget {
  const HorizontalAlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 5),
                Text('Playlist $index', style: const TextStyle(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class VerticalAlbumList extends StatelessWidget {
  const VerticalAlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.music_note, color: Colors.white),
          ),
          title: Text(
            'Playlist $index',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          subtitle: const Text(
            'Artist · Playlist',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          onTap: () {
            // Do something on click
          },
        );
      },
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.black87,
      child: Row(
        children: [
          const Spacer(), // Push content to the center

          // 🌟 Centered Home + Search
          Center(
            child: SizedBox(
              width: 460, // Total width for Home + Search
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      // Handle Home click
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.white54),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(), // Push content to the center from right too
        ],
      ),
    );
  }
}




