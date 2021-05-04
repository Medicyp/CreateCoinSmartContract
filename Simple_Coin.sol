pragma solidity >=0.0.7 <0.9.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;
    
    event Sent(address from, address to, uint amount);
    
    constructor() {
        minter = msg.sender;
    }
    
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

/* Address: Every account and smart contract has an address. It is used to send and receie Ether from one account to another.
            You can consider it your public identity on the Blockchain.
            
            Mapping: Data type used to store associations. Similar to a list but holding 2 values, and allow you to quickly get the value corresponding to a key.
            
            Event: When you call an event, it causes the arguments to be stored in the transaction's log.
            
            Emit: Keyword used to call Events.
            
            Constructor: Function that is run directly when the contract is created.
            
            Msg: Keyword that allows us to access some special variables that are available for us from the Blockchain.
            
            Require: Convenience function in solidity. It guarantees validity of conditiosn that cannot be detected before execution.
            
*/
            

            
// Credits: https://www.youtube.com/watch?v=RVhmLE3sd-Y&list=PLFPZ8ai7J-iTJDENUIY40VsU_5Wmxkr7j&index=2
