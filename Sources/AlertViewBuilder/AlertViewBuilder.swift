import UIKit

public enum AlertComponent {
    case title(String)
    case message(String)
    case action(UIAlertAction)
    case none
    case full(title: String?, message: String?, actions: [UIAlertAction])
}

@_functionBuilder
public struct AlertViewBuilder {
    static func buildBlock(_ children: AlertComponent...) -> AlertComponent {
        children.last { component in
            switch component {
            case .full:
                return true
            default:
                return false
            }
            } ?? {
                var title: String? = nil
                var message: String? = nil
                var actions = [UIAlertAction]()
                children.forEach { component in
                    switch component {
                    case .title(let titleComponent):
                        title = titleComponent
                    case .action(let action):
                        actions.append(action)
                    case .message(let messageComponent):
                        message = messageComponent
                    default:
                        break
                    }
                }
                return .full(title: title, message: message, actions: actions)
            }()
    }

    static func buildIf(_ component: AlertComponent?) -> AlertComponent {
        return component ?? .none
    }

    static func buildEither(first component: AlertComponent) -> AlertComponent {
        return component
    }

    static func buildEither(second component: AlertComponent) -> AlertComponent {
        return component
    }
}

public extension UIAlertController {
    static func makeAlert(@AlertViewBuilder builder: () -> AlertComponent) -> UIAlertController {
        let alertController = UIAlertController()
        switch builder() {
        case let .full(title, message, actions):
            alertController.title = title
            alertController.message = message
            actions.forEach(alertController.addAction)
        default:
            break
        }
        return alertController
    }
}
