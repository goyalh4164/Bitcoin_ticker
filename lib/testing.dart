import 'Feteching_Data.dart';

CoinPrice coinPrice = CoinPrice(currency_name: 'ZAR');
Future<void> fetching() async {
  List<int> list = await coinPrice.getData();
  for (int i in list) {
    print(i);
  }
}
