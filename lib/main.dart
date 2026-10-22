import 'package:flutter/material.dart';

void main() {
  runApp(const PetFinderApp());
}

class PetFinderApp extends StatelessWidget {
  const PetFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetFinder Bogotá Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090D16),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0EA5E9),
          secondary: Color(0xFF10B981),
          surface: Color(0xFF131C2E),
        ),
      ),
      home: const AuthenticationScreen(),
    );
  }
}

// ============================================================================
// MODELOS DE DATOS Y PERFILES
// ============================================================================
class PetProfile {
  final String id;
  final String ownerName;
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
  final String gpsHardwareId;
  final int batteryLevel;
  final String lastSeenZone;
  final String coordsText;
  final double lat;
  final double lng;
  final int mapType; // 0: Zona T/Norte, 1: Chapinero Alto, 2: Parque Simón Bolívar
  final List<Offset> routePoints;

  PetProfile({
    required this.id,
    required this.ownerName,
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
    required this.gpsHardwareId,
    required this.batteryLevel,
    required this.lastSeenZone,
    required this.coordsText,
    required this.lat,
    required this.lng,
    required this.mapType,
    required this.routePoints,
  });
}

final List<PetProfile> samplePets = [
  PetProfile(
    id: 'P001',
    ownerName: 'Junior Rengifo',
    email: 'junior.rengifo@ecci.edu.co',
    phone: '+57 310 987 6543',
    petName: 'Hades',
    petType: 'Canino',
    breed: 'Golden Retriever',
    age: '2 años y 4 meses',
    weight: '28.0 kg',
    color: 'Negro',
    gender: 'Macho',
    isVaccinated: true,
    gpsHardwareId: 'GPS-BOG-9921',
    batteryLevel: 92,
    lastSeenZone: 'Zona T / Zona Rosa (Calle 82 # 11-30)',
    coordsText: '4.6664° N, 74.0531° W',
    lat: 4.6664,
    lng: -74.0531,
    mapType: 0,
    routePoints: const [
      Offset(0.20, 0.25),
      Offset(0.35, 0.28),
      Offset(0.45, 0.50),
      Offset(0.60, 0.52),
      Offset(0.75, 0.70),
    ],
  ),
  PetProfile(
    id: 'P002',
    ownerName: 'Marta Gómez',
    email: 'marta.gomez@petfinder.co',
    phone: '+57 315 222 1100',
    petName: 'Michi',
    petType: 'Felino',
    breed: 'Siamés',
    age: '1 año y 8 meses',
    weight: '4.2 kg',
    color: 'Crema / Puntos Oscuros',
    gender: 'Macho',
    isVaccinated: true,
    gpsHardwareId: 'GPS-BOG-4012',
    batteryLevel: 58,
    lastSeenZone: 'Chapinero Alto (Calle 57 # 4-12)',
    coordsText: '4.6486° N, 74.0628° W',
    lat: 4.6486,
    lng: -74.0628,
    mapType: 1,
    routePoints: const [
      Offset(0.80, 0.15),
      Offset(0.65, 0.30),
      Offset(0.50, 0.45),
      Offset(0.35, 0.70),
    ],
  ),
  PetProfile(
    id: 'P003',
    ownerName: 'Carolina Palacios',
    email: 'carolina.p@petfinder.co',
    phone: '+57 300 444 8899',
    petName: 'Thor',
    petType: 'Canino',
    breed: 'Pastor Alemán',
    age: '3 años',
    weight: '34.0 kg',
    color: 'Negro Fuego',
    gender: 'Macho',
    isVaccinated: false,
    gpsHardwareId: 'GPS-BOG-1189',
    batteryLevel: 18,
    lastSeenZone: 'Parque Simón Bolívar (Av. Cll 63)',
    coordsText: '4.6581° N, 74.0935° W',
    lat: 4.6581,
    lng: -74.0935,
    mapType: 2,
    routePoints: const [
      Offset(0.15, 0.80),
      Offset(0.30, 0.65),
      Offset(0.50, 0.50),
      Offset(0.65, 0.35),
    ],
  ),
];

