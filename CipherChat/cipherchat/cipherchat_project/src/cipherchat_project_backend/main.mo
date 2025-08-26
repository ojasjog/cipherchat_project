
import Buffer "mo:base/Buffer";
import Time "mo:base/Time";
import Principal "mo:base/Principal";

actor class DevSyncPro() = this {

  type DevMessage = {
    id : Nat;
    sender : Principal;
    timestamp : Time.Time;
    content : Text;       // Encrypted message
    contextTag : Text;    // e.g., commit:abc123
    encrypted : Bool;
  };

  stable var stableMessages : [DevMessage] = [];

  var messages : Buffer.Buffer<DevMessage> = Buffer.fromArray(stableMessages);

  public func addMessage(content : Text, contextTag : Text, encrypted : Bool) : async Nat {
    let msg : DevMessage = {
      id = messages.size();
      sender = Principal.fromActor(this); // Replace with caller identity in real use
      timestamp = Time.now();
      content;
      contextTag;
      encrypted;
    };
    messages.add(msg);
    return msg.id;
  };

  public query func getMessages() : async [DevMessage] {
    return Buffer.toArray(messages);
  };

  system func preupgrade() {
    stableMessages := Buffer.toArray(messages);
  };

  system func postupgrade() {
    messages := Buffer.fromArray(stableMessages);
  };
}
