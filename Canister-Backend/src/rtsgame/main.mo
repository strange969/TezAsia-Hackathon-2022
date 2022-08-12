import Tokens "coin";
import Cycles "mo:base/ExperimentalCycles";
import Array "mo:base/Array";
import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Prim "mo:prim";
import Principal "mo:base/Principal";
import D "mo:base/Debug";
import Iter "mo:base/Iter";

actor {
  type Nat64 = Prim.Types.Nat64;
  private var capacity = 4000000000000000000;
 
   type token = Tokens.Token;

  let price = [1,150,130,140,10,50,15];
  let  tokens : [var ?token] = Array.init(10, null);  
private var miner = Map.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);
private var holding = Map.HashMap<Principal, [var Nat]>(1, Principal.equal, Principal.hash);
private var townhall = Map.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

private var balance = Cycles.balance();
  

   public shared(msg) func hola() : async Principal {
     let cycleShare = Cycles.balance()/10;
      Cycles.add(cycleShare);
      let con = await Tokens.Token("Aureus","Aurues","ARS",10,10000,msg.caller,0);
      tokens[0] := ?con;
         Cycles.add(cycleShare);
      let cannon = await Tokens.Token("Cannon","Cannon","CNO",10,5000,msg.caller,0);
        tokens[1] := ?cannon;
           Cycles.add(cycleShare);
      let xbow = await Tokens.Token("XBOW","XBOW","XBOW",10,6000,msg.caller,0);
        tokens[2] := ?xbow;
           Cycles.add(cycleShare);
      let tesla = await Tokens.Token("TESLA","TESLA","TSL",10,4000,msg.caller,0);
        tokens[3] := ?tesla;
           Cycles.add(cycleShare);
      let archer = await Tokens.Token("ARCHER","ARCHER","ARH",10,19000,msg.caller,0);
        tokens[4] := ?archer;
           Cycles.add(cycleShare);
      let robot = await Tokens.Token("ROBOT","ROBOT","RBT",10,3000,msg.caller,0);
        tokens[5] := ?robot;
           Cycles.add(cycleShare);
      let valkyrie = await Tokens.Token("VALKYRIE","VALKYRIE","VALK",10,4000,msg.caller,0);
         tokens[6] := ?valkyrie;

     await con.log();
  };

  public shared(msg) func startgame() : async Nat{
    switch(townhall.get(msg.caller)){
     case (?va) {
      return 0
    };
    case _ {
    
      townhall.put(msg.caller,1);
      return 1
    };
    };
  };

  public shared(msg) func isregister() : async Nat{
     switch(townhall.get(msg.caller)){
    case _ 0;
    case (?va) {
      return 1
    };};

  };
  public shared(msg) func faucet() : async Nat{
    switch (tokens[0]) {
      case null 0;
      case (?token) {
      let ab = await token.transfer(msg.caller,1000);
      return 1};
  };
    };

  public shared(msg) func getCoin() : async [Nat]{
    let valaer : [var Nat] = Array.init(7,0);
     for (j in Iter.range(0, 6)){
      let ab = switch (tokens[j]){
      case null null;
      case (?token){
        let ab = await token.balanceOf(msg.caller);
        valaer[j] := ab;
       
      };
    };
     };
     return Array.freeze(valaer);
  };

  public shared(msg) func matchwon(num:Nat) : async Nat{
    switch (tokens[0]){
      case null 0;
      case (?token){
        let ab = await token.transfer(msg.caller,num*30);
        return 1
      };
    };

  };


  public shared(msg) func getminer() : async Nat{
    switch (tokens[0]) {
      case null 0;
      case (?token) {
     let bc = switch (miner.get(msg.caller)) {
            case (?Nat) { return 0;   };
            case (_) { let ab = await token.formint(msg.caller,200);
      miner.put(msg.caller,1); };
        };
     
      return 1};
  };
  };
  public shared(msg) func mint(num:Nat) : async Nat{
    let ab= switch (tokens[0]) {
      case null 0;
      case (?token)  {
        let bc = await token.formint(msg.caller,price[num]);
        let ab =  switch (tokens[num]) {
      case null 0;
      case (?token) {
       let ab =  token.transfer(msg.caller,1);
      };
      }; 
      };
      
      
    };
 let bc = switch (holding.get(msg.caller)) {
           
            case (_) { 
              var abc: [var Nat] = Array.init(10, 0);
              
              holding.put(msg.caller,abc);
              
            };
        };
    return 1;


  };
    // Return the cycles received up to the capacity allowed

  public query func isminer(caller:Principal) : async Nat {
     let bc = switch (miner.get(caller)) {
            case (?Nat) { return 1;   };
            case (_) { return 0;};
        };
     
  
  };

  public query func ishold(caller:Principal,num:Nat) : async [Nat]{
    let bc = switch (holding.get(caller)){
      case(?va){return Array.freeze(va)};
      case (_) {return []};
    }
  };
  // Return the current cycle balance
  public shared(msg) func wallet_balance() : async Nat {
    return Cycles.balance();
  };

    public func wallet_receive() : async { accepted: Nat } {
    let amount = Cycles.available();
    let limit : Nat = capacity - balance;
    let accepted = 
        if (amount <= limit) amount
        else limit;
    let deposit = Cycles.accept(accepted);
    assert (deposit == accepted);
    balance += accepted;
    { accepted = accepted };
};
  public shared(msg) func lock(amount:[Nat]) : async Nat {

       let bc = switch (holding.get(msg.caller)) {
            case (?va) { 
              for (j in Iter.range(1, 6)) {
             D.print(debug_show(j));
              if(amount[j] > va[j]) {
                 switch (tokens[j]) {
                case null ();
                case (?token)  {
                let abc = await token.formint(msg.caller,amount[j]-va[j]);
                va[j] := amount[j];
                };
              };
              };
              if(amount[j] < va[j]) {
                 switch (tokens[j]) {
                case null ();
                case (?token)  {
                let abc = await token.transfer(msg.caller,va[j]-amount[j]);
                va[j] := amount[j];
                
                };
              };
              };
              };
              return 1;
              };
            case (_) { return 0;};
        };


  };
};
