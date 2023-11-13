import 'package:flutter/material.dart';
import 'package:flutter_animation_lesson1/models/trip.dart';
import 'package:flutter_animation_lesson1/screens/details.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addTrips();
    });
    //_addTrips();
  }

  void _addTrips() {
    // get data from db
    List<Trip> _trips = [
      Trip(
          title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];

    for (var trip in _trips) {
      _tripTiles.add(_buildTile(trip));
      _listKey.currentState?.insertItem(_tripTiles.length - 1);
    }
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(trip: trip),
          ),
        );
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${trip.nights} Nights',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue[300],
            ),
          ),
          Hero(
            tag: 'trip-${trip.title}',
            child: Text(
              trip.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('Rs. ${trip.price}'),
    );
  }

  Tween<Offset> position = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _tripTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(position),
            child: _tripTiles[index],
          );
        });
  }
}
