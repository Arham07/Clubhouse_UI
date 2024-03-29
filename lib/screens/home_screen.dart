import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clubhouse_ui/config/palette.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            size: 28.0,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.envelope_open,
              size: 26.0,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.calendar,
              size: 28.0,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
              size: 28.0,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 10.0),
              child:
                  UserProfileImage(imageUrl: currentUser.imageUrl, size: 36.0),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 120.0),
            children: [
              UpcomingRooms(upcomingRooms: upcomingRoomsList),
              const SizedBox(height: 12.0),
              ...roomsList.map((e) => RoomCard(room: e)).toList(),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context)
                        .scaffoldBackgroundColor /*by default 1 hota tw likha he nhi*/
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Palette.green,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        CupertinoIcons.plus,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                        text: ' Start Meeting',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 60.0,
              right: 40.0,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.circle_grid_3x3_fill,
                      size: 28.0,
                    ),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 4.6,
                      bottom: 11.8,
                      child: Container(
                    height: 16.0,
                    width: 16.0,
                    decoration: BoxDecoration(color: Palette.green , shape: BoxShape.circle),
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
