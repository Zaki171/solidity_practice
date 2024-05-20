// SPDX - License - Identifier : GPL -3.0
pragma solidity >=0.7.0 <0.9.0;
contract VContract {
        mapping ( address => uint ) public balances ;
        function deposit () public payable {
        require ( msg . value >= 1 ether , " Desposit must be no less than 1 Ether ") ;
        balances [ msg . sender ] += msg . value ;
    }
    function withdraw () public payable {
    // check user ’ s balance
        require (
        balances [ msg . sender ] >= 1 ether ," Balance needs to be at least 1 Ether ") ;
        uint256 bal = balances [ msg . sender ];
        // withdraw user balance
        ( bool sent ,) = msg . sender . call { value : bal }("") ;
        require ( sent , " Failed to withdraw ") ;
        // update balance
        balances [ msg . sender ] = 0;
    }
    // function to display balance
    function balance () public view returns ( uint256 ) {
    return address ( this ) . balance ;
    }
}