// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hafefly/models/barbershopModel.dart';

// ignore: must_be_immutable
class MapWidget extends StatelessWidget {
  MapWidget(this.barbershop, this.size, {Key? key}) : super(key: key);

  final Barbershop barbershop;
  final Size size;

  void dispose() {
    _controller.dispose();
  }

  late GoogleMapController _controller;

  void _onMapCreated(GoogleMapController cntlr) {
    _controller = cntlr;
  }

  Marker _barbershopMarker(Barbershop barbershop) {
    return Marker(
      position: LatLng(barbershop.latitude, barbershop.longitude),
      icon: barbershop.vip
          ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow)
          : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      markerId: MarkerId(barbershop.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height / 3 + 20,
      child: GoogleMap(
        markers: <Marker>{_barbershopMarker(barbershop)},
        initialCameraPosition: CameraPosition(
            target: LatLng(barbershop.latitude, barbershop.longitude),
            zoom: 15),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
