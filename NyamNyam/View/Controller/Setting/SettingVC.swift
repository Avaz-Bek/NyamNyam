//
//  LogoVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/3/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class SettingVC: UITableViewController {
    
    let mainFoodsName:[[String]]  = [   ["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsAndPromotionsCVC") is NewsAndPromotionsCVC {
                self.performSegue(withIdentifier: "NewsAndPromotionsCVC", sender: nil)
            }
        }else if indexPath.row == 1{
            if let foodsVC = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteDishesCVC") as?  FavoriteDishesCVC {
                foodsVC.imageNameArray = self.mainFoodsName[indexPath.row]
                
                print(mainFoodsName[indexPath.row])
                print(foodsVC.imageNameArray)
                
                self.navigationController?.pushViewController(foodsVC, animated: true)
            }
        }else if indexPath.row == 2{
//            if let foodsVC = self.storyboard?.instantiateViewController(withIdentifier: "ReservationCVC") as?  ReservationCVC {
//                //self.navigationController?.pushViewController(foodsVC, animated: true)
//                //self.present(foodsVC, animated: true, completion: nil)
//                foodsVC.modalTransitionStyle = .flipHorizontal
//                self.present(foodsVC, animated: true, completion: nil)
            
            guard let VC = self.storyboard?.instantiateViewController(withIdentifier: "ReservationCVC") else { return }
            let reservationCVC = UINavigationController(rootViewController: VC)
            self.navigationController?.present(reservationCVC, animated: true, completion: nil)
            
        }else if indexPath.row == 3{
            let activityViewController = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
