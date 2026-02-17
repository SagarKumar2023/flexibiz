import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';

class NewQuotationCurrency extends StatefulWidget {
  const NewQuotationCurrency({super.key});

  @override
  State<NewQuotationCurrency> createState() => _NewQuotationCurrencyState();
}

class _NewQuotationCurrencyState extends State<NewQuotationCurrency> {
  final TextEditingController searchController = TextEditingController();

  final List<String> allCurrency = [
    "AUSTRALIAN DOLLAR (ASD)",
    "CANADIAN DOLLAR (CAD)",
    "CHINESE YUAN (CNY)",
    "DEUTCH MARK (DEM)",
    "DINAR (LYD)",
    "EURO (EUR)",
    "GREAT BRITAIN POUND (GBP)",
    "JAPANESE YEN (YEN)",
    "NIGERIAN NAIRA (NGN)",
    "POUND STERLING (PST)",
    "RUPEE (INR)",
    "RUPEES (RS)",
    "US DOLLAR (USD)"
  ];

  /// Array to add searched Currency...
  List<String> filteredCurrency = [];

  void _filterCurrency(String value) {
    setState(() {
      filteredCurrency = allCurrency
          .where((item) => item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredCurrency = allCurrency;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorUtils.primary,
        title: const TextWidget(
          text: "Select Currency",
          textColor: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Column(
        children: [
          /// 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: _filterCurrency,
              decoration: InputDecoration(
                hintText: "Search currency...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          /// Currency List
          Expanded(
            child: ListView.builder(
              itemCount: filteredCurrency.length,
              itemBuilder: (context, index) {
                final item = filteredCurrency[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.pop(context, item);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.attach_money, color: ColorUtils.primary),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextWidget(
                              text: item,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black,
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