// ============================================================================
// PANTALLA 1: AUTENTICACIÓN / LOGIN
// ============================================================================
class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  int _selectedUserIdx = 0;
  final TextEditingController _passController = TextEditingController(text: '123456');
  bool _isLoading = false;

  void _login() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainDashboardScreen(selectedPetIndex: _selectedUserIdx),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pet = samplePets[_selectedUserIdx];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F172A), Color(0xFF070A10)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // IsoTipo / Logo
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF0EA5E9).withOpacity(0.15),
                    border: Border.all(color: const Color(0xFF0EA5E9), width: 2),
                  ),
                  child: const Icon(Icons.radar_sharp, size: 52, color: Color(0xFF0EA5E9)),
                ),
                const SizedBox(height: 16),
                const Text(
                  'PetFinder Bogotá',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.5),
                ),
                const Text(
                  'Plataforma IoT de Rastreo Mascota Satelital',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const Spacer(),

                // Selector de Personas / Usuarios
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Seleccionar Perfil de Usuario:', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
                Row(
                  children: List.generate(samplePets.length, (index) {
                    final isSelected = _selectedUserIdx == index;
                    final p = samplePets[index];
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedUserIdx = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF0EA5E9).withOpacity(0.2) : const Color(0xFF131C2E),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? const Color(0xFF0EA5E9) : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: isSelected ? const Color(0xFF0EA5E9) : Colors.grey.shade800,
                                child: Text(p.ownerName[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                p.ownerName.split(' ')[0],
                                style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Text('(${p.petName})', style: const TextStyle(color: Color(0xFF0EA5E9), fontSize: 10)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),

                // Campo Credencial
                TextField(
                  controller: TextEditingController(text: pet.email),
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF0EA5E9)),
                    filled: true,
                    fillColor: const Color(0xFF131C2E),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF0EA5E9)),
                    suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFF131C2E),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 24),

                // Botón Ingreso
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0EA5E9),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: _isLoading
                        ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('INGRESAR AL SISTEMA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
                const Spacer(),
                const Text('Bogotá D.C. • Edición Académica Exposición', style: TextStyle(color: Colors.white30, fontSize: 11)),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// PANTALLA 2: DASHBOARD PRINCIPAL Y NAVEGACIÓN
// ============================================================================
class MainDashboardScreen extends StatefulWidget {
  final int selectedPetIndex;
  const MainDashboardScreen({super.key, required this.selectedPetIndex});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  late int _selectedPetIndex;
  int _currentTab = 0;
  bool _isGpsActive = true;
  bool _isSimulating = false;
  double _animProgress = 1.0;

  @override
  void initState() {
    super.initState();
    _selectedPetIndex = widget.selectedPetIndex;
  }

  @override
  Widget build(BuildContext context) {
    final pet = samplePets[_selectedPetIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF131C2E),
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.location_searching, color: Color(0xFF0EA5E9), size: 22),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PetFinder (${pet.petName})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(pet.ownerName, style: const TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz, color: Color(0xFF0EA5E9)),
            tooltip: 'Cambiar de Perfil',
            onPressed: () {
              setState(() {
                _selectedPetIndex = (_selectedPetIndex + 1) % samplePets.length;
                _animProgress = 1.0;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentTab,
        children: [
          _buildMapTab(pet),
          _buildHealthProfileTab(pet),
          _buildRouteHistoryTab(pet),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (idx) => setState(() => _currentTab = idx),
        backgroundColor: const Color(0xFF131C2E),
        selectedItemColor: const Color(0xFF0EA5E9),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), activeIcon: Icon(Icons.map), label: 'Mapa GPS'),
          BottomNavigationBarItem(icon: Icon(Icons.pets_outlined), activeIcon: Icon(Icons.pets), label: 'Ficha Mascota'),
          BottomNavigationBarItem(icon: Icon(Icons.history), activeIcon: Icon(Icons.manage_history), label: 'Historial'),
        ],
      ),
    );
  }

  // ==========================================================================
  // TAB 1: MAPA GPS CON MAPAS EXCLUSIVOS POR UBICACIÓN
  // ==========================================================================
  Widget _buildMapTab(PetProfile pet) {
    return Column(
      children: [
        // Barra Superior de Telemetría
        Container(
          color: const Color(0xFF1E293B),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isGpsActive ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  pet.lastSeenZone,
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'GPS: ${_isGpsActive ? "ONLINE" : "CORTE"}',
                style: TextStyle(color: _isGpsActive ? Colors.green : Colors.red, fontSize: 11, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Switch(
                value: _isGpsActive,
                activeColor: const Color(0xFF10B981),
                onChanged: (val) => setState(() => _isGpsActive = val),
              ),
            ],
          ),
        ),

        // Lienzo del Mapa Único
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: CustomBogotaMapPainter(
                    mapType: pet.mapType,
                    routePoints: pet.routePoints,
                    isGpsActive: _isGpsActive,
                    progress: _animProgress,
                  ),
                ),
              ),

              // Panel Telemetría Flotante
              Positioned(
                top: 12,
                left: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF090D16).withOpacity(0.85),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _TelemetryMetric(icon: Icons.battery_charging_full, label: 'Batería', value: '${pet.batteryLevel}%', color: pet.batteryLevel > 20 ? Colors.green : Colors.red),
                      _TelemetryMetric(icon: Icons.my_location, label: 'Precisión', value: _isGpsActive ? '± 2.5m' : 'Sin señal', color: const Color(0xFF0EA5E9)),
                      _TelemetryMetric(icon: Icons.thermostat, label: 'Temp. Collar', value: '24 °C', color: Colors.amber),
                    ],
                  ),
                ),
              ),

              // Botón de Animación de Recorrido
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton.extended(
                  backgroundColor: const Color(0xFF0EA5E9),
                  icon: Icon(_isSimulating ? Icons.pause : Icons.play_arrow, color: Colors.white),
                  label: Text(_isSimulating ? 'Pausar' : 'Simular Recorrido', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    setState(() {
                      _isSimulating = !_isSimulating;
                      if (_isSimulating) _startLoop();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _startLoop() async {
    while (_isSimulating) {
      await Future.delayed(const Duration(milliseconds: 80));
      if (!mounted) return;
      setState(() {
        _animProgress += 0.02;
        if (_animProgress > 1.0) _animProgress = 0.1;
      });
    }
  }

  // ==========================================================================
  // TAB 2: FICHA TÉCNICA Y SALUD
  // ==========================================================================
  Widget _buildHealthProfileTab(PetProfile pet) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131C2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: const Color(0xFF0EA5E9).withOpacity(0.2),
                  child: Icon(pet.petType == 'Canino' ? Icons.pets : Icons.catching_pokemon, size: 40, color: const Color(0xFF0EA5E9)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pet.petName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text('${pet.breed} • ${pet.petType}', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(color: const Color(0xFF10B981).withOpacity(0.2), borderRadius: BorderRadius.circular(6)),
                        child: Text('Hardware ID: ${pet.gpsHardwareId}', style: const TextStyle(color: Color(0xFF10B981), fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          const Text('Biometría Registrada', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 2.3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _BiometricItem(label: 'Edad', value: pet.age, icon: Icons.cake),
              _BiometricItem(label: 'Peso Corporal', value: pet.weight, icon: Icons.monitor_weight),
              _BiometricItem(label: 'Color Pelaje', value: pet.color, icon: Icons.palette),
              _BiometricItem(label: 'Sexo', value: pet.gender, icon: Icons.wc),
            ],
          ),
          const SizedBox(height: 18),

          // Tarjeta de Vacunación
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: pet.isVaccinated ? const Color(0xFF10B981).withOpacity(0.12) : Colors.red.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: pet.isVaccinated ? Colors.green : Colors.red),
            ),
            child: Row(
              children: [
                Icon(pet.isVaccinated ? Icons.verified : Icons.warning_amber, color: pet.isVaccinated ? Colors.green : Colors.red, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pet.isVaccinated ? 'Vacunación y Desparasitación AL DÍA' : 'Vacunación PENDIENTE',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        pet.isVaccinated ? 'Carnet digital verificado por clínica veterinaria.' : 'Refuerzo de Rabia y Pentavalente requerido.',
                        style: const TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          const Text('Contacto de Emergencia', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF131C2E), borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(backgroundColor: Color(0xFF0EA5E9), child: Icon(Icons.person, color: Colors.white)),
              title: Text(pet.ownerName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('${pet.phone}\n${pet.email}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
              trailing: IconButton(icon: const Icon(Icons.phone, color: Color(0xFF10B981)), onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  // TAB 3: HISTORIAL DE RUTAS
  // ==========================================================================
  Widget _buildRouteHistoryTab(PetProfile pet) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Puntos de Rastreo Recientes', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _HistoryTile(title: pet.lastSeenZone, coords: pet.coordsText, time: 'Hace 2 minutos', isLive: true),
        const _HistoryTile(title: 'Punto de descanso (Parque Canino)', coords: '4.6640° N, 74.0520° W', time: 'Hoy, 09:15 AM', isLive: false),
        const _HistoryTile(title: 'Salida de residencia', coords: '4.6610° N, 74.0501° W', time: 'Hoy, 08:00 AM', isLive: false),
      ],
    );
  }
}

// ============================================================================
// DIBUJO VECTORIAL DIVERSIFICADO DE MAPAS EN BOGOTÁ
// ============================================================================
class CustomBogotaMapPainter extends CustomPainter {
  final int mapType; // 0: Zona T, 1: Chapinero Alto, 2: Simón Bolívar
  final List<Offset> routePoints;
  final bool isGpsActive;
  final double progress;

  CustomBogotaMapPainter({
    required this.mapType,
    required this.routePoints,
    required this.isGpsActive,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = const Color(0xFF0B111E);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    if (mapType == 0) {
      // ----------------------------------------------------------------------
      // MAPA 0: ZONA T / ZONA ROSA (Cuadrícula Comercial y Avenidas Rectas)
      // ----------------------------------------------------------------------
      final blockPaint = Paint()..color = const Color(0xFF132035);
      for (double x = 15; x < size.width; x += 55) {
        for (double y = 15; y < size.height; y += 65) {
          canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(x, y, 42, 52), const Radius.circular(4)), blockPaint);
        }
      }

      // Cra 11 y Cll 82
      final roadPaint = Paint()
        ..color = const Color(0xFF24344D)
        ..strokeWidth = 14
        ..style = PaintingStyle.stroke;
      canvas.drawLine(Offset(size.width * 0.45, 0), Offset(size.width * 0.45, size.height), roadPaint);
      canvas.drawLine(Offset(0, size.height * 0.5), Offset(size.width, size.height * 0.5), roadPaint);

      // Zona Peatonal T (Verde)
      final zoneTPaint = Paint()..color = const Color(0xFF059669).withOpacity(0.35);
      canvas.drawRect(Rect.fromLTWH(size.width * 0.35, size.height * 0.42, 100, 50), zoneTPaint);

    } else if (mapType == 1) {
      // ----------------------------------------------------------------------
      // MAPA 1: CHAPINERO ALTO (Montaña y Curvas de Nivel Urbano)
      // ----------------------------------------------------------------------
      final hillPaint = Paint()
        ..color = const Color(0xFF064E3B).withOpacity(0.25)
        ..style = PaintingStyle.fill;
      final pathHill = Path();
      pathHill.moveTo(size.width * 0.4, 0);
      pathHill.quadraticBezierTo(size.width * 0.8, size.height * 0.4, size.width, size.height * 0.9);
      pathHill.lineTo(size.width, 0);
      canvas.drawPath(pathHill, hillPaint);

      // Calles con curvas empinadas
      final curveRoadPaint = Paint()
        ..color = const Color(0xFF1E293B)
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke;

      final pathRoad = Path();
      pathRoad.moveTo(0, size.height * 0.2);
      pathRoad.cubicTo(size.width * 0.4, size.height * 0.1, size.width * 0.5, size.height * 0.6, size.width, size.height * 0.8);
      canvas.drawPath(pathRoad, curveRoadPaint);

    } else {
      // ----------------------------------------------------------------------
      // MAPA 2: PARQUE METROPOLITANO SIMÓN BOLÍVAR (Lago Central y Naturaleza)
      // ----------------------------------------------------------------------
      // Fondo de Parque Gigante
      final parkBg = Paint()..color = const Color(0xFF022C22);
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), parkBg);

      // Lago Simón Bolívar (Azul)
      final lakePaint = Paint()..color = const Color(0xFF0284C7).withOpacity(0.6);
      canvas.drawOval(Rect.fromLTWH(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.35), lakePaint);

      // Circuito Perimetral de Trote
      final trackPaint = Paint()
        ..color = const Color(0xFFD97706).withOpacity(0.6)
        ..strokeWidth = 6
        ..style = PaintingStyle.stroke;
      canvas.drawOval(Rect.fromLTWH(size.width * 0.15, size.height * 0.2, size.width * 0.7, size.height * 0.55), trackPaint);
    }

    // ------------------------------------------------------------------------
    // DIBUJO DE LA TRAYECTORIA Y DEL COLLAR GPS
    // ------------------------------------------------------------------------
    if (routePoints.isNotEmpty) {
      final points = routePoints.map((p) => Offset(p.dx * size.width, p.dy * size.height)).toList();

      final routeLine = Path()..moveTo(points.first.dx, points.first.dy);
      for (int i = 1; i < points.length; i++) {
        routeLine.lineTo(points[i].dx, points[i].dy);
      }

      final linePaint = Paint()
        ..color = isGpsActive ? const Color(0xFF0EA5E9) : Colors.redAccent
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke;
      canvas.drawPath(routeLine, linePaint);

      final idx = ((points.length - 1) * progress).clamp(0, points.length - 1).toInt();
      final currentPos = points[idx];

      if (isGpsActive) {
        canvas.drawCircle(currentPos, 20, Paint()..color = const Color(0xFF0EA5E9).withOpacity(0.25));
        canvas.drawCircle(currentPos, 8, Paint()..color = const Color(0xFF0EA5E9));
        canvas.drawCircle(currentPos, 4, Paint()..color = Colors.white);
      } else {
        canvas.drawCircle(currentPos, 12, Paint()..color = Colors.red);
        canvas.drawCircle(currentPos, 5, Paint()..color = Colors.white);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomBogotaMapPainter oldDelegate) => true;
}

// ============================================================================
// COMPONENTES AUXILIARES DE UI
// ============================================================================
class _TelemetryMetric extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _TelemetryMetric({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }
}

class _BiometricItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _BiometricItem({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: const Color(0xFF131C2E), borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0EA5E9), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10)),
                Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final String title;
  final String coords;
  final String time;
  final bool isLive;

  const _HistoryTile({required this.title, required this.coords, required this.time, required this.isLive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF131C2E),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isLive ? const Color(0xFF0EA5E9).withOpacity(0.2) : Colors.white10,
          child: Icon(Icons.location_on, color: isLive ? const Color(0xFF0EA5E9) : Colors.grey),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
        subtitle: Text('$coords • $time', style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ),
    );
  }
}