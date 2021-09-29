//
//  ErrorValue.swift
//  ErrorValue
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/17/21.
//

import Foundation

protocol ErrorValue: Decodable {
    var errorMessage: String { get }
}

struct ErrorResponse: ErrorValue {
    struct Datum: Decodable {
        let messages: [Message]
    }

    struct Message: Decodable {
        let id, message: String
    }
    
    let statusCode: Int
    let error: String
    let message, data: [Datum]
    
    var errorMessage: String {
        return self.message.first?.messages.first?.message ?? ""
    }
    
    init(messageText: String) {
        self.statusCode = 0
        self.error = ""
        self.message = [Datum(messages: [Message(id: "", message: messageText)])]
        self.data = [Datum(messages: [Message(id: "", message: messageText)])]
    }
}
