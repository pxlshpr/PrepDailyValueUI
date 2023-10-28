import SwiftUI
import PrepShared
import PrepDailyValue

struct MicroSettings: View {
    
    let micro: Micro
    
    @State var isDisplayed: Bool = true
    @State var useDailyValue: Bool = true
    @State var type: DailyValueType = .default

    var body: some View {
        Form {
            Section {
                Toggle(isOn: $isDisplayed, label: {
                    Text("Show")
                })
            }
            useDailyValueSection
//            dailValueSection
        }
        .navigationTitle(micro.name)
    }
    
    @ViewBuilder
    var dailValueSection: some View {
        if useDailyValue {
            Section {
                Text("")
            }
        }
    }
    
    var useDailyValueSection: some View {
        var footer: some View {
            Text("The DV is used as a default when no goal is present.")
        }
        
        var header: some View {
            Text("Daily Value (DV)")
        }

        return Section(header: header, footer: footer) {
            Toggle(isOn: $useDailyValue, label: {
                Text("Use")
            })
            if useDailyValue {
                HStack {
                    Text("Source")
                    Spacer()
                    MenuPicker($type)
                }
                switch type {
                case .preset:
                    NavigationLink {
                        DailyValuePicker(micro: micro)
                    } label: {
                        HStack {
                            Text("Preset")
                            Spacer()
                            Text("Choose")
                        }
                        .foregroundStyle(.tertiary)
                    }
                case .custom:
                    HStack {
                        Text("Minimum")
                        Spacer()
                    }
                    HStack {
                        Text("Maximum")
                        Spacer()
                    }
                }
            }
        }
    }
}
