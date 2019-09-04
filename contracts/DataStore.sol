pragma solidity >=0.4.21 <0.6.0;

contract DataStore {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    event OnWrite(string data);

    function write(string memory data) public {
        emit OnWrite(data);
    }
}
