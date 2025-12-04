// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/// @custom:dev-run-script
contract MyToken {
    // Token metadata - define these as public state variables
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    
    // Mapping to track balances: address => balance
    mapping(address => uint256) public balanceOf;
    
    // Nested mapping for allowances: owner => (spender => amount)
    mapping(address => mapping(address => uint256)) public allowance;
    
// Event emitted when tokens are transferred
event Transfer(address indexed from, address indexed to, uint256 value);

// Event emitted when allowance is set
event Approval(address indexed owner, address indexed spender, uint256 value);


    // Constructor to initialize total supply and assign to creator
    constructor(uint256 _totalSupply) {
        // Set totalSupply from parameter
        totalSupply = _totalSupply;

        // Assign entire supply to msg.sender (contract creator)
        balanceOf[msg.sender] = _totalSupply;
    }

    // Function to transfer tokens from caller to another address
function transfer(address _to, uint256 _value) public returns (bool success) {
    // Validate that recipient is not zero address
    require(_to != address(0), "Cannot transfer to zero address");
    
    // Validate sender has sufficient balance
    require(balanceOf[msg.sender] >= _value, "Insufficient balance");
    
    // Subtract from sender's balance
    balanceOf[msg.sender] -= _value;

    // Add to recipient's balance
    balanceOf[_to] += _value;
    
    // Emit Transfer event
    emit Transfer(msg.sender, _to, _value);
    
    return true;
}

// Function to approve another address to spend tokens on your behalf
function approve(address _spender, uint256 _value) public returns (bool success) {
    // Validate spender is not zero address
    require(_spender != address(0), "Cannot approve zero address");
    
    // Set allowance for spender
    allowance[msg.sender][_spender] = _value;
    
    // Emit Approval event
    emit Approval(msg.sender, _spender, _value);
    
    return true;
}

// Function to transfer tokens from one address to another using allowance
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    // Validate recipient is not the zero address
    require(_to != address(0), "Cannot transfer to zero address");
    
    // Validate owner has enough balance
    require(balanceOf[_from] >= _value, "Insufficient balance");
    
    // Validate caller is allowed to spend this amount
    require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");
    
    // Subtract from owner's balance
    balanceOf[_from] -= _value;

    // Add to recipient's balance
    balanceOf[_to] += _value;

    // Reduce allowance
    allowance[_from][msg.sender] -= _value;
    
    // Emit Transfer event
    emit Transfer(_from, _to, _value);
    
    return true;
}

// Function to get total supply (already public, but explicit function is clearer)
function getTotalSupply() public view returns (uint256) {
    return totalSupply;
}

// Function to get token metadata in a single call
function getTokenInfo() public view returns (string memory, string memory, uint8, uint256) {
    return (name, symbol, decimals, totalSupply);
}


}
