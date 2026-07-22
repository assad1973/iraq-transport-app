import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نقل العراق',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),
      home: const LoginPage(),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 🇮🇶 صفحة تسجيل الدخول - بتصميم جديد!
// ═══════════════════════════════════════════════════════════════
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade800,
              Colors.green.shade600,
              Colors.teal.shade700,
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // أيقونة متحركة
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 800),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: Container(
                              padding: const EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.95),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  Text('🇮🇶', style: TextStyle(fontSize: 50)),
                                  Icon(Icons.local_shipping, size: 50, color: Colors.green),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'نقل العراق',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'اطلب شاحنتك بكل سهولة',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      const SizedBox(height: 40),
                      // حقل البريد
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'البريد الإلكتروني أو رقم الهاتف',
                            prefixIcon: const Icon(Icons.email, color: Colors.green),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // حقل كلمة المرور
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'كلمة المرور',
                            prefixIcon: const Icon(Icons.lock, color: Colors.green),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      // زر تسجيل الدخول
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.9, end: 1),
                        duration: const Duration(milliseconds: 300),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, Colors.green.shade100],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const HomePage()),
                                    );
                                  },
                                  child: const Center(
                                    child: Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      // زر إنشاء حساب
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text(
                          'إنشاء حساب جديد',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 📝 صفحة إنشاء حساب - بتصميم جديد!
// ═══════════════════════════════════════════════════════════════
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green.shade700, Colors.teal.shade800],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'انضم لعائلة نقل العراق',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField('الاسم الكامل', Icons.person),
                  const SizedBox(height: 15),
                  _buildTextField('رقم الهاتف', Icons.phone, keyboardType: TextInputType.phone),
                  const SizedBox(height: 15),
                  _buildTextField('البريد الإلكتروني', Icons.email),
                  const SizedBox(height: 15),
                  _buildTextField('كلمة المرور', Icons.lock, obscureText: true),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'إنشاء الحساب',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {TextInputType? keyboardType, bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
      ),
    );
  }
}
// ═══════════════════════════════════════════════════════════════
// 🚛 الصفحة الرئيسية - بتصميم جديد وشريط سفلي!
// ═══════════════════════════════════════════════════════════════
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;

  final List<Widget> _pages = [
    const _HomeContent(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0 ? Colors.green.withOpacity(0.1) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.home),
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 1 ? Colors.red.withOpacity(0.1) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    const Icon(Icons.notifications),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: const Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              label: 'الإشعارات',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 2 ? Colors.deepPurple.withOpacity(0.1) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person),
              ),
              label: 'ملفي',
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 🏠 محتوى الصفحة الرئيسية (داخل HomePage)
// ═══════════════════════════════════════════════════════════════
class _HomeContent extends StatefulWidget {
  const _HomeContent();

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'اطلب نقل',
      'icon': Icons.add,
      'color': Colors.green,
      'page': const OrderPage(),
      'gradient': [Colors.green.shade400, Colors.green.shade700],
    },
    {
      'title': 'سجل الطلبات',
      'icon': Icons.history,
      'color': Colors.orange,
      'page': const OrdersHistoryPage(),
      'gradient': [Colors.orange.shade400, Colors.orange.shade700],
    },
    {
      'title': 'الخريطة',
      'icon': Icons.map,
      'color': Colors.purple,
      'page': const MapPage(),
      'gradient': [Colors.purple.shade400, Colors.purple.shade700],
    },
    {
      'title': 'تقييم السائق',
      'icon': Icons.star,
      'color': Colors.amber,
      'page': const RatingPage(),
      'gradient': [Colors.amber.shade400, Colors.amber.shade700],
    },
    {
      'title': 'تتبع الشاحنة',
      'icon': Icons.location_on,
      'color': Colors.teal,
      'page': const TrackingPage(),
      'gradient': [Colors.teal.shade400, Colors.teal.shade700],
    },
    {
      'title': 'الدفع',
      'icon': Icons.payment,
      'color': Colors.indigo,
      'page': const PaymentPage(),
      'gradient': [Colors.indigo.shade400, Colors.indigo.shade700],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: CustomScrollView(
        slivers: [
          // AppBar متدرج
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('🇮🇶 ', style: TextStyle(fontSize: 20)),
                  Text('نقل العراق'),
                ],
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade700,
                      Colors.teal.shade600,
                      Colors.green.shade900,
                    ],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_shipping, size: 60, color: Colors.white70),
                      SizedBox(height: 10),
                      Text(
                        'اطلب شاحنتك بكل سهولة',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
          // المحتوى
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = menuItems[index];
                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 400 + (index * 100)),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => item['page'] as Widget),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: item['gradient'] as List<Color>,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: (item['color'] as Color).withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                item['icon'] as IconData,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item['title'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: menuItems.length,
              ),
            ),
          ),
          // قسم الإحصائيات
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade700],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'إحصائياتك',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStat('١٢', 'طلب', Icons.local_shipping),
                        _buildStat('٤.٥', 'تقييم', Icons.star),
                        _buildStat('٥٠٠K', 'رصيد', Icons.account_balance_wallet),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
