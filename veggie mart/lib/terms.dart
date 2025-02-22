import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Conditions',
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontWeight: FontWeight.bold,
            fontSize: screenSize.width * 0.06, // Scales with screen width
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Welcome to Shop Nest',
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.width * 0.065,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                _buildSectionTitle('1. Introduction', screenSize, textScaleFactor),
                _buildSectionContent(
                    '''Thank you for choosing Veggie Mart , an e-commerce platform where you can buy and sell products with ease. By using our app, you agree to the following terms and conditions. Please read them carefully before proceeding.''',
                    screenSize, textScaleFactor),
                SizedBox(height: screenSize.height * 0.03),
                _buildSectionTitle('2. User Agreement', screenSize, textScaleFactor),
                _buildSectionContent(
                    '''When using Veggie Mart, you agree to adhere to all applicable laws and regulations. You must provide accurate and truthful information during registration and agree to maintain the confidentiality of your account credentials.''',
                    screenSize, textScaleFactor),
                SizedBox(height: screenSize.height * 0.03),
                _buildSectionTitle('3. Privacy Policy', screenSize, textScaleFactor),
                _buildSectionContent(
                    '''Your privacy is of utmost importance to us. Our privacy policy explains how we collect, use, and protect your personal information. By using Shop Nest, you consent to our privacy practices as outlined in the policy.''',
                    screenSize, textScaleFactor),
                SizedBox(height: screenSize.height * 0.03),
                _buildSectionTitle('4. Buying and Selling', screenSize, textScaleFactor),
                _buildSectionContent(
                    '''Shop Nest provides a platform for both buyers and sellers to engage in transactions. Sellers are responsible for ensuring that their products comply with all legal requirements and are accurately described. Buyers should review product details carefully before making a purchase.''',
                    screenSize, textScaleFactor),
                SizedBox(height: screenSize.height * 0.03),
                _buildSectionTitle('5. Payments and Refunds', screenSize, textScaleFactor),
                _buildSectionContent(
                    '''Payments are processed securely through our platform. In the event of a dispute, our customer service team will assist in resolving the issue. Refunds are subject to the terms outlined in our refund policy.''',
                    screenSize, textScaleFactor),
                SizedBox(height: screenSize.height * 0.03),
                _buildSectionTitle('6. Limitation of Liability', screenSize, textScaleFactor),
                _buildSectionContent(
                    '''Shop Nest is not liable for any direct, indirect, incidental, or consequential damages arising from the use of our platform. Users assume full responsibility for their interactions and transactions on the app.''',
                    screenSize, textScaleFactor),
                SizedBox(height: screenSize.height * 0.03),
                _buildSectionTitle('7. Modifications to Terms', screenSize, textScaleFactor),
                _buildSectionContent(
                    '''Shop Nest reserves the right to modify these terms and conditions at any time. Users will be notified of any significant changes. Continued use of the platform after modifications constitutes acceptance of the revised terms.''',
                    screenSize, textScaleFactor),
                SizedBox(height: screenSize.height * 0.03),
                _buildSectionTitle('8. Contact Us', screenSize, textScaleFactor),
                _buildSectionContent(
                    '''If you have any questions or concerns about these terms and conditions, please contact us at support@shopnest.com. We are here to assist you.''',
                    screenSize, textScaleFactor),
                SizedBox(height: screenSize.height * 0.04),
                Center(
                  child: Text(
                    'Built with ❤️ by Suchandra and Balaraju',
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontStyle: FontStyle.italic,
                      fontSize: screenSize.width * 0.05,
                      color: Colors.white,
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

  Widget _buildSectionTitle(String title, Size screenSize, double textScaleFactor) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'RobotoSlab',
        fontWeight: FontWeight.bold,
        fontSize: screenSize.width * 0.055,
        color: Colors.orangeAccent,
      ),
    );
  }

  Widget _buildSectionContent(String content, Size screenSize, double textScaleFactor) {
    return Text(
      content,
      style: TextStyle(
        fontSize: screenSize.width * 0.045,
        color: Colors.white70,
        height: 1.5,
      ),
    );
  }
}
