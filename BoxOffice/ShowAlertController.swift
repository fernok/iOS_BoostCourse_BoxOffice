//
//  ShowAlertController.swift
//  BoxOffice
//
//  Created by Hyuhng Min Kim on 2020/07/22.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import Foundation
import UIKit

let viewControllers: [UIViewController] = [TableViewController(), CollectionViewController()]

func selectOrderingStyle(controller: UIViewController){
    let alertController: UIAlertController = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: .actionSheet)
    
    let ticketRateAction: UIAlertAction = UIAlertAction(title: "예매율", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction) in requestAllMovies(orderType: 0)
//        controller.navigationController?.navigationBar.topItem?.title = "예매율"
        for viewController in viewControllers {
            viewController.navigationController?.navigationBar.topItem?.title = "예매율"
        }
    })
    let curationAction: UIAlertAction = UIAlertAction(title: "큐레이션", style: .default, handler: {(action: UIAlertAction) in requestAllMovies(orderType: 1)
        controller.navigationController?.navigationBar.topItem?.title = "큐레이션"
    })
    let openingDateAction: UIAlertAction = UIAlertAction(title: "개봉일", style: .default, handler: {(action: UIAlertAction) in requestAllMovies(orderType: 2)
        controller.navigationController?.navigationBar.topItem?.title = "개봉일"
    })
    let cancelAciton: UIAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    
    alertController.addAction(ticketRateAction)
    alertController.addAction(curationAction)
    alertController.addAction(openingDateAction)
    alertController.addAction(cancelAciton)
    
    controller.present(alertController, animated: true, completion: nil)
}
