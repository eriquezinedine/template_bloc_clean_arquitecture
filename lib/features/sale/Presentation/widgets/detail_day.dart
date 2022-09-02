import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:flutter/material.dart';

class DetailDay extends StatelessWidget {
  const DetailDay({Key? key, required this.total}) : super(key: key);
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20
        ),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: const Color(0XFFE9EAEC))

        ),
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:   [
                  const Text(
                    'Utilidad Total',
                     style: TextStyle(
                      color: ThemeColor.textSecundary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                     ),
                  ),
                  Text(
                    'S/ $total',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  )
                ],
              ),
            ),
            Container( height: double.infinity,width: 2, color: ThemeColor.textSecundary,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.monetization_on, color: Colors.green,size: 30,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Ventas Totales',
                                style: TextStyle(
                                color: ThemeColor.textSecundary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),

                            ),
                            Text(
                              'S/ 193',
                              style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                              ),

                            ),

                          ],
                        )
                      ],
                    )
                  ),
                   Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.monetization_on, color: Colors.redAccent,size: 30),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Gastos Totales',
                                style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),

                            ),
                            Text(
                              'S/ 170',
                              style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                              ),

                            ),

                          ],
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}