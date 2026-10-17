import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const PetFinderApp());
}

class PetFinderApp extends StatelessWidget {
  const PetFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetFinder Bogotá',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D9488),
          primary: const Color(0xFF0D9488),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// ============================================================================
// MODELOS DE DATOS DETALLADOS Y PROFESIONALES
// ============================================================================

class RoutePoint {
  final String title;
  final String time;
  final IconData icon;
  final Color color;

  RoutePoint({required this.title, required this.time, required this.icon, required this.color});
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String petName;
  final String petType;
  final String breed;
  final String age;
  final String weight;
  final String color;
  final String gender;
  final bool isVaccinated;
  final String gpsId;
  final int batteryLevel;
  final double initialLat;
  final double initialLng;
  final String locationName;
  final String distance;
  final String duration;
  final String pointCount;
  final List<RoutePoint> routePoints;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.petName,
    required this.petType,
    required this.breed,
    required this.age,
    required this.weight,
    required this.color,
    required this.gender,
    required this.isVaccinated,
    required this.gpsId,
    required this.batteryLevel,
    required this.initialLat,
    required this.initialLng,
    required this.locationName,
    required this.distance,
    required this.duration,
    required this.pointCount,
    required this.routePoints,
  });
}

// ============================================================================
// PANTALLA 1: LOGIN PROFESIONAL CON CAMPOS LIMPIOS
// ============================================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  final List<UserModel> _demoUsers = [
    UserModel(
      id: 'U1',
      name: 'Junior Rengifo (User Persona)',
      email: 'junior.rengifo@ecci.edu.co',
      phone: '+57 310 555 0192',
      petName: 'Hades',
      petType: 'Canino',
      breed: 'Golden Retriever',
      age: '3 años',
      weight: '28.5 kg',
      color: 'Negro',
      gender: 'Macho (Esterilizado)',
      isVaccinated: true,
      gpsId: 'GPS-BOG-991',
      batteryLevel: 88,
      initialLat: 4.6730,
      initialLng: -74.0535,
      locationName: 'Parque El Virrey, Bogotá D.C.',
      distance: '3.4 km',
      duration: '45 min',
      pointCount: '128',
      routePoints: [
        RoutePoint(title: 'Inicio: Cll 85 # 11-02', time: '08:15 AM', icon: Icons.play_circle_fill, color: Colors.green),
        RoutePoint(title: 'Pausa: Zona Canina El Virrey', time: '08:40 AM (15 min)', icon: Icons.pause_circle_filled, color: Colors.orange),
        RoutePoint(title: 'Fin: Cra 15 # 88-20', time: '09:00 AM', icon: Icons.stop_circle, color: Colors.red),
      ],
    ),
    UserModel(
      id: 'U2',
      name: 'Marta Gómez (U2)',
      email: 'marta.gomez@gmail.com',
      phone: '+57 315 444 8821',
      petName: 'Michi',
      petType: 'Felino',
      breed: 'Siamés Tradicional',
      age: '2 años',
      weight: '4.2 kg',
      color: 'Beige y Marrón Oscuro',
      gender: 'Hembra',
      isVaccinated: true,
      gpsId: 'GPS-BOG-104',
      batteryLevel: 64,
      initialLat: 4.6580,
      initialLng: -74.0930,
      locationName: 'Parque Simón Bolívar, Bogotá D.C.',
      distance: '1.2 km',
      duration: '20 min',
      pointCount: '54',
      routePoints: [
        RoutePoint(title: 'Inicio: Cll 53 # 60-10', time: '03:10 PM', icon: Icons.play_circle_fill, color: Colors.green),
        RoutePoint(title: 'Recorrido Interior Simón Bolívar', time: '03:22 PM', icon: Icons.location_on, color: Colors.blue),
        RoutePoint(title: 'Fin: Entorno Residencial Cll 53', time: '03:30 PM', icon: Icons.stop_circle, color: Colors.red),
      ],
    ),
    UserModel(
      id: 'U3',
      name: 'Carolina Palacios (U3)',
      email: 'carolina.p@gmail.com',
      phone: '+57 300 123 9988',
      petName: 'Rocky',
      petType: 'Canino',
      breed: 'Bulldog Francés',
      age: '4 años',
      weight: '12.0 kg',
      color: 'Atigrado / Negro',
      gender: 'Macho',
      isVaccinated: true,
      gpsId: 'GPS-BOG-402',
      batteryLevel: 92,
      initialLat: 4.6760,
      initialLng: -74.0480,
      locationName: 'Parque de la 93, Bogotá D.C.',
      distance: '5.1 km',
      duration: '1h 10 min',
      pointCount: '210',
      routePoints: [
        RoutePoint(title: 'Inicio: Cll 93 # 13-08', time: '06:30 AM', icon: Icons.play_circle_fill, color: Colors.green),
        RoutePoint(title: 'Pausa: Cafetería Pet Friendly', time: '07:10 AM (20 min)', icon: Icons.pause_circle_filled, color: Colors.orange),
        RoutePoint(title: 'Fin: Cra 11 # 94-02', time: '07:40 AM', icon: Icons.stop_circle, color: Colors.red),
      ],
    ),
  ];

  void _login(UserModel user) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainNavigationScreen(currentUser: user)),
    );
  }

  void _handleManualLogin() {
    if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingresa tu correo y contraseña.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    _login(_demoUsers[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.pets, size: 60, color: Colors.teal.shade700),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PetFinder Bogotá',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
              ),
              const Text(
                'Plataforma de Monitoreo GPS Canino y Felino',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 36),

              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  hintText: 'ejemplo@ecci.edu.co',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: '••••••••',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 2,
                ),
                onPressed: _handleManualLogin,
                child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPetScreen()),
                  );
                },
                child: const Text('Registrar Nueva Mascota / Collar GPS'),
              ),

              const SizedBox(height: 28),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('O ENTRAR COMO JURADO', style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.amber.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.science, color: Colors.amber.shade900, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Usuarios de Validación (Pruebas Fase 3)',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber.shade900, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Haz clic en un usuario para cargar su perfil y GPS único:',
                      style: TextStyle(fontSize: 11, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    ..._demoUsers.map((user) => Card(
                          elevation: 1,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            dense: true,
                            leading: Icon(
                              user.petType == 'Canino' ? Icons.pets : Icons.catching_pokemon,
                              color: Colors.teal.shade700,
                            ),
                            title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                            subtitle: Text('${user.petName} (${user.breed}) • GPS: ${user.gpsId}', style: const TextStyle(fontSize: 11)),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 12),
                            onTap: () => _login(user),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// PANTALLA 2: REGISTRO DE PERFIL Y COLLAR GPS (HU-PET-001)
// ============================================================================

class RegisterPetScreen extends StatefulWidget {
  const RegisterPetScreen({super.key});

  @override
  State<RegisterPetScreen> createState() => _RegisterPetScreenState();
}

class _RegisterPetScreenState extends State<RegisterPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _gpsController = TextEditingController();
  final _petNameController = TextEditingController();
  final _breedController = TextEditingController();
  bool _isGpsValid = false;

  void _validateGpsCode(String value) {
    setState(() {
      _isGpsValid = value.startsWith('GPS-BOG-') && value.length == 11;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Mascota (HU-PET-001)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _petNameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de la Mascota',
                  prefixIcon: Icon(Icons.pets),
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? 'Ingresa el nombre' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _breedController,
                decoration: const InputDecoration(
                  labelText: 'Raza / Especie',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? 'Ingresa la raza' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _gpsController,
                onChanged: _validateGpsCode,
                decoration: InputDecoration(
                  labelText: 'ID del Collar GPS (ej. GPS-BOG-101)',
                  prefixIcon: const Icon(Icons.qr_code_scanner),
                  suffixIcon: Icon(
                    _isGpsValid ? Icons.check_circle : Icons.error,
                    color: _isGpsValid ? Colors.green : Colors.grey,
                  ),
                  border: const OutlineInputBorder(),
                  helperText: 'Formato requerido: GPS-BOG-XXX',
                ),
                validator: (val) => !_isGpsValid ? 'Código GPS inválido o duplicado' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newUser = UserModel(
                      id: 'U99',
                      name: 'Usuario Registrado',
                      email: 'usuario@ejemplo.com',
                      phone: '+57 300 000 0000',
                      petName: _petNameController.text,
                      petType: 'Canino',
                      breed: _breedController.text,
                      age: '1 año',
                      weight: '10.0 kg',
                      color: 'Mixto',
                      gender: 'Macho',
                      isVaccinated: true,
                      gpsId: _gpsController.text,
                      batteryLevel: 100,
                      initialLat: 4.6097,
                      initialLng: -74.0817,
                      locationName: 'Plaza de Bolívar, Bogotá D.C.',
                      distance: '2.0 km',
                      duration: '30 min',
                      pointCount: '80',
                      routePoints: [
                        RoutePoint(title: 'Inicio: Centro Bogotá', time: '10:00 AM', icon: Icons.play_circle_fill, color: Colors.green),
                        RoutePoint(title: 'Fin: Plaza de Bolívar', time: '10:30 AM', icon: Icons.stop_circle, color: Colors.red),
                      ],
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Mascota y collar GPS vinculados exitosamente.')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainNavigationScreen(currentUser: newUser)),
                    );
                  }
                },
                child: const Text('Guardar y Comenzar Rastreo', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// NAVEGACIÓN PRINCIPAL
// ============================================================================

class MainNavigationScreen extends StatefulWidget {
  final UserModel currentUser;

  const MainNavigationScreen({super.key, required this.currentUser});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      TrackingMapScreen(user: widget.currentUser),
      HistoryRouteScreen(user: widget.currentUser),
      UserProfileScreen(user: widget.currentUser),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal.shade700,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), activeIcon: Icon(Icons.map), label: 'Mapa en Vivo'),
          BottomNavigationBarItem(icon: Icon(Icons.route_outlined), activeIcon: Icon(Icons.route), label: 'Historial Rutas'),
          BottomNavigationBarItem(icon: Icon(Icons.pets_outlined), activeIcon: Icon(Icons.pets), label: 'Perfil Mascota'),
        ],
      ),
    );
  }
}