// ═══════════════════════════════════════════════════════════════
// 📋 صفحة الطلب - بتصميم جديد وأنيميشن
// ═══════════════════════════════════════════════════════════════
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {
  String fromLocation = '';
  String toLocation = '';
  String weight = '';
  String truckType = 'صغيرة';
  double price = 0;

  final List<String> truckTypes = ['صغيرة', 'متوسطة', 'كبيرة', 'تريلة'];
  final List<String> iraqiCities = [
    'بغداد', 'البصرة', 'أربيل', 'الموصل', 'النجف',
    'كربلاء', 'السليمانية', 'دهوك', 'كركوك', 'الرمادي',
    'الحلة', 'الكوت', 'العمارة', 'الناصرية', 'سامراء',
  ];

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void calculatePrice() {
    double basePrice = 50000;
    if (truckType == 'صغيرة') basePrice = 50000;
    if (truckType == 'متوسطة') basePrice = 100000;
    if (truckType == 'كبيرة') basePrice = 200000;
    if (truckType == 'تريلة') basePrice = 400000;
    setState(() => price = basePrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('🇮🇶 اطلب نقل'),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green.shade600, Colors.green.shade900],
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.local_shipping, size: 60, color: Colors.green),
                    const SizedBox(height: 20),
                    _buildCard(
                      child: DropdownButtonFormField<String>(
                        value: fromLocation.isEmpty ? null : fromLocation,
                        decoration: const InputDecoration(
                          labelText: 'من (محافظة الاستلام)',
                          prefixIcon: Icon(Icons.location_on, color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        hint: const Text('اختر المحافظة'),
                        items: iraqiCities.map((String city) => DropdownMenuItem<String>(value: city, child: Text(city))).toList(),
                        onChanged: (String? newValue) => setState(() => fromLocation = newValue!),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildCard(
                      child: DropdownButtonFormField<String>(
                        value: toLocation.isEmpty ? null : toLocation,
                        decoration: const InputDecoration(
                          labelText: 'إلى (محافظة التوصيل)',
                          prefixIcon: Icon(Icons.location_on, color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        hint: const Text('اختر المحافظة'),
                        items: iraqiCities.map((String city) => DropdownMenuItem<String>(value: city, child: Text(city))).toList(),
                        onChanged: (String? newValue) => setState(() => toLocation = newValue!),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildCard(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'وزن الشحنة (كجم)',
                          prefixIcon: Icon(Icons.scale, color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) => setState(() => weight = value),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildCard(
                      child: DropdownButtonFormField<String>(
                        value: truckType,
                        decoration: const InputDecoration(
                          labelText: 'نوع الشاحنة',
                          prefixIcon: Icon(Icons.local_shipping, color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        items: truckTypes.map((String type) => DropdownMenuItem<String>(value: type, child: Text(type))).toList(),
                        onChanged: (String? newValue) => setState(() => truckType = newValue!),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade700],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: calculatePrice,
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calculate, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'احسب السعر',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: price > 0
                              ? [Colors.green.shade400, Colors.green.shade600]
                              : [Colors.grey.shade300, Colors.grey.shade400],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: price > 0
                            ? [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: const Offset(0, 8),
                                ),
                              ]
                            : [],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'السعر التقريبي',
                            style: TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${price.toStringAsFixed(0)} د.ع',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green.shade400, Colors.green.shade700],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            if (fromLocation.isNotEmpty && toLocation.isNotEmpty) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  title: const Row(
                                    children: [
                                      Icon(Icons.check_circle, color: Colors.green),
                                      SizedBox(width: 10),
                                      Text('تم تأكيد الطلب'),
                                    ],
                                  ),
                                  content: const Text('سيتم التواصل معك على الرقم العراقي قريباً\n📞 +964'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('موافق'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_circle, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'تأكيد الطلب',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 📊 صفحة سجل الطلبات - بتصميم جديد
// ═══════════════════════════════════════════════════════════════
class OrdersHistoryPage extends StatelessWidget {
  const OrdersHistoryPage({super.key});

  final List<Map<String, dynamic>> orders = const [
    {
      'id': '#١',
      'from': 'بغداد',
      'to': 'البصرة',
      'truck': 'كبيرة',
      'price': '٢٠٠,٠٠٠',
      'status': 'تم التوصيل',
      'statusColor': Colors.green,
      'icon': Icons.check_circle,
      'gradient': [Colors.green, Colors.teal],
    },
    {
      'id': '#٢',
      'from': 'أربيل',
      'to': 'الموصل',
      'truck': 'تريلة',
      'price': '٤٠٠,٠٠٠',
      'status': 'قيد التوصيل',
      'statusColor': Colors.orange,
      'icon': Icons.local_shipping,
      'gradient': [Colors.orange, Colors.deepOrange],
    },
    {
      'id': '#٣',
      'from': 'النجف',
      'to': 'كربلاء',
      'truck': 'صغيرة',
      'price': '٥٠,٠٠٠',
      'status': 'بالانتظار',
      'statusColor': Colors.grey,
      'icon': Icons.access_time,
      'gradient': [Colors.grey, Colors.blueGrey],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('📋 سجل الطلبات'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade600, Colors.orange.shade900],
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final order = orders[index];
                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 400 + (index * 100)),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 50 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: (order['gradient'] as List<Color>),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: (order['statusColor'] as Color).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  order['id'] as String,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(order['icon'] as IconData, size: 16, color: Colors.white),
                                      const SizedBox(width: 5),
                                      Text(
                                        order['status'] as String,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 25, color: Colors.white24),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.white70, size: 20),
                                const SizedBox(width: 5),
                                Text(
                                  '${order['from']} → ${order['to']}',
                                  style: const TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.local_shipping, color: Colors.white70, size: 20),
                                const SizedBox(width: 5),
                                Text(
                                  'شاحنة ${order['truck']}',
                                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${order['price']} د.ع',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: orders.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 🗺️ صفحة الخريطة - بتصميم جديد
// ═══════════════════════════════════════════════════════════════
class MapPage extends StatelessWidget {
  const MapPage({super.key});

  final List<Map<String, dynamic>> cities = const [
    {
      'name': 'بغداد',
      'trucks': [
        {'type': 'كبيرة', 'status': 'متاحة', 'location': 'المنصور'},
        {'type': 'صغيرة', 'status': 'بالطريق', 'location': 'الكرادة'},
        {'type': 'تريلة', 'status': 'متاحة', 'location': 'الدورة'},
      ]
    },
    {
      'name': 'البصرة',
      'trucks': [
        {'type': 'متوسطة', 'status': 'متاحة', 'location': 'الجبيلة'},
        {'type': 'كبيرة', 'status': 'بالطريق', 'location': 'العشار'},
      ]
    },
    {
      'name': 'أربيل',
      'trucks': [
        {'type': 'صغيرة', 'status': 'متاحة', 'location': 'المدينة'},
        {'type': 'كبيرة', 'status': 'متاحة', 'location': 'السامي'},
        {'type': 'تريلة', 'status': 'بالصيانة', 'location': 'الكرخ'},
      ]
    },
    {
      'name': 'الموصل',
      'trucks': [
        {'type': 'متوسطة', 'status': 'متاحة', 'location': 'الرابية'},
        {'type': 'كبيرة', 'status': 'بالطريق', 'location': 'الجماسة'},
      ]
    },
    {
      'name': 'النجف',
      'trucks': [
        {'type': 'صغيرة', 'status': 'متاحة', 'location': 'الحرية'},
      ]
    },
    {
      'name': 'كربلاء',
      'trucks': [
        {'type': 'كبيرة', 'status': 'متاحة', 'location': 'الحسين'},
        {'type': 'تريلة', 'status': 'متاحة', 'location': 'العلقم'},
      ]
    },
    {
      'name': 'السليمانية',
      'trucks': [
        {'type': 'صغيرة', 'status': 'متاحة', 'location': 'السارية'},
      ]
    },
    {
      'name': 'دهوك',
      'trucks': [
        {'type': 'متوسطة', 'status': 'متاحة', 'location': 'الزاخو'},
      ]
    },
    {
      'name': 'كركوك',
      'trucks': [
        {'type': 'كبيرة', 'status': 'بالطريق', 'location': 'الدبس'},
        {'type': 'صغيرة', 'status': 'متاحة', 'location': 'الطاس'},
      ]
    },
    {
      'name': 'الرمادي',
      'trucks': [
        {'type': 'تريلة', 'status': 'متاحة', 'location': 'الحبانية'},
      ]
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'متاحة':
        return Colors.green;
      case 'بالطريق':
        return Colors.orange;
      case 'بالصيانة':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('🗺️ خريطة العراق'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade600, Colors.purple.shade900],
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final city = cities[index];
                  final trucks = city['trucks'] as List<dynamic>;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ExpansionTile(
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.purple.shade400, Colors.purple.shade700],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.location_city, color: Colors.white, size: 20),
                      ),
                      title: Text(
                        city['name'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${trucks.length} شاحنة',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: trucks.map((truck) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      _getStatusColor(truck['status'] as String).withOpacity(0.1),
                                      _getStatusColor(truck['status'] as String).withOpacity(0.05),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: _getStatusColor(truck['status'] as String).withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(truck['status'] as String).withOpacity(0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.local_shipping,
                                        color: _getStatusColor(truck['status'] as String),
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'شاحنة ${truck['type']}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'الموقع: ${truck['location']}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            _getStatusColor(truck['status'] as String),
                                            _getStatusColor(truck['status'] as String).withOpacity(0.7),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        truck['status'] as String,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: cities.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ═══════════════════════════════════════════════════════════════
// ⭐ صفحة تقييم السائق - بتصميم جديد
// ═══════════════════════════════════════════════════════════════
class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> with SingleTickerProviderStateMixin {
  double rating = 0;
  final TextEditingController commentController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> drivers = const [
    {
      'name': 'أحمد علي',
      'truck': 'كبيرة',
      'from': 'بغداد',
      'to': 'البصرة',
      'image': '👨‍✈️',
      'rating': 4.5,
      'gradient': [Colors.blue, Colors.indigo],
    },
    {
      'name': 'محمد حسين',
      'truck': 'تريلة',
      'from': 'أربيل',
      'to': 'الموصل',
      'image': '👨‍✈️',
      'rating': 4.0,
      'gradient': [Colors.orange, Colors.deepOrange],
    },
    {
      'name': 'علي كريم',
      'truck': 'صغيرة',
      'from': 'النجف',
      'to': 'كربلاء',
      'image': '👨‍✈️',
      'rating': 5.0,
      'gradient': [Colors.green, Colors.teal],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('⭐ تقييم السائق'),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.amber.shade600, Colors.orange.shade900],
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final driver = drivers[index];
                    return TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(milliseconds: 400 + (index * 100)),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: 0.9 + (0.1 * value),
                          child: Opacity(
                            opacity: value,
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: (driver['gradient'] as List<Color>),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: (driver['gradient'] as List<Color>)[0].withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      driver['image'] as String,
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          driver['name'] as String,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '🚛 شاحنة ${driver['truck']}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        Text(
                                          '${driver['from']} → ${driver['to']}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 20),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${driver['rating']}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 25, color: Colors.white24),
                              const Text(
                                'قيّم السائق:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (starIndex) {
                                  return TweenAnimationBuilder(
                                    tween: Tween<double>(begin: 0, end: 1),
                                    duration: Duration(milliseconds: 200 + (starIndex * 100)),
                                    builder: (context, value, child) {
                                      return Transform.scale(
                                        scale: value,
                                        child: child,
                                      );
                                    },
                                    child: IconButton(
                                      icon: Icon(
                                        starIndex < rating ? Icons.star : Icons.star_border,
                                        color: Colors.amber,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          rating = starIndex + 1;
                                        });
                                      },
                                    ),
                                  );
                                }),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextField(
                                  controller: commentController,
                                  decoration: InputDecoration(
                                    hintText: 'اكتب تعليقك هنا...',
                                    prefixIcon: const Icon(Icons.comment, color: Colors.amber),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    onTap: () {
                                      if (rating > 0) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            title: const Row(
                                              children: [
                                                Icon(Icons.check_circle, color: Colors.green),
                                                SizedBox(width: 10),
                                                Text('تم إرسال التقييم'),
                                              ],
                                            ),
                                            content: Text(
                                              'شكراً لتقييمك!\n\nالتقييم: ${rating.toStringAsFixed(0)} نجوم\nالتعليق: ${commentController.text.isEmpty ? 'بدون تعليق' : commentController.text}',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    rating = 0;
                                                    commentController.clear();
                                                  });
                                                },
                                                child: const Text('موافق'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.send, color: Colors.amber),
                                          SizedBox(width: 10),
                                          Text(
                                            'إرسال التقييم',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: drivers.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 📍 صفحة تتبع الشاحنة - بتصميم جديد وأنيميشن
// ═══════════════════════════════════════════════════════════════
class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> shipments = const [
    {
      'id': '#IRQ-2024-001',
      'from': 'بغداد',
      'to': 'البصرة',
      'currentLocation': 'الكوت',
      'driver': 'أحمد علي',
      'truckType': 'كبيرة',
      'status': 'بالطريق',
      'progress': 0.6,
      'eta': '٢ ساعة',
      'phone': '+964 770 123 4567',
      'lastUpdate': 'منذ ٥ دقائق',
      'gradient': [Colors.orange, Colors.deepOrange],
    },
    {
      'id': '#IRQ-2024-002',
      'from': 'أربيل',
      'to': 'الموصل',
      'currentLocation': 'دهوك',
      'driver': 'محمد حسين',
      'truckType': 'تريلة',
      'status': 'تم الاستلام',
      'progress': 0.3,
      'eta': '٤ ساعات',
      'phone': '+964 771 234 5678',
      'lastUpdate': 'منذ ١٥ دقيقة',
      'gradient': [Colors.blue, Colors.indigo],
    },
    {
      'id': '#IRQ-2024-003',
      'from': 'النجف',
      'to': 'كربلاء',
      'currentLocation': 'الحلة',
      'driver': 'علي كريم',
      'truckType': 'صغيرة',
      'status': 'وصلت',
      'progress': 1.0,
      'eta': 'وصلت!',
      'phone': '+964 772 345 6789',
      'lastUpdate': 'منذ دقيقة',
      'gradient': [Colors.green, Colors.teal],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'تم الاستلام':
        return Colors.blue;
      case 'بالطريق':
        return Colors.orange;
      case 'وصلت':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'تم الاستلام':
        return Icons.inventory;
      case 'بالطريق':
        return Icons.local_shipping;
      case 'وصلت':
        return Icons.check_circle;
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('📍 تتبع الشحنة'),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade600, Colors.teal.shade900],
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final shipment = shipments[index];
                    return TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(milliseconds: 400 + (index * 150)),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 30 * (1 - value)),
                          child: Opacity(
                            opacity: value,
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: (shipment['gradient'] as List<Color>),
                          ),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: (shipment['gradient'] as List<Color>)[0].withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    shipment['id'] as String,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          _getStatusIcon(shipment['status'] as String),
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          shipment['status'] as String,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // المسار
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.location_on, color: Colors.white, size: 20),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('من', style: TextStyle(fontSize: 12, color: Colors.white70)),
                                              Text(
                                                shipment['from'] as String,
                                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Icon(Icons.arrow_forward, color: Colors.white70),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text('إلى', style: TextStyle(fontSize: 12, color: Colors.white70)),
                                              Text(
                                                shipment['to'] as String,
                                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.location_on, color: Colors.white, size: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    // شريط التقدم المتحرك
                                    TweenAnimationBuilder(
                                      tween: Tween<double>(begin: 0, end: shipment['progress'] as double),
                                      duration: const Duration(milliseconds: 1500),
                                      builder: (context, value, child) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: LinearProgressIndicator(
                                            value: value,
                                            backgroundColor: Colors.white.withOpacity(0.2),
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.9)),
                                            minHeight: 12,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'تم الاستلام',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: (shipment['progress'] as double) >= 0.1 ? Colors.white : Colors.white54,
                                          ),
                                        ),
                                        Text(
                                          'بالطريق',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: (shipment['progress'] as double) >= 0.5 ? Colors.white : Colors.white54,
                                          ),
                                        ),
                                        Text(
                                          'وصلت',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: (shipment['progress'] as double) >= 1.0 ? Colors.white : Colors.white54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              // معلومات الشاحنة
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.local_shipping, color: Colors.white, size: 30),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '🚛 الشاحنة الآن في:',
                                                style: TextStyle(fontSize: 14, color: Colors.white70),
                                              ),
                                              Text(
                                                shipment['currentLocation'] as String,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(height: 20, color: Colors.white24),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        _buildInfoColumn(Icons.access_time, 'الوصول المتوقع', shipment['eta'] as String),
                                        _buildInfoColumn(Icons.person, 'السائق', shipment['driver'] as String),
                                        _buildInfoColumn(Icons.local_shipping, 'نوع الشاحنة', shipment['truckType'] as String),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Icon(Icons.update, size: 16, color: Colors.white70),
                                  const SizedBox(width: 5),
                                  Text(
                                    'آخر تحديث: ${shipment['lastUpdate']}',
                                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: const Row(
                                            children: [
                                              Icon(Icons.phone, color: Colors.green),
                                              SizedBox(width: 10),
                                              Text('اتصال بالسائق'),
                                            ],
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('السائق: ${shipment['driver']}'),
                                              const SizedBox(height: 10),
                                              Text(
                                                shipment['phone'] as String,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text('إغلاق'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.phone, color: Colors.green),
                                          SizedBox(width: 10),
                                          Text(
                                            'اتصل بالسائق',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: shipments.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 24),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.white70),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}// ═══════════════════════════════════════════════════════════════
// 💳 صفحة الدفع - بتصميم جديد
// ═══════════════════════════════════════════════════════════════
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with SingleTickerProviderStateMixin {
  String selectedMethod = '';
  final TextEditingController amountController = TextEditingController(text: '200000');
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'name': 'ZainCash',
      'icon': Icons.phone_android,
      'color': Colors.green,
      'description': 'الدفع عبر محفظة زين كاش',
      'gradient': [Colors.green.shade400, Colors.green.shade700],
    },
    {
      'name': 'AsiaHawala',
      'icon': Icons.account_balance_wallet,
      'color': Colors.orange,
      'description': 'الدفع عبر آسيا حوالة',
      'gradient': [Colors.orange.shade400, Colors.orange.shade700],
    },
    {
      'name': 'بطاقة ائتمان',
      'icon': Icons.credit_card,
      'color': Colors.blue,
      'description': 'Visa / MasterCard',
      'gradient': [Colors.blue.shade400, Colors.blue.shade700],
    },
    {
      'name': 'دفع كاش',
      'icon': Icons.money,
      'color': Colors.brown,
      'description': 'ادفع للسائق لما يوصل',
      'gradient': [Colors.brown.shade400, Colors.brown.shade700],
    },
  ];

  final List<Map<String, dynamic>> pendingOrders = const [
    {
      'id': '#IRQ-2024-001',
      'from': 'بغداد',
      'to': 'البصرة',
      'amount': '٢٠٠,٠٠٠',
      'status': 'بانتظار الدفع',
      'gradient': [Colors.indigo, Colors.purple],
    },
    {
      'id': '#IRQ-2024-004',
      'from': 'الموصل',
      'to': 'أربيل',
      'amount': '١٥٠,٠٠٠',
      'status': 'بانتظار الدفع',
      'gradient': [Colors.purple, Colors.deepPurple],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('💳 الدفع'),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo.shade600, Colors.indigo.shade900],
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'طلبات بانتظار الدفع',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    ...pendingOrders.map((order) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: (order['gradient'] as List<Color>),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: (order['gradient'] as List<Color>)[0].withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    order['id'] as String,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      order['status'] as String,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, color: Colors.white70, size: 18),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${order['from']} → ${order['to']}',
                                    style: const TextStyle(fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${order['amount']} د.ع',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.payment, size: 16, color: Colors.indigo),
                                        SizedBox(width: 5),
                                        Text(
                                          'ادفع الآن',
                                          style: TextStyle(
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    const Divider(height: 30),
                    const Text(
                      'اختر طريقة الدفع',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: amountController,
                        decoration: InputDecoration(
                          labelText: 'المبلغ (د.ع)',
                          prefixIcon: const Icon(Icons.attach_money, color: Colors.indigo),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...paymentMethods.map((method) {
                      final isSelected = selectedMethod == method['name'];
                      return TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.95, end: 1),
                        duration: const Duration(milliseconds: 200),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: isSelected ? value : 1,
                            child: child,
                          );
                        },
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMethod = method['name'] as String;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? LinearGradient(colors: (method['gradient'] as List<Color>))
                                  : null,
                              color: isSelected ? null : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: isSelected
                                      ? (method['color'] as Color).withOpacity(0.3)
                                      : Colors.black.withOpacity(0.05),
                                  blurRadius: isSelected ? 15 : 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              border: isSelected
                                  ? null
                                  : Border.all(color: Colors.grey.shade200),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: (method['gradient'] as List<Color>),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      method['icon'] as IconData,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          method['name'] as String,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: isSelected ? Colors.white : Colors.black87,
                                          ),
                                        ),
                                        Text(
                                          method['description'] as String,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: isSelected ? Colors.white70 : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isSelected)
                                    const Icon(Icons.check_circle, color: Colors.white, size: 28)
                                  else
                                    const Icon(Icons.radio_button_unchecked, color: Colors.grey, size: 28),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: selectedMethod.isEmpty
                            ? null
                            : LinearGradient(
                                colors: [Colors.indigo.shade400, Colors.indigo.shade700],
                              ),
                        color: selectedMethod.isEmpty ? Colors.grey.shade300 : null,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: selectedMethod.isEmpty
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.indigo.withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: selectedMethod.isEmpty
                              ? null
                              : () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      title: const Row(
                                        children: [
                                          Icon(Icons.check_circle, color: Colors.green, size: 30),
                                          SizedBox(width: 10),
                                          Text('تم الدفع بنجاح!'),
                                        ],
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('طريقة الدفع: $selectedMethod'),
                                          const SizedBox(height: 10),
                                          Text('المبلغ: ${amountController.text} د.ع'),
                                          const SizedBox(height: 10),
                                          if (selectedMethod == 'دفع كاش')
                                            const Text(
                                              '💵 راح تدفع للسائق لما يوصل الشحنة',
                                              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                                            )
                                          else
                                            const Text(
                                              '✅ تم خصم المبلغ من حسابك',
                                              style: TextStyle(color: Colors.green),
                                            ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              selectedMethod = '';
                                            });
                                          },
                                          child: const Text('موافق', style: TextStyle(fontSize: 16)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.lock, size: 24, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'تأكيد الدفع',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.withOpacity(0.3)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.security, color: Colors.green),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'الدفع مؤمن 100%. معلوماتك البنكية محمية.',
                              style: TextStyle(fontSize: 13, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 🔔 صفحة الإشعارات - بتصميم جديد
// ═══════════════════════════════════════════════════════════════
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'تم تأكيد طلبك',
      'message': 'طلب #IRQ-2024-001 تم تأكيده. السائق أحمد علي في الطريق.',
      'time': 'منذ ٥ دقائق',
      'icon': Icons.check_circle,
      'color': Colors.green,
      'gradient': [Colors.green.shade400, Colors.teal.shade600],
      'read': false,
    },
    {
      'title': 'الشحنة بالطريق',
      'message': 'شحنتك من بغداد إلى البصرة الآن في الكوت.',
      'time': 'منذ ٣٠ دقيقة',
      'icon': Icons.local_shipping,
      'color': Colors.orange,
      'gradient': [Colors.orange.shade400, Colors.deepOrange.shade600],
      'read': false,
    },
    {
      'title': 'تم الدفع بنجاح',
      'message': 'تم خصم ٢٠٠,٠٠٠ د.ع من حسابك ZainCash.',
      'time': 'منذ ساعة',
      'icon': Icons.payment,
      'color': Colors.blue,
      'gradient': [Colors.blue.shade400, Colors.indigo.shade600],
      'read': true,
    },
    {
      'title': 'تقييم جديد',
      'message': 'قيم السائق محمد حسين لرحلتك الأخيرة.',
      'time': 'منذ يوم',
      'icon': Icons.star,
      'color': Colors.amber,
      'gradient': [Colors.amber.shade400, Colors.orange.shade600],
      'read': true,
    },
    {
      'title': 'عرض خاص!',
      'message': 'خصم ٢٠% على النقل بين بغداد والبصرة هذا الأسبوع.',
      'time': 'منذ يومين',
      'icon': Icons.local_offer,
      'color': Colors.red,
      'gradient': [Colors.red.shade400, Colors.pink.shade600],
      'read': true,
    },
  ];

  int get unreadCount => notifications.where((n) => !(n['read'] as bool)).length;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('🔔 الإشعارات'),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red.shade600, Colors.red.shade900],
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                if (unreadCount > 0)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        for (var n in notifications) {
                          n['read'] = true;
                        }
                      });
                    },
                    child: const Text('قراءة الكل', style: TextStyle(color: Colors.white)),
                  ),
              ],
            ),
            notifications.isEmpty
                ? SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.notifications_off, size: 80, color: Colors.grey),
                          const SizedBox(height: 20),
                          const Text('لا توجد إشعارات', style: TextStyle(fontSize: 20, color: Colors.grey)),
                        ],
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.all(15),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final notification = notifications[index];
                          final isRead = notification['read'] as bool;
                          return TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 1),
                            duration: Duration(milliseconds: 400 + (index * 100)),
                            builder: (context, value, child) {
                              return Transform.translate(
                                offset: Offset(50 * (1 - value), 0),
                                child: Opacity(
                                  opacity: value,
                                  child: child,
                                ),
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  notification['read'] = true;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  gradient: isRead
                                      ? null
                                      : LinearGradient(
                                          colors: (notification['gradient'] as List<Color>),
                                        ),
                                  color: isRead ? Colors.white : null,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: isRead
                                          ? Colors.black.withOpacity(0.05)
                                          : (notification['color'] as Color).withOpacity(0.2),
                                      blurRadius: isRead ? 10 : 15,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: (notification['gradient'] as List<Color>),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          notification['icon'] as IconData,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    notification['title'] as String,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                                                      color: isRead ? Colors.black87 : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                if (!isRead)
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              notification['message'] as String,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: isRead ? Colors.grey : Colors.white70,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  size: 14,
                                                  color: isRead ? Colors.grey : Colors.white70,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  notification['time'] as String,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: isRead ? Colors.grey : Colors.white70,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: notifications.length,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 👤 صفحة الملف الشخصي - بتصميم جديد واحترافي
// ═══════════════════════════════════════════════════════════════
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController(text: 'أحمد علي');
  final TextEditingController phoneController = TextEditingController(text: '+964 770 123 4567');
  final TextEditingController emailController = TextEditingController(text: 'ahmed@email.com');
  bool isEditing = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'طلباتي',
      'subtitle': '١٢ طلب',
      'icon': Icons.local_shipping,
      'gradient': [Colors.green.shade400, Colors.green.shade700],
    },
    {
      'title': 'تقييماتي',
      'subtitle': '٤.٥ نجوم',
      'icon': Icons.star,
      'gradient': [Colors.amber.shade400, Colors.amber.shade700],
    },
    {
      'title': 'رصيدي',
      'subtitle': '٥٠٠,٠٠٠ د.ع',
      'icon': Icons.account_balance_wallet,
      'gradient': [Colors.blue.shade400, Colors.blue.shade700],
    },
    {
      'title': 'الدعم الفني',
      'subtitle': 'تواصل معنا',
      'icon': Icons.support_agent,
      'gradient': [Colors.purple.shade400, Colors.purple.shade700],
    },
    {
      'title': 'عن التطبيق',
      'subtitle': 'الإصدار ١.٠',
      'icon': Icons.info,
      'gradient': [Colors.teal.shade400, Colors.teal.shade700],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 280,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.deepPurple.shade700,
                        Colors.purple.shade600,
                        Colors.deepPurple.shade900,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.3), width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      isEditing
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: TextField(
                                controller: nameController,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            )
                          : Text(
                              nameController.text,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                      const SizedBox(height: 5),
                      isEditing
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 80),
                              child: TextField(
                                controller: phoneController,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            )
                          : Text(
                              phoneController.text,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(isEditing ? Icons.check : Icons.edit, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    // إحصائيات سريعة
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple.shade400, Colors.purple.shade700],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStat('١٢', 'طلب', Icons.local_shipping, Colors.green),
                          _buildStat('٤.٥', 'تقييم', Icons.star, Colors.amber),
                          _buildStat('٥٠٠K', 'رصيد', Icons.account_balance_wallet, Colors.blue),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // قائمة الخيارات
                    ...menuItems.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: (item['gradient'] as List<Color>),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item['icon'] as IconData,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            item['title'] as String,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item['subtitle'] as String),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                          onTap: () {},
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
                    // زر تسجيل الخروج
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red.shade400, Colors.red.shade700],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                title: const Text('تسجيل الخروج'),
                                content: const Text('هل أنت متأكد من تسجيل الخروج؟'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('إلغاء'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginPage()),
                                      );
                                    },
                                    child: const Text('تأكيد', style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'تسجيل الخروج',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
      ],
    );
  }
}