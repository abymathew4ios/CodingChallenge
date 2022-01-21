# CodingChallenge
Coding Challenge for Hararoo


1. Design pattern used - MVVM
2. NetworkManager for managing network call ( currently used defualt URLSession ) 
3. View Model is reponsible for all Data fetching and handling.
4. Binding technique with closure used for UI updation.
5. REPOSITORY - responsible for from where we need to take data either from LOCAL DB or from NETWORK
6. NetworkService Interface used as abstract interface layer. Repository making a strong relationship with this interface via constructor injection.
7. Those are the classes confirm this "NetworkService" interface can be communicate with Repositor. This way we can test our Repository with mock models.
8. NetworkManager which confirm this Interface and implemented the internal data fetching part using effective use of GENERICS AND RESULT TYPE.
9 UNIT TEST DIDN'T IMPLEMENTED DUE TO TIME ISSUE, BCZ OF CURRENT OFFICE WORK SITUATION.
