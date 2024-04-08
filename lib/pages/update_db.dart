import 'package:flutter/material.dart';
import 'package:wmservice/vars_models.dart';
import 'package:dio/dio.dart';
import 'package:wmservice/menu/drawer_menu.dart';

class UpdateDB extends StatelessWidget {

  const UpdateDB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WMService'),
        backgroundColor: wmColor,
      ),
      drawer: const DrawerMenu(),
      body: const UpdateDBUpd(),
    );
  }
}

class UpdateDBUpd extends StatefulWidget {
  const UpdateDBUpd({super.key});

  @override
  UpdateDBUpdState createState() {
    return UpdateDBUpdState();
  }
}

class UpdateDBUpdState extends State<UpdateDBUpd> {

  Text state = const Text('Press button to download');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {              
              final dio = Dio();
              try {
                await dio.download(
                  syncAddr,
                  dbPath,
                  onReceiveProgress: (received, total) {
                    if (total <= 0) {
                      setState(() {
                        state = const Text('Error!', style: TextStyle(color: Colors.red),);
                      });
                      return;
                    }
                    if (received == total) {
                      allTickets = List.empty(growable: true);
                      setState(() {
                        state = const Text('Success!', style: TextStyle(color: Colors.green),);
                      });
                    } else {
                      setState(() {
                        state = const Text('In progress');
                      });
                    }
                  },
                  deleteOnError: true,
                );
              } on DioException catch (e) {
                setState(() {
                  state = Text('$e');
                });
              }
            }, 
            child: const Text('Download'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: state,
          ),
        ],
      ),
    );
  }
}