pragma solidity >=0.4.21 <0.6.0;

contract DataStore {

    address public owner;
    mapping (bytes32 => Data) public dataMapping;

    struct Data {
        string content;
        uint timestamp;
    }

    constructor() public {
        owner = msg.sender;
    }

    function read(bytes32 hash) public view returns (string memory, uint) {
        Data memory output = dataMapping[hash];

        return (output.content, output.timestamp);
    }

    function write(string memory content) public {
        bytes32 hash = keccak256(abi.encodePacked(content, now));

        require(!exists(hash), "Message already exists.");

        dataMapping[hash] = Data(content, now);
    }

    function exists(bytes32 hash) public view returns (bool) {
        return dataMapping[hash].timestamp != 0;
    }

}
