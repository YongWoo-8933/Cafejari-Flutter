import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/screen/map/component/list_view_button.dart';
import 'package:cafejari_flutter/ui/screen/map/map_frame.dart';
import 'package:cafejari_flutter/ui/util/permission_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';


class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}


class MapScreenState extends ConsumerState<MapScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      locationPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final double bottomNavBarHeight = ref.read(bottomSheetHeightProvider);
    final double bottomNavBarCornerRadius = ref.read(bottomSheetCornerRadiusProvider);

    return Scaffold(
      backgroundColor: AppColor.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text("카페 불러오기"),
        onPressed: () {
          // mapViewModel.refreshCafes()
          mapState.bottomSheetController.open();
        },
      ),
      body: Stack(
        children: [
          MapFrame(),
          Visibility(
            visible: mapState.topImageVisible,
            child: Positioned(
                // child: Image.network(mapState.selectedCafeInfo.googlePlaceId)
                child: Image.network("")
            ),
          ),
          Visibility(
            visible: mapState.topVisible,
            child: Positioned(
                top: MediaQuery.of(context).size.height*0.55,
                left: MediaQuery.of(context).size.width*0.45,
                child: ListViewButton(
                    onPressed: () => {

                    }
                )
            ),
          )
        ],
      )
    );
  }
}
