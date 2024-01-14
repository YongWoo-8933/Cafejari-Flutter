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
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 600,
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180.0,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            childAspectRatio: 2.7
          ),
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final Location location = locations[index];
            return LayoutBuilder(
              builder: (_, constraint) => GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  onLocationPress(location);
                },
                child: Container(
                  width: constraint.maxWidth,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(constraint.maxHeight/2),
                    border: Border.all(color: AppColor.grey_300)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: location.imageUrl,
                          width: constraint.maxHeight - 8,
                          height: constraint.maxHeight - 8,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2, right: 6),
                          child: Text(
                            location.name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColor.grey_800,
                              fontSize: constraint.maxHeight > 40 ? 14 : 12
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
