import 'package:cafejari_flutter/ui/screen/profile/component/profile_image.dart';
import 'package:cafejari_flutter/ui/screen/profile/component/profile_point.dart';
import 'package:cafejari_flutter/ui/screen/profile/component/profile_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CafeLogScreen extends ConsumerWidget {
  const CafeLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileViewModelProvider);
    final profileViewModel = ref.watch(profileViewModelProvider.notifier);


    return Scaffold(

    );
  }
}
