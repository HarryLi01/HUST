//
//  Login.swift
//  HUST
//
//  Created by Li Li on 2022/6/9.
//

import SwiftUI
import Alamofire
import Kanna

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    @State private var authenticationCode = ""
    var body: some View {
        
        VStack {
            Text("Welcome to HUST")
            Section {
                TextField(text: $username, prompt: Text("Required")) {
                    Text("Username")
                }
                SecureField(text: $password, prompt: Text("Required")) {
                    Text("Password")
                }
            }
            .frame(width: 300, height: 30, alignment: .center)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)
            Section {
                TextField(text: $authenticationCode, prompt: Text("Required")) {
                    Text("Authenciation code")
                }
                .frame(width: 100, height: 30, alignment: .center)
                .border(.secondary)
            }
            Button(action: getLoginJsp) {
                Text("Login")
            }
        }
        
    }
    
    func getLoginJsp() {
        let request = AF.request("http://jwzx.hrbust.edu.cn/academic/common/security/login.jsp")
        request.response { resp in
            print(resp)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
