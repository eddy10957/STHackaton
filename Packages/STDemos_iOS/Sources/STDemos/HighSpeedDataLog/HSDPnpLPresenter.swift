//
//  HSDPnpLPresenter.swift
//
//  Copyright (c) 2022 STMicroelectronics.
//  All rights reserved.
//
//  This software is licensed under terms that can be found in the LICENSE file in
//  the root directory of this software component.
//  If no LICENSE file comes with this software, it is provided AS-IS.
//

import Foundation
import STBlueSDK
import STCore
import STUI
import Toast

final class HSDPnpLPresenter: PnpLPresenter {

    var logControllerResponse: LogControllerResponse?
    let waitingView = HSDWaitingView(text: "Check logging status")

    override func load() {
        waitingView.isVisible = true
        super.load()
        view.view.addSubview(waitingView)
        waitingView.addFitToSuperviewConstraints()
    }

    func logStartStop() {
        guard let logControllerResponse = logControllerResponse else { return }

        if !(logControllerResponse.sdMounted ?? false) {
            view.view.makeToast("Missing SD Card", position: .center)
            return
        }

        if let status = logControllerResponse.status, status {
            stopLog()
        } else {
            setTime()
            startLog()
        }
        
        requestStatusUpdate()
    }

    func startLog() {
//        {"log_controller*start_log":{"interface":0}}
        BlueManager.shared.sendPnpLCommand(PnpLCommand.command(element: "log_controller",
                                                               param: "start_log",
                                                               value: .object(name: "interface",
                                                                              value: AnyEncodable(0))),
                                           to: self.param.node)
    }

    func setTime() {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd_HH_mm_ss"
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        formatter.calendar = Calendar(identifier: .iso8601)
//        {"log_controller*set_time":{"datetime":"20230519_09_33_20"}}
        BlueManager.shared.sendPnpLCommand(PnpLCommand.command(element: "log_controller",
                                                               param: "set_time",
                                                               value: .object(name: "datetime",
                                                                              value: AnyEncodable(formatter.string(from: Date())))),
                                           to: self.param.node)
    }

    func stopLog() {
//        {"log_controller*stop_log":{}}
        BlueManager.shared.sendPnpLCommand(PnpLCommand.emptyCommand(element: "log_controller",
                                                                    param: "stop_log"),
                                           to: self.param.node)
    }

    override func requestStatusUpdate() {
        BlueManager.shared.sendPnpLCommand(PnpLCommand.simpleJson(element: "get_status",
                                                                  value: .plain(value: "log_controller")),
                                           to: self.param.node)
    }

    override func handleUpdate(from feature: PnPLFeature) {
        if feature.sample?.data?.response != nil {
            super.handleUpdate(from: feature)
        } else if let data = feature.sample?.data?.rawData {
            if let logControllerResponse = try? JSONDecoder().decode(LogControllerResponse.self,
                                                                     from: data,
                                                                     keyedBy: "log_controller") {
                self.logControllerResponse = logControllerResponse

                if let status = logControllerResponse.status, !status {
                    waitingView.isVisible = false
                    waitingView.update(text: "Check logging status")
                    view.stTabBarView?.actionButton.setImage(ImageLayout.Common.play?.template, for: .normal)
                    BlueManager.shared.sendPnpLCommand(PnpLCommand.status,
                                                       to: self.param.node)
                } else {
                    waitingView.isVisible = true
                    waitingView.update(text: "Device is logging")
                    waitingView.isUserInteractionEnabled = !waitingView.isHidden
                    view.stTabBarView?.actionButton.setImage(ImageLayout.Common.pause?.template, for: .normal)
                }

            }
        }
    }
}

public struct LogControllerResponse {
    public let status: Bool?
    public let sdMounted: Bool?
    public let controllerType: Int?
    public let cType: Int?

    public init(status: Bool?, sdMounted: Bool?, controllerType: Int?, cType: Int?) {
        self.status = status
        self.sdMounted = sdMounted
        self.controllerType = controllerType
        self.cType = cType
    }
}

extension LogControllerResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case status = "log_status"
        case sdMounted = "sd_mounted"
        case controllerType = "controller_type"
        case cType = "c_type"
    }
}
