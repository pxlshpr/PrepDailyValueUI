import SwiftUI
import PrepShared
import PrepSettings

struct RDISection: View {
    
    @Environment(RDIPicker.Model.self) var model: RDIPicker.Model
    let rdi: RDI
    
    @State var isSmoker: PickableBool = .notSpecified
    @State var isPregnant: PickableBool = .notSpecified
    @State var isLactating: PickableBool = .notSpecified
    @State var sex: BiometricSex = .notSpecified

    var body: some View {
        Section(footer: selectButton) {
            sourceRow
//            biometricsRow
            valueRow
        }
        .environment(\.openURL, OpenURLAction(handler: handleURL))
    }
    
    //TODO: use this to handle URL https://www.hackingwithswift.com/quick-start/swiftui/how-to-customize-the-way-links-are-opened
    @ViewBuilder
    var footer_: some View {
        if let source = rdi.source, let url = rdi.url {
//                Text("Source: [\(source.abbreviation)] \(url)")
            Text("Source: [\(source.abbreviation)](\(url))")
        }
    }
    
    @ViewBuilder
    var sourceRow: some View {
        if let source = rdi.source, let string = rdi.url {
            HStack {
                Text("Source")
                Spacer()
                Text(source.name)
                    .foregroundStyle(.secondary)
                Link(destination: URL(string: string)!) {
//                        Text(source.name)
                    Image(systemName: "arrow.up.right")
                }
            }
        }
    }
    
    var valueRow: some View {
        HStack {
            Text("Daily Value")
            Spacer()
            
            //TODO: Show one of the following
            /// [ ] Bound Text if fixed bound (use what we have in plan)
            /// [ ] If based on energy, show the % of energy or x amount per y energy unit amount
            /// [ ] If biometrics required, say "requires biometrics"
            HStack {
                Text("Minimum")
                HStack(spacing: 2) {
                    Text("14")
                        .font(.system(.body, design: .monospaced, weight: .semibold))
                    Text("g")
                }
            }
            .foregroundStyle(.secondary)
        }
    }
    
    var requiresBiometricsValueRow: some View {
        HStack {
            Text("Daily Value")
            Spacer()
            
            Text("Requires biometrics")
                .foregroundStyle(.tertiary)
        }
    }
    
    var selectRow: some View {
        Button {
            
        } label: {
            HStack {
                Spacer()
                Text("Use")
                Spacer()
            }
        }
//            .disabled(true)
    }

    //TODO: If there are any requirements, check biometrics for its availability, otherwise showing a button which presents a sheet with the required biometrics inserted in it
    
    var isSmokerRow: some View {
        HStack {
            Text("Smoker")
            Spacer()
            MenuPicker($isSmoker)
        }
    }

    var isPregnantRow: some View {
        HStack {
            Text("Pregnant")
            Spacer()
            MenuPicker($isPregnant)
        }
    }

    var isLactatingRow: some View {
        HStack {
            Text("Lactating")
            Spacer()
            MenuPicker($isLactating)
        }
    }

    var sexRow: some View {
        HStack {
            Text("Biological Sex")
            Spacer()
            MenuPicker($sex)
        }
    }
    
    var ageRow: some View {
        HStack {
            NavigationLink {
                
            } label: {
                HStack {
                    Text("Age")
                    Spacer()
                    Text("Not specified")
                        .foregroundStyle(.tertiary)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
    
    var biometricsRow: some View {
        HStack {
            NavigationLink {
                Text("Biometrics form")
            } label: {
                HStack {
                    Text("Biometrics")
                    Spacer()
                    Text("Incomplete")
                        .foregroundStyle(.tertiary)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
    
    var selectButton: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Text("Selected")
                    .textCase(.none)
            }
//            .buttonStyle(.borderless)
            .buttonStyle(.bordered)
//            .disabled(true)
//                Spacer()
        }
    }
    
    func handleURL(_ url: URL) -> OpenURLAction.Result {
        model.presentedURLString = url.absoluteString
        model.showingWebView = true
        return .handled
    }
}
