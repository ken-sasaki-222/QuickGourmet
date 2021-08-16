//
//  NendBunnerView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/14.
//

import NendAd
import SwiftUI

class NendBannerViewController: UIViewController, NADViewDelegate {
    private var nadView: NADView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNadView()
    }

    deinit {
        nadView?.delegate = nil
        nadView = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nadView?.resume() // 広告のリフレッシュ
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        nadView?.pause() // 広告のリフレッシュを中断
    }

    private func setNadView() {
        nadView = NADView(isAdjustAdSize: true)
        nadView?.setNendID(NEND_INTERSTITIAL_BANNER_SPOTID, apiKey: NEND_INTERSTITIAL_BANNER_AD_APIKEY)
        nadView?.delegate = self
        nadView?.load()
    }

    // ----------NADViewDelegate----------

    // 広告の受信完了
    func nadViewDidFinishLoad(_ adView: NADView!) {
        guard let nadView = nadView else {
            return
        }

        print("nadViewDidFinishLoad", adView as Any)

        adView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nadView)

        // 画面下部に広告を配置
        view.addConstraints([
            NSLayoutConstraint(item: adView!,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .width,
                               multiplier: 1,
                               constant: adView.frame.size.width),
            NSLayoutConstraint(item: adView!,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .height,
                               multiplier: 1,
                               constant: adView.frame.size.height),
            NSLayoutConstraint(item: adView!,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: adView!,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide.bottomAnchor,
                               attribute: .top,
                               multiplier: 1,
                               constant: 0),
        ])
    }

    // 広告タップ
    func nadViewDidClickAd(_ adView: NADView!) {
        print("nadViewDidClickAd", adView as Any)
    }

    // 広告受信失敗
    func nadViewDidFail(toReceiveAd adView: NADView!) {
        let error = adView.error as NSError

        switch error.code {
        case NADViewErrorCode.NADVIEW_AD_SIZE_TOO_LARGE.rawValue:
            // 広告サイズがディスプレイサイズよりも大きい
            break
        case NADViewErrorCode.NADVIEW_INVALID_RESPONSE_TYPE.rawValue:
            // 不明な広告ビュータイプ
            break
        case NADViewErrorCode.NADVIEW_FAILED_AD_REQUEST.rawValue:
            // 広告取得失敗
            break
        case NADViewErrorCode.NADVIEW_FAILED_AD_DOWNLOAD.rawValue:
            // 広告画像の取得失敗
            break
        case NADViewErrorCode.NADVIEW_AD_SIZE_DIFFERENCES.rawValue:
            // リクエストしたサイズと取得したサイズが異なる
            break
        default:
            break
        }

        print("nadViewDidFail.errorCode", error.code)
        print("nadViewDidFail.domain", error.domain)
    }
}
