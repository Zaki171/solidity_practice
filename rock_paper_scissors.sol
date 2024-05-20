pragma solidity >=0.7.0 <0.9.0;
contract rps {

    uint256 choices[];

    function play( string memory addr, uint256 choice ) public {
        require(choice <=2, "Invalid input");

    }

    function decide () public {
        
    }
}