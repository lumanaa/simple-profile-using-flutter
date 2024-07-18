import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isFollowing = false;
  int followerCount = 0;
  int followingCount = 0;
  List<Quote> quotes = [
    Quote(author: 'Kayena', text: 'This is the war room'),
    Quote(author: 'Kayena', text: 'Accept who you are'),
    Quote(author: 'Raphael', text: 'Kedrey Family'),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(192, 241, 136, 138),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/ae/7e/db/ae7edbc0baf6affe5b274c6d711bd69d.jpg',
                  ),
                  radius: 60,
                ),
              ),
              Text(
                'Kayena',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'IndieFlower'
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: '$followerCount ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 225, 80, 80))),
                        TextSpan(
                            text: 'Followers',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ]),
                    ),
                    SizedBox(width: 25),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: '$followingCount ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 225, 80, 80))),
                        TextSpan(
                            text: 'Followers',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ]),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isFollowing = !isFollowing;
                      if (isFollowing) {
                        followerCount += 1;
                      } else {
                        followerCount -= 1;
                      }
                    });
                  },
                  icon: Icon(isFollowing ? Icons.block : Icons.add),
                  label: Text(isFollowing ? 'Unfollow' : 'Follow'),
                    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
      
        if (isFollowing) {
          return Colors.grey; // Grey color when Unfollow state
        }
        return Color.fromARGB(255, 235, 98, 119); // Pink color when Follow state
      },
    ),
  ),
),
              Divider(
                color: Colors.grey,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      // children: quotes
                      //     .map((quote) => Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             quote.text,
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 20,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ))
                      //     .toList(),
                    children: quotes.map((quote) =>QuoteCard(
                      quote:quote,
                      delete: (){
                        setState(() {
                          quotes.remove(quote);
                        });
                      },
                      )).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
