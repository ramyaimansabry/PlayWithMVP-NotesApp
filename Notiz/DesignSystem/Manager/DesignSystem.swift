
import UIKit


struct DesignSystem {
    
    static var current: ThemeProtocol = LightTheme()
    
    
    static func loadCurrentTheme() {
        if UserDefaults.standard.bool(forKey: Constants.PrivateMessages.currentTheme) == true {
            current = DarkTheme()
        }
        else {
            current = LightTheme()
        }
    }
    
    static func changeThene() {
        if UserDefaults.standard.bool(forKey: Constants.PrivateMessages.currentTheme) == true {
            current = LightTheme()
            UserDefaults.standard.set(false, forKey: Constants.PrivateMessages.currentTheme)
        }
        else {
            current = DarkTheme()
            UserDefaults.standard.set(true, forKey: Constants.PrivateMessages.currentTheme)
        }
    }
}
