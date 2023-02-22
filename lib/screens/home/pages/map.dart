import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../models/barbershopModel.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  GoogleMapController? _googleMapController;
  List<Barbershop> nonVipBarbershops = [];
  List<Barbershop> vipBarbershops = [];
  static late LatLng latLng;
  late CameraPosition _initialCameraPosition;
  bool gettingUserLocation = true;

  getUserLocation() async {
    LocationData locationData = await Location().getLocation();

    setState(() {
      _initialCameraPosition = CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 15);
      gettingUserLocation = false;
    });
  }

  final Set<Marker> markers = {};
  bool _showBarbershop = false;
  Barbershop? barbershopX;
  // late Marker _origin;
  // late Marker _destination;
  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController cntlr) {
    _googleMapController = cntlr;
  }

  _addMarker(Barbershop barbershop) {
    var marker = Marker(
        position: LatLng(barbershop.latitude, barbershop.longitude),
        icon: barbershop.vip
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow)
            : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        markerId: MarkerId(barbershop.barbershopUID),
        onTap: () => setState(() {
              _showBarbershop = !_showBarbershop;
              barbershopX = barbershop;
            }));
    markers.add(marker);
  }

  int? barbersLength;

  getBarbersLength() async {
    final int number = await FirebaseFirestore.instance
        .collection('barbershops')
        .doc(barbershopX!.barbershopUID)
        .collection('barbers')
        .snapshots()
        .length;
    setState(() {
      barbersLength = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserLocation();
    return FirestoreBuilder(
        ref: barbershopsRef,
        builder: (context, AsyncSnapshot<BarbershopQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          }
          if (!snapshot.hasData || gettingUserLocation) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff191b2c),
                    Color(0xff191c31),
                    Color(0xff192270)
                  ],
                ),
              ),
              child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color(0xff394180),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Getting User location...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            );
          }
          BarbershopQuerySnapshot querySnapshot = snapshot.requireData;
          for (var element in querySnapshot.docs) {
            _addMarker(element.data);
          } //FIXME: barbers length is null;
          if (_showBarbershop) getBarbersLength();
          return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff191b2c),
                    Color(0xff191c31),
                    Color(0xff192270)
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GoogleMap(
                        markers: markers,
                        initialCameraPosition: _initialCameraPosition,
                        myLocationEnabled: true,
                        onMapCreated: _onMapCreated,
                      ),
                    ),
                  ),
                  if (_showBarbershop)
                    Dismissible(
                      direction: DismissDirection.down,
                      key: ValueKey(barbershopX!.barbershopUID),
                      onDismissed: (direction) => setState(() {
                        _showBarbershop = false;
                      }),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.all(30),
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0xff394180), Color(0xff181c3d)],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xe51c2145),
                                        blurRadius: 10,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    color: const Color(0xff394180),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          barbershopX!.name,
                                          style: const TextStyle(
                                            color: Color(0xfff6f6f6),
                                            fontSize: 18,
                                            fontFamily: "SF Compact Rounded",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            barbershopX!.rating.toString(),
                                            style: const TextStyle(
                                              color: Color(0xffc8c8c8),
                                              fontSize: 18,
                                              fontFamily: "SF Compact Display",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: Colors.yellow,
                                          ),
                                          Image.asset("assets/images/mower.png",
                                              scale: 0.9)
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_city,
                                        color: Colors.white),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(barbershopX!.location,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "SF Compact Display",
                                            fontWeight: FontWeight.w700,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_city,
                                        color: Colors.white),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                          "${barbershopX!.open} => ${barbershopX!.close}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "SF Compact Display",
                                            fontWeight: FontWeight.w500,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/2 Friends.png'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("$barbersLength barbers",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "SF Compact Display",
                                            fontWeight: FontWeight.w500,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ));
        });
  }
}
