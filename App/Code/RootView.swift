import SwiftUI

struct RootView: View {
    @State private var notes: [String] = []
    @State private var draft = ""

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                TextField("New note", text: $draft)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("note-input")
                Button("Add") {
                    guard !draft.isEmpty else { return }
                    notes.insert(draft, at: 0)
                    draft = ""
                }
                .accessibilityIdentifier("add-button")
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(notes.enumerated()), id: \.offset) { index, note in
                        Text(note)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .accessibilityIdentifier("note-\(index)")
                    }
                }
            }
            Text(Decimal(string: "12.50")!.formatted(.currency(code: "NZD")))
                .accessibilityIdentifier("price")
        }
        .padding()
    }
}
