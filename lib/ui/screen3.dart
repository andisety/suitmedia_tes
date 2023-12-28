import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/respons.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final Dio _dio = Dio();
  late Future<ResponseApi> _futureData;
  final ScrollController _scrollController = ScrollController();
  final List<Datum> _dataList = [];

  int _currentPage = 1;
  final int _totalPages = 1;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData(_currentPage);
    _scrollController.addListener(_scrollListener);
  }

  Future<ResponseApi> fetchData(int page) async {
    try {
      Response response =
          await _dio.get('https://reqres.in/api/users?page=$page&per_page=10');
      ResponseApi responseData = ResponseApi.fromJson(response.data);
      return responseData;
    } catch (error) {
      print('Error: $error');
      rethrow;
    }
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // User has reached the bottom of the list, load next page
      if (_currentPage < _totalPages) {
        _currentPage++;
        _futureData = fetchData(_currentPage);
        setState(() {});
      }
    }
  }

  Future<void> _refreshData() async {
    _currentPage = 1;
    _futureData = fetchData(_currentPage);
    setState(() {});
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
      body: Center(
        child: FutureBuilder<ResponseApi>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              _dataList.addAll(snapshot.data!.data);
              return RefreshIndicator(
                onRefresh: _refreshData,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) {
                    Datum datum = _dataList[index];
                    return ListTile(
                      title: Text('${datum.firstName} ${datum.lastName}'),
                      subtitle: Text(datum.email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(datum.avatar),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
