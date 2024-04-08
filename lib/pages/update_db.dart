import 'package:flutter/material.dart';
import 'package:wmservice/vars_models.dart';
import 'package:dio/dio.dart';

// import 'package:wmservice/menu/drawer_menu.dart';

class UpdateDB extends StatelessWidget {

  const UpdateDB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WMService'),
        backgroundColor: wmColor,
      ),
      // drawer: const DrawerMenu(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool isErr = false;
            final dio = Dio();
            try {
              await dio.download(
                syncAddr,
                dbPath,
                onReceiveProgress: (received, total) {
                  if (received == total) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return showDownloadResult(context, false, '');
                      },
                    );
                  } else {
                    isErr = true;    
                  }
                },
              );
            } catch (e) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return showDownloadResult(context, true, '$e');
                },
              );
              isErr = false;
            }
            if (isErr) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return showDownloadResult(context, true, 'Download Error');
                },
              );  
            }
          }, 
          child: const Text('Download'),
        ),
      ),
    );
  }
}

AlertDialog showDownloadResult(BuildContext context, bool isErr, String resText) {
  var myIcon = const Icon(Icons.check_circle, color: Colors.greenAccent,);
  String myText = 'Success!';

  if (isErr) {
    myIcon = const Icon(Icons.error, color: Colors.redAccent,);
    myText = 'Error!';
  }

  AlertDialog alert = AlertDialog(
    icon: myIcon,
    title: Text(myText),
    content: Text(resText),
    actions: [
      TextButton(
        child: const Text("OK"),
        onPressed: () => Navigator.pop(context, 'OK'),
      ),
    ],
  );

  return alert;
}