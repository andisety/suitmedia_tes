import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_tes/ui/screen2.dart';

import '../model/respons.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final Dio _dio = Dio();
  List<Datum> _dataList = [];
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      Response response = await _dio
          .get('https://reqres.in/api/users?page=$_currentPage&per_page=10');
      ResponseApi responseData = ResponseApi.fromJson(response.data);
      setState(() {
        _dataList = responseData.data;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Third Screen"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollEndNotification &&
              scrollInfo.metrics.extentAfter == 0.0) {
            _currentPage++;
            _fetchData();
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            _currentPage = 1;
            await _fetchData();
          },
          child: _dataList.isEmpty
              ? GestureDetector(
                  onVerticalDragUpdate: (details) {
                    int sensitivity = 1;
                    if (details.delta.dy > sensitivity) {
                      _currentPage = 1;
                      _fetchData();
                    } else if (details.delta.dy < sensitivity) {
                      _currentPage++;
                      _fetchData();
                    }
                  },
                  child: Stack(
                    children: [
                      const Center(child: Text('Data kosong')),
                      Center(
                        child: Container(
                          color: const Color.fromARGB(0, 255, 193, 7),
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) {
                    Datum datum = _dataList[index];
                    return ListTile(
                      title: Text('${datum.firstName} ${datum.lastName}'),
                      subtitle: Text(datum.email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(datum.avatar),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(data: datum),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
