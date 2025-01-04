import io.flutter.plugins.googlemaps.GoogleMapsPlugin

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GoogleMapsPlugin.registerWith(flutterEngine)
    }
}
