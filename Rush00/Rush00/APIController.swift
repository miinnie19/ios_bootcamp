//
//  APIController.swift
//  Rush00
//
//  Created by Melissa NAIDOO on 2018/10/06.
//  Copyright © 2018 Melissa NAIDOO. All rights reserved.
//

import Foundation

class APIController
{
    let key = "bc9d5ab181916b0b8501e09e4ac8af8e891e56f6709b9200a0dee44808c19b1f"
    let secret = "e6896961d05a66ca5218754ae9a2891ec8479fb9b7e083d46dd6dc307d17b769"
    
    func connection()
    {
        let bearer = ((self.key + ":" + self.secret).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        let url = NSURL(string: "https://api.intra.42.fr/oauth/token")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("Basic " + bearer, forHTTPHeaderField:"Authorization")
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            (data,response,error) in
            print(response ?? "No response")
            if error != nil {
                print (error ?? "No error")
            }
            else if let d = data{
                do{
                    if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        print(dic)
                    }
                }
                catch (let err) {
                    print(err)
                }
            }
        }
        task.resume()
    }
}

