import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/material.dart';

class LocationDialog extends StatelessWidget {
  final Locations locations;
  final Function(Location location) onLocationPress;
  const LocationDialog({super.key, required this.onLocationPress, required this.locations});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.0
          ),
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final Location location = locations[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                onLocationPress(location);
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        imageUrl: location.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      )
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: AppColor.transparentBlack_300,
                      )
                    ),
                    Text(
                      location.name,
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                      textAlign: TextAlign.center
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
