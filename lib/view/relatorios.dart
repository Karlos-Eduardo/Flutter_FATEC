//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:pie_chart/pie_chart.dart';
import 'package:app_agni/models/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class TelaRelatorios extends StatefulWidget {
  const TelaRelatorios({Key? key}) : super(key: key);

  @override
  State<TelaRelatorios> createState() => _TelaRelatoriosState();
}

class _TelaRelatoriosState extends State<TelaRelatorios> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 500;

    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 500;

    Map<String, double> dataMap = {
      "Largura": screenWidth,
      "Altura": screenHeight,
      "Concluídos": 298,
      "Ionic": 256,
    };

    final gradientList = <List<Color>>[
      [
        //A cor segue a ordem da legenda do gráfico
        Color.fromARGB(255, 18, 246, 2),
        Color.fromARGB(255, 217, 245, 213),
      ],
      [
        Color.fromARGB(255, 251, 0, 0),
        Color.fromARGB(255, 247, 209, 209),
      ],
      [
        Color.fromARGB(255, 225, 255, 0),
        Color.fromARGB(255, 241, 236, 181),
      ],
      [
        Color.fromARGB(255, 1, 13, 251),
        Color.fromARGB(255, 187, 195, 255),
      ]
    ];

    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.notifications,color: Colors.black))
        ],
        title: const Text('Relatórios',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.10,
              color: const Color.fromARGB(250, 158, 203, 247),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.description_sharp,
                        color: Colors.black, size: 60),
                    Text(
                      'Relatórios',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ]),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                color: Color.fromARGB(250, 158, 203, 247),
                child: GridView.count(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 1,
                  //padding: EdgeInsets.only(left: 20),
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('teste'),
                            PieChart(
                              dataMap: dataMap,
                              animationDuration: Duration(milliseconds: 1000),
                              chartRadius:
                                  MediaQuery.of(context).size.width * 1,
                              chartType: ChartType.ring,
                              ringStrokeWidth: 20,
                              baseChartColor: Colors.red[50]!.withOpacity(0),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true,
                              ),
                              gradientList: gradientList,
                              centerText: "Chamados",
                              chartLegendSpacing: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.amber,
                      child: PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 1000),
                        chartRadius: MediaQuery.of(context).size.width * 1,
                        chartType: ChartType.disc,
                        baseChartColor: Colors.red[50]!.withOpacity(0),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        gradientList: gradientList,
                      ),
                    ),
                    Container(
                      color: Colors.cyan,
                      child: DChartBar(
                        data: [
                          {
                            'id': 'Bar',
                            'data': [
                              {'domain': '2020', 'measure': 25},
                              {'domain': '2021', 'measure': 34},
                              {'domain': '2022', 'measure': 40},
                              {'domain': '2023', 'measure': 30},
                            ],
                          },
                        ],
                        domainLabelPaddingToAxisLine: 16,
                        axisLineTick: 2,
                        axisLinePointTick: 2,
                        axisLinePointWidth: 5,
                        axisLineColor: Color.fromARGB(255, 0, 4, 1),
                        measureLabelPaddingToAxisLine: 20,
                        barColor: (barData, index, id) =>
                            Color.fromARGB(255, 8, 20, 52),
                        showBarValue: false,
                        borderColor: Color.fromARGB(255, 255, 28, 7),
                        verticalDirection: false,
                      ),
                    ),
                    Container(
                      color: Colors.cyan,
                      child: DChartBar(
                        data: [
                          {
                            'id': 'Bar',
                            'data': [
                              {'domain': '2020', 'measure': 25},
                              {'domain': '2021', 'measure': 34},
                              {'domain': '2022', 'measure': 40},
                              {'domain': '2023', 'measure': 30},
                            ],
                          },
                        ],
                        domainLabelPaddingToAxisLine: 16,
                        axisLineTick: 2,
                        axisLinePointTick: 2,
                        axisLinePointWidth: 5,
                        axisLineColor: Color.fromARGB(255, 0, 4, 1),
                        measureLabelPaddingToAxisLine: 20,
                        barColor: (barData, index, id) =>
                            Color.fromARGB(255, 8, 20, 52),
                        showBarValue: false,
                        borderColor: Color.fromARGB(255, 255, 28, 7),
                        //verticalDirection: false,
                      ),
                    ),
                    DChartBar(
                      data: [
                        {
                          'id': 'Bar 1',
                          'data': [
                            {'domain': '2020', 'measure': 32},
                            {'domain': '2021', 'measure': 43},
                            {'domain': '2022', 'measure': 29},
                            {'domain': '2023', 'measure': 16},
                          ],
                        },
                        {
                          'id': 'Bar 2',
                          'data': [
                            {'domain': '2020', 'measure': 24},
                            {'domain': '2021', 'measure': 42},
                            {'domain': '2022', 'measure': 9},
                            {'domain': '2023', 'measure': 37},
                          ],
                        },
                        {
                          'id': 'Bar 3',
                          'data': [
                            {'domain': '2020', 'measure': 17},
                            {'domain': '2021', 'measure': 28},
                            {'domain': '2022', 'measure': 12},
                            {'domain': '2023', 'measure': 30},
                          ],
                        },
                      ],
                      minimumPaddingBetweenLabel: 1,
                      domainLabelPaddingToAxisLine: 16,
                      axisLineTick: 2,
                      axisLinePointTick: 2,
                      axisLinePointWidth: 10,
                      axisLineColor: Colors.green,
                      measureLabelPaddingToAxisLine: 16,
                      barColor: (barData, index, id) => id == 'Bar 1'
                          ? Colors.green.shade300
                          : id == 'Bar 2'
                              ? Colors.green.shade600
                              : Colors.green.shade900,
                      barValue: (barData, index) => '${barData['measure']}',
                      showBarValue: true,
                      barValueFontSize: 12,
                      barValuePosition: BarValuePosition.outside,
                    ),
                    Container(
                      color: Colors.purple,
                      child: DChartLine(
                        data: [
                          {
                            'id': 'Line',
                            'data': [
                              {'domain': 0, 'measure': 4.1},
                              {'domain': 2, 'measure': 40},
                              {'domain': 3, 'measure': 20},
                              {'domain': 6, 'measure': 10},
                            ],
                          },
                        ],
                        lineColor: (lineData, index, id) => Colors.amber,
                      ),
                    ),
                    DChartPie(
                      data: [
                        {'domain': 'Flutter', 'measure': 28},
                        {'domain': 'React Native', 'measure': 27},
                        {'domain': 'Ionic', 'measure': 20},
                        {'domain': 'Cordova', 'measure': 15},
                      ],
                      fillColor: (pieData, index) =>
                          Color.fromARGB(255, 75, 236, 81),
                      pieLabel: (pieData, index) => Text('Chamados'),
                      labelColor: Color.fromARGB(255, 229, 115, 115),
                      labelPosition: PieLabelPosition.inside,
                      labelLineColor: Color.fromARGB(255, 229, 115, 115),
                    ),
                    DChartPie(
                      data: [
                        {'domain': 'Flutter', 'measure': 28},
                        {'domain': 'React Native', 'measure': 27},
                        {'domain': 'Ionic', 'measure': 20},
                        {'domain': 'Cordova', 'measure': 15},
                      ],
                      fillColor: (pieData, index) =>
                          Color.fromARGB(255, 239, 95, 210),
                      donutWidth: 30,
                      labelColor: Colors.white,
                      animationDuration: Duration(milliseconds: 1000),
                    ),
                    DChartGauge(
                      data: [
                        {'domain': 'Off', 'measure': 30},
                        {'domain': 'Warm', 'measure': 30},
                        {'domain': 'Hot', 'measure': 30},
                      ],
                      fillColor: (pieData, index) {
                        switch (pieData['domain']) {
                          case 'Off':
                            return Colors.green;
                          case 'Warm':
                            return Colors.orange;
                          default:
                            return Colors.red;
                        }
                      },
                      showLabelLine: false,
                      pieLabel: (pieData, index) {
                        return "${pieData['domain']}";
                      },
                      labelPosition: PieLabelPosition.inside,
                      labelPadding: 0,
                      labelColor: Colors.white,
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Imprimir',style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    );
  }
}
