import SwiftUI
import PrepShared

public struct MicrosSettings: View {
    
    public init() {
        
    }
    
    public var body: some View {
        NavigationStack {
            Form {
                ForEach(MicroGroup.allCases, id: \.self) { group in
                    Section(group.name) {
                        ForEach(group.micros, id: \.self) { micro in
                            NavigationLink {
                                MicroSettings(micro: micro)
                            } label: {
                                Text(micro.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Micronutrients")
        }
    }
}
