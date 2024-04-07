import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermissions() async {

  if (Platform.isAndroid) {

    final permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied) {
        // Here just ask for the permission for the first time
        await Permission.storage.request();

        // I noticed that sometimes popup won't show after user press deny
        // so I do the check once again but now go straight to appSettings
        if (permissionStatus.isDenied) {
            return false;
        }
    } else if (permissionStatus.isPermanentlyDenied) {
        // Here open app settings for user to manually enable permission in case 
        // where permission was permanently denied
        return false;
    }
  }

  return true;
}