//
//  ViewController.swift
//  Map_View
//
//  Created by D7703_18 on 2018. 6. 11..
//  Copyright © 2018년 201550057. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var annotations=[MKPointAnnotation]()
    @IBOutlet weak var myMapView: MKMapView!
    var foodStoreTel = ["051-863-6997",
                        "051-852-9969",
                        "051-852-9969",
                        "051-852-9969",
                        "051-852-9969",
                        "051-853-0410"]
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //번개반점 35.167809, 129.070534,
        //부산광역시 부산진구 양정동 418-282
        
        //동의과학대학교 35.166581, 129.072115
        //동의과학대학교
        let center = CLLocationCoordinate2D(latitude: 35.166581 , longitude: 129.072115)
        //번개반점
        //         let loc01 = CLLocationCoordinate2D(latitude: 35.167809, longitude: 129.070534)
        //반경 zoom in, out
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        //region 객체(center, spam)
        let region = MKCoordinateRegion(center: center, span: span)
        
        myMapView.setRegion(region, animated: true)
        // anno
        
        
        //        let pin01 = MKPointAnnotation()
        //        pin01.coordinate = loc01
        //        pin01.title = "번개반점"
        //        pin01.subtitle = "부산광역시 부산진구 양정동 418-282"
        //
        //        myMapView.addAnnotation(pin01)
        //
        let pin02 = MKPointAnnotation()
        pin02.coordinate = center
        pin02.title = "동의과학대학교"
        pin02.subtitle = "부산광역시 부산진구 양정동 양지로 54"
        myMapView.addAnnotation(pin02)
        
        //        let addr = "부산광역시 부산진구 양정1동 358-1"
        //        let geocoder = CLGeocoder()
        //        geocoder.geocodeAddressString(addr){
        //            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
        //            if let error = error {
        //                print(error)
        //                return
        //            }else {
        //                print("nil 발생")
        //            }
        //            if let placemarks = placemarks {
        //                let placemark = placemarks[0]
        //                print(placemark.location!)
        //                print(placemark.name!)
        //                print(placemark.country!)
        //                let loc02 = placemark.location?.coordinate
        //                let pin03 = MKPointAnnotation()
        //                pin03.coordinate = loc02!
        //                pin03.title = "토마토 도시락"
        //                pin03.subtitle = addr
        //                self.myMapView.addAnnotation(pin03)
        //            }else{
        //            print("nil 발생")
        //            }
        //        }
        //
        //    }
        let foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점","동의과학대학교"]
        let foodStoreAddress = ["부산광역시 부산진구 양정1동 350-1",
                                "부산광역시 부산진구 양정동 418-282",
                                "부산광역시 부산진구 양정동 393-18",
                                "부산광역시 부산진구 양정1동 356-22",
                                "부산광역시 부산진구 양정1동 350-1",
                                "부산광역시 부산진구 양정동 353-38",
                                "부산광역시 부산진구 양정동 429-19"]
        for addr in foodStoreAddress {
            
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(addr) {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let myError = error {
                    print(myError)
                    return
                }
//                let myPlacemark = placemarks![0]
//                //                print(myPlacemark.location?.coordinate)
//
//                let loc = myPlacemark.location?.coordinate
//                let pin = MKPointAnnotation()
//                pin.coordinate = loc!
//                pin.title = self.foodStoreNames[self.count]
//                pin.subtitle = self.foodStoreTel[self.count]
//                self.myMapView.addAnnotation(pin)
//                self.count = self.count + 1
                
                if let myPlacemarks=placemarks{
                    let myPlacemark=myPlacemarks[0]
                    let loc=myPlacemark.location?.coordinate
                    
                    let anno=MKPointAnnotation()
                    anno.coordinate=loc!
                    anno.title = foodStoreNames[self.count]
                    self.count = self.count+1
                    anno.subtitle=addr
                    //self.myMapView.addAnnotation(anno)
                    self.annotations.append(anno)
                    self.myMapView.addAnnotations(self.annotations)
                    
                    //여러개의 pin을 지도에 꽉채움
                    self.myMapView.showAnnotations(self.annotations, animated: true)
                }else{
                    print("nil 발생")
                }
                
            }
        }
        
    }
    }

    