// ============================================================================
// PANTALLA 3: MAPA EN TIEMPO REAL DINÁMICO
// ============================================================================

class TrackingMapScreen extends StatefulWidget {
  final UserModel user;

  const TrackingMapScreen({super.key, required this.user});

  @override
  State<TrackingMapScreen> createState() => _TrackingMapScreenState();
}

class _TrackingMapScreenState extends State<TrackingMapScreen> {
  late double _currentLat;
  late double _currentLng;
  bool _isConnected = true;
  int _lastReportMinutes = 0;
  Timer? _locationTimer;

  @override
  void initState() {
    super.initState();
    _currentLat = widget.user.initialLat;
    _currentLng = widget.user.initialLng;

    _locationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_isConnected) {
        setState(() {
          _currentLat += 0.0001;
          _currentLng += 0.0001;
        });
      }
    });
  }

  @override
  void dispose() {
    _locationTimer?.cancel();
    super.dispose();
  }

  void _toggleSignal() {
    setState(() {
      _isConnected = !_isConnected;
      if (!_isConnected) {
        _lastReportMinutes = 4;
      }
    });
  }

  void _recenterMap() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cámara re-centrada en: ${_currentLat.toStringAsFixed(4)}, ${_currentLng.toStringAsFixed(4)}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoreo: ${widget.user.petName}'),
        actions: [
          IconButton(
            icon: Icon(_isConnected ? Icons.wifi : Icons.wifi_off, color: _isConnected ? Colors.green : Colors.red),
            tooltip: 'Simular Corte de Señal GPS',
            onPressed: _toggleSignal,
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFE2E8F0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
                    ),
                    child: Icon(
                      Icons.pets,
                      size: 52,
                      color: _isConnected ? Colors.teal.shade700 : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    avatar: Icon(Icons.location_on, color: _isConnected ? Colors.teal.shade700 : Colors.red),
                    label: Text(
                      'Lat: ${_currentLat.toStringAsFixed(4)} | Lng: ${_currentLng.toStringAsFixed(4)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.user.locationName,
                    style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: _isConnected ? const Color(0xFF059669) : const Color(0xFFDC2626),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Icon(_isConnected ? Icons.check_circle : Icons.warning_amber_rounded, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _isConnected
                          ? 'Estado: Transmitiendo en Tiempo Real'
                          : 'Sin señal — Último reporte hace $_lastReportMinutes min',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _recenterMap,
        backgroundColor: Colors.teal.shade700,
        icon: const Icon(Icons.my_location, color: Colors.white),
        label: const Text('Re-centrar', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ============================================================================
// PANTALLA 4: HISTORIAL DE RUTAS DINÁMICO
// ============================================================================

class HistoryRouteScreen extends StatefulWidget {
  final UserModel user;

  const HistoryRouteScreen({super.key, required this.user});

  @override
  State<HistoryRouteScreen> createState() => _HistoryRouteScreenState();
}

class _HistoryRouteScreenState extends State<HistoryRouteScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Trayectorias')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.teal.shade700),
                title: Text('Fecha: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                subtitle: const Text('Filtro por Rango Horario: 08:00 AM - 12:00 PM'),
                trailing: const Icon(Icons.edit),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2026, 1),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => _selectedDate = picked);
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Resumen del Recorrido (${widget.user.petName}):',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _MetricTile(label: 'Distancia', value: widget.user.distance, icon: Icons.straighten),
                        _MetricTile(label: 'Tiempo', value: widget.user.duration, icon: Icons.timer),
                        _MetricTile(label: 'Puntos GPS', value: widget.user.pointCount, icon: Icons.pin_drop),
                      ],
                    ),
                    const Divider(height: 32),
                    const Text('Puntos de Referencia Registrados:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.user.routePoints.length,
                        itemBuilder: (context, index) {
                          final point = widget.user.routePoints[index];
                          return ListTile(
                            dense: true,
                            leading: Icon(point.icon, color: point.color),
                            title: Text(point.title),
                            subtitle: Text(point.time),
                          );
                        },
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

class _MetricTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _MetricTile({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal.shade700),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

// ============================================================================
// PANTALLA 5: PERFIL DETALLADO Y PROFESIONAL DE LA MASCOTA
// ============================================================================

class UserProfileScreen extends StatelessWidget {
  final UserModel user;

  const UserProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil Completo del Animal')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 46,
                          backgroundColor: Colors.teal.shade100,
                          child: Icon(
                            user.petType == 'Canino' ? Icons.pets : Icons.catching_pokemon,
                            size: 50,
                            color: Colors.teal.shade800,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                          child: const Icon(Icons.check, size: 16, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user.petName,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                    ),
                    Text(
                      '${user.breed} • ${user.petType}',
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text('Ficha Técnica de la Mascota', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 2.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _InfoCard(label: 'Edad', value: user.age, icon: Icons.cake_outlined),
                  _InfoCard(label: 'Peso', value: user.weight, icon: Icons.scale_outlined),
                  _InfoCard(label: 'Color Pelaje', value: user.color, icon: Icons.palette_outlined),
                  _InfoCard(label: 'Sexo', value: user.gender, icon: Icons.wc),
                ],
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 1,
                color: Colors.green.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.green.shade200),
                ),
                child: ListTile(
                  leading: const Icon(Icons.verified, color: Colors.green),
                  title: const Text('Estado Sanitario', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(user.isVaccinated ? 'Carné de vacunas al día (Rabia y Parvovirus)' : 'Vacunación pendiente'),
                ),
              ),
              const SizedBox(height: 16),

              const Text('Dispositivo de Geolocalización', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 8),
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        leading: Icon(Icons.gps_fixed, color: Colors.teal.shade700),
                        title: const Text('ID de Hardware / Collar'),
                        subtitle: Text(user.gpsId, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Divider(),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          user.batteryLevel > 20 ? Icons.battery_charging_full : Icons.battery_alert,
                          color: user.batteryLevel > 20 ? Colors.green : Colors.red,
                        ),
                        title: const Text('Nivel de Batería del Collar'),
                        subtitle: Text('${user.batteryLevel}% restante'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text('Datos del Propietario / Contacto', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 8),
              Card(
                elevation: 1,
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.person, color: Colors.teal.shade700),
                      title: Text(user.name),
                      subtitle: const Text('Propietario Responsable'),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.phone, color: Colors.teal.shade700),
                      title: Text(user.phone),
                      subtitle: const Text('Contacto de Emergencia'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(48),
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar Sesión'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoCard({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.teal.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                Text(
                  value,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}