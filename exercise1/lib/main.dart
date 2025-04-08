import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF173C69),
          leading: const Icon(Icons.home),
          centerTitle: true,
          title: const Text('First Portfolio Exam'),
          titleTextStyle: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrange,
                  border: Border.all(color: Colors.black, width: 5),
                ),
                child: Text(
                  'Welcome',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black87,
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'TAMK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 200,
                    color: Colors.black54,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Flutter!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black38,
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'THWS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF173C69),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/thws_logo.png',
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
