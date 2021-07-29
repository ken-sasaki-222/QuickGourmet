//
//  MailView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/28.
//


import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    @Binding var isShow: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> some UIViewController {
        let userDevice = UIDevice.current
        let deviceModel = userDevice.model
        let iOSVersion = userDevice.systemVersion
        
        let mailVC =  MFMailComposeViewController()
            mailVC.mailComposeDelegate = context.coordinator
            mailVC.setToRecipients(["nkekisasa222@gmail.com"])
            mailVC.setSubject("食いっくグルメ開発者へお問い合わせ")
        mailVC.setMessageBody("▼ 不具合などの連絡はこちら \n \n \n \n ▼ 機能追加依頼はこちら \n \n \n \n ▼ その他ご要望はこちら \n \n \n \n ---以下は削除しないでください--- \n * 端末名: \(userDevice.systemName) \n * 端末モデル: \(deviceModel) \n * iOSバージョン: \(iOSVersion)",isHTML: false)
        
        return mailVC
    }
    
    func makeCoordinator() -> MailView.Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        let parent: MailView
        
        init(parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            switch result {
            case .cancelled:
                print("Email Send Cancelled.")
                break
            case .saved:
                print("Email Saved as a Draft.")
                break
            case .sent:
                print("Email Sent Successfully.")
                break
            case .failed:
                print("Email Send Failed.")
                break
            default:
                break
            }
            self.parent.isShow = false // MailView閉じる
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
