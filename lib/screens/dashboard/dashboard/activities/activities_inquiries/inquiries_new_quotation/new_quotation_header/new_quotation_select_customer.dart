import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'new_quotation_customer_search_dialog.dart';

class NewQuotationSelectCustomer extends StatefulWidget {
  const NewQuotationSelectCustomer({super.key});

  @override
  State<NewQuotationSelectCustomer> createState() => _NewQuotationSelectCustomerState();
}

class _NewQuotationSelectCustomerState extends State<NewQuotationSelectCustomer> {

  @override
  void initState() {
    super.initState();

    // Run after the first frame is drawn
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openCustomerDialog();
    });
  }

  void _openCustomerDialog() async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (context) {
        return NewQuotationCustomerSearchDialog(); // your search dialog widget
      },
    );

    if (result != null) {
      // Navigate to next page after selection
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => CustomerDetailPage(customer: result),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorUtils.colorWhite),
        title: TextWidget(
          text: "SELECT CUSTOMER",
          textColor: ColorUtils.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: ColorUtils.primary,
      ),
    );
  }
}
