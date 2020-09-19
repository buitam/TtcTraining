//
//  ChatContentVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 9/19/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import MessageKit

struct Message: MessageType {
    public var sender: SenderType
    public var messageId: String
    public var sentDate: Date
    public var kind: MessageKind
}
struct Sender: SenderType {
    public var photoURL: String
    public var senderId: String
    public var displayName: String
}

class ChatContentVC: MessagesViewController {

    private var messages = [Message]()
    private let selfSender = Sender(photoURL: "",
                                    senderId: "1",
                                    displayName: "Joe Smith")
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: selfSender,
                                messageId: "1",
                                sentDate: Date(),
                                kind: .text("hello world message")))
        
        messages.append(Message(sender: selfSender,
                                messageId: "1",
                                sentDate: Date(),
                                kind: .text("hello world message,hello world message,hello world message ")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
            

        // Do any additional setup after loading the view.
    }
}

extension ChatContentVC: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
