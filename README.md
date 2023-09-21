# TodoApp
## UserDefaults와 CoreData의 차이점
- UserDefaults를 이용하여 데이터의 일관성을 유지할 때는 직접적인 배열 혹은 데이터를 인코딩하여 저장하고 디코딩하여 불러왔다. 따라서 모델을 만들 때, Codable프로토콜을 채택하여 사용하였다.
- CoreData를 사용할 때는 모델을 만들고 attribute를 추가할 때, 이미 Codable한 데이터 타입들로 이루어져있기에 따로 프로토콜을 채택하는 과정은 필요하지 않았다. 다만, attribute에서 선택할 수 없는 타입을 가진 데이터(ex: image?)들을 유지하기 위한 방법을 고민해봐야 할 것같다.
- UserDefaults는 따로 모델화를 시키지 않을 정도의 간단한 정보, CoreData는 모델링이 필요한 데이터들을 구조화하여 유지하기에 좋은 형태인 것 같다. 적절하게 두가지를 모두 이용하는 것이 좋을 것같다.

## MVC와 MVVM의 차이점
- MVC와 MVVM의 큰 차이는 ViewModel의 유무이다. 이로 인해 View와 Model 간의 분리가 이루어지고, 각자 독립적인 역할을 하게 된다.
### 기존 숙련과제 (MVC)
- MVC를 목표로 구현했던 숙련과제에서는 사실 상 MVC패턴으로 완성되지 않아, 각각의 ViewController에서 View를 만들고, Model만 분리되었다.
### profileViewController (MVVM)
- MVVM을 목표로 구현한 ProfileViewController에서는 profileModel객체를 만들고(넘겨받거나) 이를 viewModel에 위임한다.
- viewModel은 profileView의 viewModel로 넘겨진다.
- 마지막으로 profileView를 profileViewContorller가 view로 채택하며 완성된다.
- 이런 과정으로 Model이 분리되어 viewModel의 생성 역할을 담당하고, viewModel은 view의 생성을 담당, Contorller는 각 생성과정을 연결시켜주는 역할만 하게 된다.
