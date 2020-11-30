//
//  DeviceInfo.swift
//  ApiCashMarket
//
//  Created by BigPapa on 2020/11/24.
//  Copyright © 2020 7Starwin. All rights reserved.
//

import Foundation
import DeviceKit
import CoreTelephony
import TakeTPhoneInfo

public struct DeviceInfo {
    public typealias Kit = Device
    public typealias LFP = LFPhoneInfo
    
    static let emptyDisplayString = ""
    static let emptyDispalyInt = 0
    
    /// 屏幕大小
    public static var inchSize: Double {
        return Device.current.diagonal
    }
    
    /// 获取当前设备的具体型号字符串 e.g. @"iPhone X" @"iPhone XS" @"iPhone XS Max
    public static var deviceName: String? {
        return Device.current.model
    }
    
    /// 当前设备用户设置的名称，设置->通用->关于本机->名称 e.g. "My iPhone" 如 "xxx 的 iPhone"
    public static var deviceSettingName: String? {
        return Device.current.name
    }
    
    /// 系统类型 + 版本号, 如 "iOS 13.1"
    public static var systemWithVersion: String {
        return "\(Device.current.systemName ?? "not current") \(Device.current.systemVersion ?? "not current")"
    }
    
    public static var battery: Int? {
        return Device.current.batteryLevel
    }
    
    /// 屏幕逻辑尺寸 e.g. 逻辑像素尺寸为 2208x1242（屏幕实际物理像素尺寸是 1920x1080）
    public static var deviceLogicalScreenSize: CGSize {
        //        return LFPhoneInfo.deviceLogicalScreenSize
        let size = UIScreen.main.bounds.size
        let width = size.width
        let height = size.height
        let scale = UIScreen.main.scale
        return .init(width: width * scale, height: height * scale)
    }
    
    /// 当前设备总内存 byte
    public static var deviceTotalMemory: UInt64 {
        return ProcessInfo.processInfo.physicalMemory
    }
    
    public static var isSimulator: Bool {
        return Device.current.isSimulator
    }
    
    public static var deviceTypeString: String {
        return LFPhoneInfo.deviceTypeString
    }
    /// 当前 App 占用的设备内存，返回值为兆 MB, e.g. 占用 43 MB
    public static var appTakeUpMemory: CGFloat {
        return LFPhoneInfo.appTakeUpMemory
    }
    public static var appTakeUpMemoryByte: Int64 {
        return LFPhoneInfo.appTakeUpMemoryByte
    }
    /// 当前磁盘总空间，返回值为兆 MB，0为异常 e.g. 总共 16 GB 即 16384 MB
    public static var deviceTotalDisk: Int? {
        return Device.volumeTotalCapacity
    }
    public static var deviceTotalDiskByte: Int64 {
        return LFPhoneInfo.deviceTotalDiskByte
    }
    /// 当前磁盘未使用，返回值为兆 MB，0为异常 e.g. 空闲 2200 MB
    public static var deviceFreeDisk: CGFloat {
        return LFPhoneInfo.deviceFreeDisk
    }
    public static var deviceFreeDiskByte: Int64 {
        return LFPhoneInfo.deviceFreeDiskByte
    }
    /// 当前磁盘已经使用，返回值为兆 MB，0为异常 e.g. 已使用 2200 MB
    public static var deviceUsedDisk: CGFloat {
        return LFPhoneInfo.deviceUsedDisk
    }
    
