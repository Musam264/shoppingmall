import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool showPopup = false;

  void togglePopup() {
    setState(() {
      showPopup = !showPopup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('상품 상세'), centerTitle: true),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '한미 텐텐맛 멀티비타민 100정',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Image.asset(
                    'assets/tenten.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.lock_clock),
                    SizedBox(width: 4),
                    Text('한 달 간 '),
                    Text('100명 이상', style: TextStyle(color: Colors.red)),
                    Text(' 구매했어요')
                  ],
                ),
                const SizedBox(height: 16),
                const Text('무료 배송', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Row(children: [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                    ]),
                    Text('21,000원', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('장바구니 담기'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: togglePopup,
                        child: const Text('바로 구매'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                const Text('더 많은 옵션 보기', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('개당 캡슐/정 × 수량: 100정 × 1개'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('수량: '),
                    const SizedBox(width: 8),
                    DropdownButton<int>(
                      value: 1,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('1')),
                        DropdownMenuItem(value: 2, child: Text('2')),
                        DropdownMenuItem(value: 3, child: Text('3')),
                      ],
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const OptionTile(quantity: '1개', price: '21,000원'),
                const OptionTile(quantity: '3개', price: '42,000원'),
                const OptionTile(quantity: '5개', price: '105,000원'),
                const OptionTile(quantity: '6개', price: '126,000원'),
                const SizedBox(height: 24),
                const Text('상품 설명', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('• 건강식품 사용대상: 유아/어린이'),
                const Text('• 건강식품 타입: 츄어블'),
              ],
            ),
          ),
        ),
        if (showPopup)
          Positioned.fill(
            child: GestureDetector(
              onTap: togglePopup,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/tenten.jpg', height: 80),
                        const SizedBox(height: 8),
                        const Text('텐텐', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const Text('21,000원'),
                        const Text('100정 / 1개'),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: togglePopup,
                                child: const Text('취소하기'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('구매하기'),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class OptionTile extends StatelessWidget {
  final String quantity;
  final String price;

  const OptionTile({required this.quantity, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.circle, color: Colors.black),
      title: Text(quantity),
      trailing: Text(price),
      subtitle: const Text('1정당 181원'),
    );
  }
}