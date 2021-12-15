import 'package:flutter/material.dart';
import 'package:sampleapp/flip.dart';
import 'package:sampleapp/payment_category_model.dart';
import 'package:sampleapp/transaction_model.dart';

import 'title_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<PaymentModel> paymentCategories = [
    PaymentModel('Mobile Home Dealers', 'Last Payment 17 May', '4948', 85,
        Colors.deepPurple[400], Colors.deepPurple[400]),
    PaymentModel('Taxicabs And Limousines', 'Last Payment 26 May', '449', 8,
        Colors.blue, Colors.blue),
    PaymentModel('Miscellaneous Apparel And Accessory Shops',
        'Last Payment 06 Apr', '245', 4, Colors.redAccent, Colors.orange),
    PaymentModel(
        'Electric, Gas, Sanitary And Water Utilities',
        'Last Payment 01 May',
        '147',
        3,
        Colors.deepPurpleAccent,
        Colors.deepPurpleAccent),
    PaymentModel('Misc, General Merchandise', 'Last Payment 01 Mar', '1', 0,
        Colors.blue, Colors.blue),
  ];

  final List<TransactionModel> transactionList = [
    TransactionModel(
        'WWWOLACABSCOM', '26 May 2021', '- \u{20B9} 449', '6:40 PM', false),
    TransactionModel(
        'Recharge', '26 May 2021', '+ \u{20B9} 155', '6:35 PM', true),
    TransactionModel('Reliance Retail Ltd', '17 May 2021', '- \u{20B9} 4,949',
        '12:11 AM', false),
    TransactionModel(
        'Recharge', '17 May 2021', '+ \u{20B9} 4,500', '12:09 AM', true),
    TransactionModel('Airtel', '07 May 2021', '- \u{20B9} 49', '8:06 AM', false)
  ];
  bool loading = false;
  onrefresh() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: RefreshIndicator(
        onRefresh: () => onrefresh(),
        child: SingleChildScrollView(
          child: loading
              ? const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.transparent, 
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40, right: 40, left: 40, bottom: 20),
                      child: Card(
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [Colors.blue, Colors.cyan]),
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(10)),
                            height: 180,
                            width: double.infinity,
                            child: const Center(
                                child: Text('Simhadri Bogula',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)))),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Tap on any card for more details',
                        style: TextStyle(fontSize: 15, color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: const Text(
                            'Card Balance',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  '\u{20B9} 0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: titleSection('PAYMENT CATEGORIES'),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 200,
                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: paymentCategories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          paymentCategories[index].colorone!,
                                          paymentCategories[index].colortwo!
                                        ])),
                                width: 140,
                                child: Stack(
                                  children: [
                                    Flipper(
                                      count: (paymentCategories[index]
                                                  .percentage! ~/
                                              4)
                                          .toInt(),
                                    ),
                                    Card(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      child: GridTile(
                                        header: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                paymentCategories[index].title!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Text(
                                                paymentCategories[index]
                                                    .description!,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Container(),
                                        footer: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\u{20B9} ${paymentCategories[index].amount!}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '${paymentCategories[index].percentage!.toString()}%',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          titleSection('LATEST TRANSACTIONS'),
                          const Spacer(),
                          Row(
                            children: const [
                              Text(
                                'Show All  ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white70),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.white70, size: 12),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    ListView.separated(
                      padding: const EdgeInsets.all(0),
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: transactionList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: const Color(0xFF192841),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.repeat_rounded)),
                          title: (Text(
                            transactionList[index].title!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                          subtitle: Text(transactionList[index].date!,
                              style: const TextStyle(
                                fontSize: 14,
                              )),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(transactionList[index].price!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: transactionList[index].isPositive!
                                          ? Colors.green
                                          : Colors.red)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                transactionList[index].time!,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey[400]),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: ((BuildContext context, int index) {
                        return const Divider();
                      }),
                    )
                  ],
                ),
        ),
      ),
    ));
  }
}