    /// 通过系统框架获取设备运营商，未安装 SIM 时返回值大概率为 nil，也可能为其他值
    /// e.g. @"中国移动" @"中国联通" @"中国电信" nil
    public static var deviceCarrierName: String? {
        if LFPhoneInfo.deviceCarrierList.isEmpty {
            return nil
        }
        return LFPhoneInfo.deviceCarrierList.joined(separator: ",")
    }
    public static var deviceCarrierContryCode: String? {
        if LFPhoneInfo.deviceCarrierContryCodes.isEmpty {
            return nil
        }
        return LFPhoneInfo.deviceCarrierContryCodes.joined(separator: ",")
    }
    public static var dnsInfo: String {
        
        return LFPhoneInfo.dnsInfo
    }
    /// 当前设备的 CPU 数量
    public static var deviceCPUNum: NSInteger {
        return LFPhoneInfo.deviceCPUNum
    }
    /// 当前设备的 CPU 类型枚举
    public static var deviceCPUType: String {
        return LFPhoneInfo.cpuTypeString
    }
    /// 当前设备网络状态 e.g. @"WiFi" @"无服务" @"2G" @"3G" @"4G" @"LTE" @"WWAN"
    public static var deviceNetType: String {
        return LFPhoneInfo.deviceNetType
    }
    /// 当前设备局域网 ip 地址
    public static var deviceLANIp: String {
        return LFPhoneInfo.deviceLANIp
    }
    /// 当前 APP 最近的一次更新时间(或安装时间) e.g. @"2019-06-01 12:32:38 +0000"
    public static var appUpdateDate: Date {
        return LFPhoneInfo.appUpdateDate
    }
    /// 当前设备是否越狱, YES 是已经越狱，NO 为未越狱
    public static var deviceIsJailbreak: Bool {
        return LFPhoneInfo.deviceIsJailbreak
    }
    /// 当前设备是否使用网络代理, YES 是使用，NO 为未使用
    public static var deviceIsUseProxy: Bool {
        return LFPhoneInfo.deviceIsUseProxy
    }
    
    public static func allValueMap(emptyString: String? = nil,
                                   emptyNumber: Int? = nil) -> [String: Any] {
        return [
            // check if it work
            "LFPhoneInfo.systemVersion": "version from LFPhoneInfo: \(LFP.deviceSystemVersion)",
            "DeviceKit.current.systemVersion": "version from DeviceKit: \(Kit.current.systemVersion ?? "null")",
            "DeviceKit.": "identifier of DeviceKit: \(Kit.identifier)",
            "inchSize": inchSize,
            "deviceName": deviceName ?? "",
            "deviceSettingName": deviceSettingName
                ?? emptyString
                ?? emptyDisplayString,
            "systemWithVersion": systemWithVersion,
            "battery": battery
                ?? emptyNumber
                ?? emptyDispalyInt,
            "deviceLogicalScreenSize": deviceLogicalScreenSize,
            "deviceTotalMemory": deviceTotalMemory,
            "isSimulator": isSimulator,
            "deviceTypeString": deviceTypeString,
            "appTakeUpMemory": appTakeUpMemory,
            "appTakeUpMemoryByte": appTakeUpMemoryByte,
            "deviceTotalDisk": deviceTotalDisk
                ?? emptyString
                ?? emptyDisplayString,
            "deviceTotalDiskByte": deviceTotalDiskByte,
            "deviceFreeDisk": deviceFreeDisk,
            "deviceFreeDiskByte": deviceFreeDiskByte,
            "deviceUsedDisk": deviceUsedDisk,
            "deviceCarrierName": deviceCarrierName
                ?? emptyString
                ?? emptyDisplayString,
            "deviceCarrierContryCode": deviceCarrierContryCode
                ?? emptyString
                ?? emptyDisplayString,
            "dnsInfo": dnsInfo,
            "deviceCPUNum": deviceCPUNum,
            "deviceCPUType": deviceCPUType,
            "deviceNetType": deviceNetType,
            "deviceLANIp": deviceLANIp,
            "appUpdateDate": appUpdateDate,
            "deviceIsJailbreak": deviceIsJailbreak,
            "deviceIsUseProxy": deviceIsUseProxy,
        ]
    }
}

extension Device.Orientation {
    var name: String {
        switch self {
        case .landscape: return "landscape"
        case .portrait: return "portrait"
        }
    }
}

extension Device.CameraType {
    var string: String {
        switch self {
        case .wide: return "wide"
        case .telephoto: return "telephoto"
        case .ultraWide: return "ultraWide"
        case .normal: return "wide"
        }
    }
}

extension LFPhoneInfo {
    
    static var cpuTypeString: String {
        switch LFPhoneInfo.deviceCPUType {
        case .ARM: return "ARM"
        case .ARM64: return "ARM64"
        case .unkown: return "unkown"
        case .X86: return "X86"
        case .X86_64: return "X86_64"
        @unknown default:
            return "unkown"
        }
    }
    
    static var deviceTypeString: String {
        switch deviceType {
        case .unkown:        return "unkown"
        case .iPhone:         return "iPhone"
        case .iPad:           return "iPad"
        case .iPod:           return "iPod"
        case .iPhoneSimulator:return "iPhoneSimulator"
        case .iPadSimulator: return "iPadSimulator"
        @unknown default:
            return "unkown"
        }
    }
}
