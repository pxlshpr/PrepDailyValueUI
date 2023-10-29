import SwiftUI
import PrepDailyValueUI
import PrepShared
import PrepSettings

struct ContentView: View {
    
    @State var settingsStore = SettingsStore.shared
    
    init() {
        SettingsStore.configure(fetchHandler: fetchSettings, saveHandler: saveSettings)
    }
    
    var body: some View {
        MicrosSettings()
            .environment(settingsStore)
    }
}

extension ContentView {
    
    func fetchSettings() async throws -> Settings {
        let url = getDocumentsDirectory().appendingPathComponent("settings.json")
        do {
            let data = try Data(contentsOf: url)
            let settings = try JSONDecoder().decode(Settings.self, from: data)
            return settings
        } catch {
            return .default
        }
    }
    
    func saveSettings(_ settings: Settings) async throws {
        let url = getDocumentsDirectory().appendingPathComponent("settings.json")
        let json = try JSONEncoder().encode(settings)
        try json.write(to: url)
    }
    
    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

#Preview {
    ContentView()
}
