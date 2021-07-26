//
//  MockShopData.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/14.
//

import Foundation


// Search API
// https://webservice.recruit.co.jp/hotpepper/gourmet/v1/

let mockShopesData: [HotPepperResponse]
    = [HotPepperResponse(results: Results(shop: [Shop(id: "J001265507",
                                                      name: "焼肉少年團 渋谷店",
                                                      address: "東京都渋谷区渋谷３-18-5佐藤エステートビル新館４F",
                                                      mobileAccess: "渋谷駅ﾊﾁ公口から徒歩5分",
                                                      open: "月～日、祝日、祝前日: 17:00～23:00 （料理L.O. 22:30 ドリンクL.O. 22:30）",
                                                      lat: 35.6610492907,
                                                      lng: 139.6968179396,
                                                      logo_image: "https://imgfp.hotp.jp/IMGH/55/97/P036825597/P036825597_69.jpg",
                                                      budget: Shop.Budget(
                                                        average: "3000円（通常平均）/4000円（飲み放題付き宴会平均）",
                                                        name: "3001～4000円"),
                                                      genre: Shop.Genre(
                                                        catch: "渋谷 -焼肉食べ放題- 黒毛和牛食べ放題95品",
                                                        code: "G008",
                                                        name: "焼肉・ホルモン"),
                                                      photo: Shop.Photo(
                                                        pc: Shop.Photo.Pc(
                                                            l: "https://imgfp.hotp.jp/IMGH/54/14/P037425414/P037425414_238.jpg",
                                                            s: "https://imgfp.hotp.jp/IMGH/54/14/P037425414/P037425414_58_s.jpg")),
                                                      urls: Shop.Urls(pc: "https://www.hotpepper.jp/strJ001265507/?vos=nhppalsa000016"))])),
       
       HotPepperResponse(results: Results(shop: [Shop(id: "J001249388",
                                                      name: "蔵玄 恵比寿",
                                                      address: "東京都渋谷区渋谷３-18-5佐藤エステートビル新館４F",
                                                      mobileAccess: "JR線､東京ﾒﾄﾛ日比谷線【恵比寿駅】徒歩1分",
                                                      open: "月～日、祝日、祝前日: 17:00～23:00 （料理L.O. 22:00 ドリンクL.O. 22:00）",
                                                      lat: 35.6479160886,
                                                      lng: 139.708788282, logo_image: "https://imgfp.hotp.jp/IMGH/55/97/P036825597/P036825597_69.jpg",
                                                      budget: Shop.Budget(
                                                        average: "3,500円(ディナー)★飲み放題付き宴会コースは4,500円～",
                                                        name: "3001～4000円"),
                                                      genre: Shop.Genre(
                                                        catch: "駅近徒歩1分/落ち着いた和食処",
                                                        code: "G001",
                                                        name: "居酒屋"),
                                                      photo: Shop.Photo(
                                                        pc: Shop.Photo.Pc(
                                                            l: "https://imgfp.hotp.jp/IMGH/16/96/P036211696/P036211696_238.jpg",
                                                            s: "https://imgfp.hotp.jp/IMGH/16/96/P036211696/P036211696_58_s.jpg")),
                                                      urls: Shop.Urls(pc: "https://www.hotpepper.jp/strJ001249388/?vos=nhppalsa000016"))])),
       
       HotPepperResponse(results: Results(shop: [Shop(id: "J001041763",
                                                      name: "安安 渋谷宮益坂店",
                                                      address: "東京都渋谷区渋谷３-18-5佐藤エステートビル新館４F",
                                                      mobileAccess: "JR 副都心線 銀座線 渋谷駅 徒歩2分",
                                                      open: "月～木: 11:30～15:0016:00～23:30 （料理L.O. 23:00 ドリンクL.O. 23:00）金、祝前日: 11:30～15:0016:00～翌2:00 （料理L.O. 翌1:30 ドリンクL.O. 翌1:30）土: 11:30～翌2:00 （料理L.O. 翌1:30 ドリンクL.O. 翌1:30）日、祝日: 11:30～23:30 （料理L.O. 23:00 ドリンクL.O. 23:00）",
                                                      lat: 35.6600054248,
                                                      lng: 139.7036860089,
                                                      logo_image: "https://imgfp.hotp.jp/IMGH/55/97/P036825597/P036825597_69.jpg",
                                                      budget: Shop.Budget(
                                                        average: "2200円 　「お通し代」「席代」「入場料」は頂いておりません。",
                                                        name: "2001～3000円"),
                                                      genre: Shop.Genre(
                                                        catch: "本格七輪焼肉　食べ放題　飲み放題",
                                                        code: "G008",
                                                        name: "焼肉・ホルモン"),
                                                      photo: Shop.Photo(
                                                        pc: Shop.Photo.Pc(
                                                            l: "https://imgfp.hotp.jp/IMGH/31/63/P038083163/P038083163_238.jpg",
                                                            s: "https://imgfp.hotp.jp/IMGH/31/63/P038083163/P038083163_58_s.jpg")),
                                                      urls: Shop.Urls(pc: "https://www.hotpepper.jp/strJ001041763/?vos=nhppalsa000016"))])),
       
       HotPepperResponse(results: Results(shop: [Shop(id: "J001265507",
                                                      name: "焼肉少年團 渋谷店",
                                                      address: "東京都渋谷区渋谷３-18-5佐藤エステートビル新館４F",
                                                      mobileAccess: "渋谷駅ﾊﾁ公口から徒歩5分",
                                                      open: "月～日、祝日、祝前日: 17:00～23:00 （料理L.O. 22:30 ドリンクL.O. 22:30）",
                                                      lat: 35.6610492907,
                                                      lng: 139.6968179396,
                                                      logo_image: "https://imgfp.hotp.jp/IMGH/55/97/P036825597/P036825597_69.jpg",
                                                      budget: Shop.Budget(
                                                        average: "3000円（通常平均）/4000円（飲み放題付き宴会平均）",
                                                        name: "3001～4000円"),
                                                      genre: Shop.Genre(
                                                        catch: "渋谷 -焼肉食べ放題- 黒毛和牛食べ放題95品",
                                                        code: "G008",
                                                        name: "焼肉・ホルモン"),
                                                      photo: Shop.Photo(
                                                        pc: Shop.Photo.Pc(
                                                            l: "https://imgfp.hotp.jp/IMGH/54/14/P037425414/P037425414_238.jpg",
                                                            s: "https://imgfp.hotp.jp/IMGH/54/14/P037425414/P037425414_58_s.jpg")),
                                                      urls: Shop.Urls(pc: "https://www.hotpepper.jp/strJ001265507/?vos=nhppalsa000016"))])),
       
       HotPepperResponse(results: Results(shop: [Shop(id: "J001275168",
                                                      name: "肉のち晴れ 渋谷肉横丁",
                                                      address: "東京都渋谷区渋谷３-18-5佐藤エステートビル新館４F",
                                                      mobileAccess: "東京ﾒﾄﾛ,東急渋谷駅3a出口より徒歩3分",
                                                      open: "月～日、祝日、祝前日: 17:00～翌2:00 （料理L.O. 翌1:30 ドリンクL.O. 翌1:45）",
                                                      lat: 35.6610848844,
                                                      lng: 139.6983994704,
                                                      logo_image: "https://imgfp.hotp.jp/IMGH/55/97/P036825597/P036825597_69.jpg",
                                                      budget: Shop.Budget(
                                                        average: "コース平均2980円　/　アラカルト平均3000円　◎食べ放題有り◎",
                                                        name: "2001～3000円"),
                                                      genre: Shop.Genre(
                                                        catch: "黒毛和牛ハンバーグ/肉料理/人気の韓国焼酎",
                                                        code: "G002",
                                                        name: "焼肉・ホルモン"),
                                                      photo: Shop.Photo(
                                                        pc: Shop.Photo.Pc(
                                                            l: "https://imgfp.hotp.jp/IMGH/65/93/P038056593/P038056593_238.jpg",
                                                            s: "https://imgfp.hotp.jp/IMGH/54/14/P037425414/P037425414_58_s.jpg")),
                                                      urls: Shop.Urls(pc: "https://imgfp.hotp.jp/IMGH/65/93/P038056593/P038056593_58_s.jpg"))]))
    ]
