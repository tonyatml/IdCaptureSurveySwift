//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import ScanditIdCapture

class ScanningViewController: UIViewController {

    var context: DataCaptureContext?
    var idCapture: IdCapture?
    var camera: Camera? = Camera.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIdCapture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Switch camera on to start streaming frames
        // Enable IdCapture
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Switch camera off to stop streaming frames
        // Disable IdCapture
        // Reset IdCapture to discard front side captures when using Front & Back mode
        camera?.switch(toDesiredState: .off)
        idCapture?.removeListener(self)
    }

    private func setupIdCapture() {
        // initialize ScanditSDK and IdCapture here
        self.context = DataCaptureContext(licenseKey: "AiSVvSmfDNToP6i7FBgfMIozinACOSIg6R6JddMIozlxY0zN5FgjQI5nQPNkbA2K62PcmFtzIxdRVkrG6le1JTNbKJaaYelEYX8DsSUuK/mZBn0e2HYNEwFQBHU/OcydOyAbCVcCflSwauE9vC9lShI1071ELPPJ9Vuq0OF6QfmaF1zbaACgVBMTNcD/K15CMXQngns0bxBxGxd2wjmaLzY8cEghNvDSeS/Pi41tWd8MHwsNyWc6z90k9d7iGFQZbngtSMNT6vZnR5WATwWf+fMYdEl7AFvbYX0GT1EZyENsQX7QVydXYewV60zkKpQDFgoiWeoiT36aILMD1xjHMgQBNknzfmBRWFX6ywdT31AxahNEfEfL4H9uho6gcOdMqiTKhMd08si4d/f0vmfsQoVgE/aJV9u+/1dcQlpoQTNuSUcmhkvbLhdnfTS3Tf70HE29ae1yToxLSoLcsmtQT8J9GD7MXVUeX1XVAk53FYajXBEtfBQUv+NQOHdvbRhElGkr+QdzzzqKYQDS+0OF+cJJwbKVdlwrZ3K8jPRHy88dVjw8GHvuXhZ0GOUEb5KrZXGwRb97BA6WQux/GyLvX89jbZ7/PQFCkDFelldoRoy+V+xr4Atib6t3tVeeX2ajNn6kmoBKVmLNd7PYYTHUb2xdwfDoXdx8OV8Xr3Nr6YY1WkwAmg4FBwpCUT7LeVh8NlsnzuBexZCkSdOyaivkJABKF9pLUK5Lj2lomDVhWb/AEYysBHnAw4t5spiebe3ZFDoKsZdBomK7Oa8JT1GbwHRCkb5iFo3bQnHkZ0Nn+tZvTdqpYAFo82EGgrp1QFe7/SjyTzxzGKU0IcjgLw0hvHZF6oveLujSxwOfHJJ/ruJaJA4vNUK2xXlBpAy7SEr3ASfAaSYZXnNAN5jm4WKtfB9tnwVvY2Pvc0uIhZREvV+mcgVGfGgaE+hVxeoudVGvAEokkU4o2hA1HEW5qXtWWTgJy2+3VhGnUFF7745pHhynXzhjq3oEKK1ZKT9PYRCkh1xB9sBbKHCJUzP46lbjorpM3dvbSYMQNAbzL0c2pC+fSeTTdHrNLydL+X/YKPGmOnJsC4EiXiKXRJlam2hiUCFWLhPiSIG0el16REl8kMETS+vjEFgvtIdaWOM9T/kZcQpufTtyWS/gRI5SJhO87qhxrQiGVXvM4XBuELxKQPoVRrjwJVnWoBxca0s0NdRxw+X4N4AsN25HOYhG3zJx51FifT061pEVUuYDlIkm9Js566eUzMvGmJBDi/deTwe8+uFENywiqHzapr36+oqaB4pBtqGRDTAaFRdMl5JY8MFaEeldnGf+Bea81FvSrBlkcf24+14l64nKYfdIhJ91wtilvMpYaIvkuZYsrqAEu22lWt647vJ0350qAyiwKwGVM9XuJ1DL+MfWOpEsBKYdw5Q6lu1FTMQ+FDx2sVtgagzrhU+dO2GL/p9uskC6dPtFUnmLdC4nbAxjG9SvbkNBSNOSQwD+7rBErpynY1T2qnsuzu1+WR/gOGg2LFYiU4S+RLyff2oAi+J2mKm8Wir3Ct5/DFJDAlazAD/rd7RDmopoZ2O9ykbtXu8nNX9wL0ko1WQGOD/kBJAL4841HIdLuQQfsih3QzABunai27/dTPi3qKF89WI8fh+3RAYNTwLg1sYKwtt4ETK3fWs8I5SnJIjF9mD1BusYMBixfKKDA6TDgADhEXTYW1tRuo1L9eP2HP2YrpSrZrQ4F/BZYJUvKkBxSGnZ0m4lAEs1l8JVc47CuNVKn69R9nsFjD16HrC/EbyJ4qFUTCXMD/n1l4o0k+6/B65QSkiBOwKPg8wdSffE8pa/nbjOwRtKNmENFFoo/pbM0EC78+kDUYFBrdLp2FtT36lAHPsgSRHi3M1C8oI=")
        
        context?.setFrameSource(camera, completionHandler: nil)

        // Use the recommended camera settings for the IdCapture mode.
        let recommendedCameraSettings = IdCapture.recommendedCameraSettings
        camera?.apply(recommendedCameraSettings)
        
        let idCaptureSettings = IdCaptureSettings()
        idCaptureSettings.supportedDocuments = [.idCardMRZ, .idCardVIZ, .aamvaBarcode]
        
        idCapture = IdCapture(context: context, settings: idCaptureSettings)
        idCapture?.addListener(self)
        
        let captureView = DataCaptureView(context: context, frame: view.bounds)
        captureView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(captureView)
        
        let overlay = IdCaptureOverlay(idCapture: idCapture!, view: captureView)
        camera?.switch(toDesiredState: .on)
    }

    private func openResultViewController() {
        let resultVC = ResultViewController()
        navigationController?.pushViewController(resultVC, animated: true)
    }
}

extension ScanningViewController: IdCaptureListener {
    func idCapture(_ idCapture: IdCapture, didCapture capturedId: CapturedId) {
        // The recognized fields of the captured Id can vary based on the type.
        if capturedId.mrzResult != nil {
            // Handle the information extracted.
            print("mrzResult is \(String(describing: capturedId.mrzResult))")
        } else if capturedId.vizResult != nil {
            // Handle the information extracted.
            print("vizResult is \(String(describing: capturedId.vizResult))")
        }
    }
    
    func idCapture(_ idCapture: IdCapture, didReject capturedId: CapturedId?, reason rejectionReason: RejectionReason) {
        print("error happens on idCapture with \(rejectionReason)")
    }
    
}
