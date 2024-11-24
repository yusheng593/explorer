class PlanetsData {
  final String planetName;
  final String nickname;
  final String imagePath;
  final String temperature;
  final String distanceToEarth;
  final dynamic satellitesSent;
  final String surfaceArea;
  final dynamic rotationPeriod;
  final String averageOrbitalSpeed;

  PlanetsData({
    required this.planetName,
    required this.nickname,
    required this.imagePath,
    required this.temperature,
    required this.distanceToEarth,
    required this.satellitesSent,
    required this.surfaceArea,
    required this.rotationPeriod,
    required this.averageOrbitalSpeed,
  });
}

final List<PlanetsData> planetsData = [
  PlanetsData(
    planetName: '水星',
    nickname: '太陽使者',
    imagePath: 'mercury.png',
    temperature: '167',
    distanceToEarth: '0.00001582 光年',
    satellitesSent: 2,
    surfaceArea: '7.48×10^7 km²',
    rotationPeriod: 58.6,
    averageOrbitalSpeed: '47.87 km/s',
  ),
  PlanetsData(
    planetName: '金星',
    nickname: '愛與美的女神',
    imagePath: 'venus.png',
    temperature: '464',
    distanceToEarth: '0.0001134 光年',
    satellitesSent: 42,
    surfaceArea: '4.60×10^8 km²',
    rotationPeriod: 243,
    averageOrbitalSpeed: '35.02 km/s',
  ),
  PlanetsData(
    planetName: '地球',
    nickname: '我們的家',
    imagePath: 'earth.png',
    temperature: '15',
    distanceToEarth: '0 光年',
    satellitesSent: '許多（超過 2,000 顆活躍衛星）',
    surfaceArea: '5.10×10^8 km²',
    rotationPeriod: 1,
    averageOrbitalSpeed: '29.78 km/s',
  ),
  PlanetsData(
    planetName: '火星',
    nickname: '紅色鄰居',
    imagePath: 'mars.png',
    temperature: '-65',
    distanceToEarth: '0.00022228 光年',
    satellitesSent: 50,
    surfaceArea: '1.45×10^8 km²',
    rotationPeriod: 1.03,
    averageOrbitalSpeed: '24.07 km/s',
  ),
  PlanetsData(
    planetName: '木星',
    nickname: '星際巨人',
    imagePath: 'jupiter.png',
    temperature: '-108',
    distanceToEarth: '0.00008236 光年',
    satellitesSent: 9,
    surfaceArea: '6.22×10^10 km²',
    rotationPeriod: 0.41,
    averageOrbitalSpeed: '13.07 km/s',
  ),
  PlanetsData(
    planetName: '土星',
    nickname: '環狀之星',
    imagePath: 'saturn.png',
    temperature: '-139',
    distanceToEarth: '0.00015056 光年',
    satellitesSent: 4,
    surfaceArea: '4.27×10^10 km²',
    rotationPeriod: 0.45,
    averageOrbitalSpeed: '9.69 km/s',
  ),
  PlanetsData(
    planetName: '天王星',
    nickname: '傾斜之星',
    imagePath: 'uranus.png',
    temperature: '-195',
    distanceToEarth: '0.0002544 光年',
    satellitesSent: 1,
    surfaceArea: '8.13×10^9 km²',
    rotationPeriod: 0.72,
    averageOrbitalSpeed: '6.81 km/s',
  ),
  PlanetsData(
    planetName: '海王星',
    nickname: '深海之星',
    imagePath: 'neptune.png',
    temperature: '-201',
    distanceToEarth: '0.000402 光年',
    satellitesSent: 1,
    surfaceArea: '7.64×10^9 km²',
    rotationPeriod: 0.67,
    averageOrbitalSpeed: '5.43 km/s',
  ),
];
