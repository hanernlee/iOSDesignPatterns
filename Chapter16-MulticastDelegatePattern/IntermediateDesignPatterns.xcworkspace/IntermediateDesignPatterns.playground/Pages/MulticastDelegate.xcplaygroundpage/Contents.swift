/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Multicast Delegate
 - - - - - - - - - -
 ![Multicast Delegate Diagram](MulticastDelegate_Diagram.png)
 
 The multicast delegate pattern is a behavioral pattern and a variation on the delegate pattern. Instead of a one-to-one delegate relationship, the multicast delegate allows you to create one-to-many delegate relationships. It involes three types:
 
 1. The **delegate protocol** defines the methods a delegate may or should implement.
 2. The **delegate** is an object that implements the delegate protocol.
 3. The **Multicast Delegate** is a helper class that holds onto delegates and allows you to invoke _all_ of the delegates whenever a delegate-worthy event happens.
 
 ## Code Example
 */
public protocol EmergencyResponding {
    func notifyFire(at location: String)
    func notifiyCarCrash(at location: String)
}

public class FireStation: EmergencyResponding {
    public func notifyFire(at location: String) {
        print("Firefighters were notified about a fire at " + location)
    }
    
    public func notifiyCarCrash(at location: String) {
        print("Firefighters were notified about a car crash at " + location)
    }
}

public class PoliceStation: EmergencyResponding {
    public func notifyFire(at location: String) {
        print("Police were notified about a fire at " + location)
    }
    
    public func notifiyCarCrash(at location: String) {
        print("Police were notified about a car crash at " + location)
    }
}

public class DispatchSystem {
    let multicastDelegate = MulticastDelegate<EmergencyResponding>()
}

let dispatch = DispatchSystem()
var policeStation: PoliceStation! = PoliceStation
var fireStation: FireStation! = FireStation()

dispatch.multicastDelegate.addDelegate(policeStation)
dispatch.multicastDelegate.addDelegate(fireStation)

dispatch.multicastDelegate.invokeDelegates{
    $0.notifyFire(at: "Ray's house")
}

print("")
fireStation = nil

dispatch.multicastDelegate.invokeDelegates {
    $0.notifiyCarCrash(at: "Ray's garage!")
}


