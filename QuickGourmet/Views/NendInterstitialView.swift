//
//  NendInterstitialView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/11.
//

import NendAd
import SwiftUI

class NendInterstitialView: NSObject, NADInterstitialLoadingDelegate, NADInterstitialClickDelegate {
    override init() {
        super.init()
        NADInterstitial.sharedInstance().loadingDelegate = self
        NADInterstitial.sharedInstance().clickDelegate = self
    }

    deinit {
        NADInterstitial.sharedInstance().delegate = nil
    }

    func showInterstitiaStillessAD() {
        var showResult: NADInterstitialShowResult
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let rootVC = windowScenes?.keyWindow?.rootViewController

        do {
            guard let nendId = try LoadSettingsHelper.getNendInterstitialId() else {
                return
            }
            showResult = NADInterstitial.sharedInstance().showAd(from: rootVC, spotID: nendId)

            switch showResult {
            case .AD_SHOW_SUCCESS:
                print("AD_SHOW_SUCCESS")
            case .AD_LOAD_INCOMPLETE:
                print("AD_LOAD_INCOMPLETE")
            case .AD_REQUEST_INCOMPLETE:
                print("FAILED_AD_REQUEST")
            case .AD_DOWNLOAD_INCOMPLETE:
                print("FAILED_AD_DOWNLOAD")
            case .AD_FREQUENCY_NOT_REACHABLE:
                print("AD_FREQUENCY_NOT_REACHABLE")
            case .AD_SHOW_ALREADY:
                print("AD_SHOW_ALREADY")
            case .AD_CANNOT_DISPLAY:
                print("AD_CANNOT_DISPLAY")
            @unknown default:
                return
            }
        } catch {
            print("Error setup nend ad.")
            print("Error localize message.", error.localizedDescription)
        }
    }

    func didFinishLoadInterstitialAd(withStatus status: NADInterstitialStatusCode) {}

    func didClick(with type: NADInterstitialClickType) {
        switch type {
        case .DOWNLOAD:
            print("DOWNLOAD")
        case .CLOSE:
            print("CLOSE")
        case .INFORMATION:
            print("INFORMATION")
        @unknown default:
            break
        }
    }
}
