import Foundation

class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    var description: String {
        diagram(for: self)
    }
    
    func diagram(for node: BinaryNode?,
                 _ top: String = "",
                 _ root: String = "",
                 _ bottom: String = "") -> String {
        
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│")
        + root + "\(node.value)\n"
        + diagram(for: node.leftChild, bottom + "│", bottom + "└──", bottom + " ")
    }
}

let binaryTree: BinaryNode<String> = {
    let nsObject = BinaryNode(value: "NSObject")
    let barItem = BinaryNode(value: "UIBarItem")
    let barButtonItem = BinaryNode(value: "UIBarButtonItem")
    let tabBarItem = BinaryNode(value: "UITabBarItem")
    let responder = BinaryNode(value: "UIResponder")
    let view = BinaryNode(value: "UIView")
    let viewController = BinaryNode(value: "UIViewController")
    let control = BinaryNode(value: "UIControl")
    let button = BinaryNode(value: "UIButton")
    let textField = BinaryNode(value: "UITextField")
    let tabBarController = BinaryNode(value: "UITabBarController")
    let navigationController = BinaryNode(value: "UINavigationController")
    let imagePickerController = BinaryNode(value: "UIImagePickerController")
    let videoEditorController = BinaryNode(value: "UIVideoEditorController")
    let scrollView = BinaryNode(value: "UIScrollView")
    let tableView = BinaryNode(value: "UITableView")
    let textView = BinaryNode(value: "UITextView")
    
    nsObject.leftChild = barItem
    nsObject.rightChild = responder
    barItem.leftChild = barButtonItem
    barItem.rightChild = tabBarItem
    responder.leftChild = view
    responder.rightChild = viewController
    view.leftChild = scrollView
    view.rightChild = control
    scrollView.leftChild = tableView
    scrollView.rightChild = textView
    control.leftChild = button
    control.rightChild = textField
    viewController.leftChild = tabBarController
    viewController.rightChild = navigationController
    navigationController.leftChild = imagePickerController
    navigationController.rightChild = videoEditorController
    
    return nsObject
}()

print(binaryTree)


