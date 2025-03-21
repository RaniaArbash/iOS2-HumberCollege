import SwiftUI
import FirebaseFirestore

struct ChatRoomView: View {
    @EnvironmentObject var authViewModel: AuthViewModel // Use the AuthViewModel
    @State private var newMessage = ""
    @State private var messages = [Message]()

    var body: some View {
        VStack {
            HStack {
                Text("Chat Room")
                    .font(.title)
                    .bold()
                Spacer()
                Button("Logout") {
                    authViewModel.signOut() // Sign out using the AuthViewModel
                }
                .padding()
            }

            List(messages) { message in
                VStack(alignment: .leading) {
                    Text(message.senderName)
                        .font(.headline)
                    Text(message.text)
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }

            HStack {
                TextField("Enter a message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Send") {
                    sendMessage()
                }
                .padding()
            }
        }
        .onAppear {
            loadMessages()
        }
        .padding()
    }

    func loadMessages() {
        Firestore.firestore().collection("messages")
            .order(by: "timestamp")
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching messages: \(error.localizedDescription)")
                    return
                }

                self.messages = snapshot?.documents.compactMap { doc in
                    try? doc.data(as: Message.self)
                } ?? []
            }
    }

    func sendMessage() {
        guard !newMessage.isEmpty else { return }

        let messageData = [
            "text": newMessage,
            "senderId": authViewModel.user?.id ?? "",
            "senderName": authViewModel.user?.name ?? "Anonymous",
            "timestamp": Timestamp(date: Date())
        ] as [String : Any]

        Firestore.firestore().collection("messages").addDocument(data: messageData) { error in
            if let error = error {
                print("Error sending message: \(error.localizedDescription)")
            } else {
                newMessage = ""
            }
        }
    }
}

struct Message: Identifiable, Codable {
    @DocumentID var id: String?
    var text: String
    var senderId: String
    var senderName: String
    var timestamp: Timestamp
}
