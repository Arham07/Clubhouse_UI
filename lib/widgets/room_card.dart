import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/screens/RoomScreen.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => RoomScreen(room: room))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club } 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                      fontSize: 12.0),
                  // overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${room.name} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                      fontSize: 15.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 90.0,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20.0,
                              left: 28.0,
                              child: UserProfileImage(
                                imageUrl: room.speakers[1].imageUrl,
                                size: 45.0,
                              ),
                            ),
                            UserProfileImage(
                              imageUrl: room.speakers[0].imageUrl,
                              size: 48.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map(
                            (e) => Text(
                              '${e.givenName}  ${e.familyName} 💭',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${room.speakers.length + room.followedBySpeakers.length + room.others.length} ',
                                  ),
                                  const WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.person_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(text: ' / ${room.speakers.length} '),
                                  const WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.chat_bubble_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
