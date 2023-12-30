import 'package:flutter/material.dart';
import 'package:weather/common/common.dart';

class LocationInputWidget extends StatefulWidget {
  const LocationInputWidget({
    super.key,
    required this.locationCallback,
  });

  final Function(double, double) locationCallback;

  @override
  State<StatefulWidget> createState() {
    return LocationInputState();
  }
}

class LocationInputState extends State<LocationInputWidget> {
  late TextEditingController _latController;
  late TextEditingController _longController;

  @override
  void initState() {
    _latController = TextEditingController();
    _longController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _latController.dispose();
    _longController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    AppInput(
                      title: 'Latitude',
                      placeHolder: 'Enter latitude',
                      controller: _latController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppInput(
                      title: 'Longitude',
                      placeHolder: 'Enter longitude',
                      controller: _longController,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  //validate
                  final lat = _latController.text;
                  final long = _longController.text;
                  if (num.tryParse(lat) == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ErrorMessage(
                          message: 'Latitude is invalid!',
                        );
                      },
                    );
                    return;
                  }
                  if (num.tryParse(long) == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ErrorMessage(
                          message: 'Longitude is invalid!',
                        );
                      },
                    );
                    return;
                  }
                  widget.locationCallback(
                    double.tryParse(_latController.text) ?? 0,
                    double.tryParse(_longController.text) ?? 0,
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            child: const Text(
              'Click to get you current location!',
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
            onTap: () {
              getCurrentLocation(context);
            },
          )
        ],
      ),
    );
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    try {
      final location = await LocationHelper.instance.getCurrentLocation();
      _latController.text = '${location.latitude}';
      _longController.text = '${location.longitude}';
    } catch (e) {
      final isErrorPermission =
          e == 'LOCATION_SERVICE_ERROR' || e == 'LOCATION_PERMISSION_DENIED';
      if (isErrorPermission && context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return const LocationDenied();
          },
        );
      }
      //error
    }
  }
}
