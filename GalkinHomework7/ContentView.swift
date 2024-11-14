//
//  ContentView.swift
//  GalkinHomework7
//
//  Created by GALKIN Aleksandr on 14.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var multipeerManager = MultipeerManager()
    @State private var messageText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Введите сообщение", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Отправить сообщение") {
                    multipeerManager.sendMessage(messageText)
                    messageText = ""
                }
                .padding()
                .disabled(messageText.isEmpty)

                Text("Подключенные устройства:")
                    .font(.headline)
                    .padding(.top)

                List(multipeerManager.connectedPeers, id: \ .self) { peer in
                    Text(peer.displayName)
                }

                Text("Полученные сообщения:")
                    .font(.headline)
                    .padding(.top)

                List(multipeerManager.receivedMessages, id: \ .self) { message in
                    Text(message)
                }

                Spacer()
            }
            .navigationTitle("Обмен текстом")
            .padding()
        }
    }
}


