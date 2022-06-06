pragma solidity >=0.4.22 <0.9.0;

contract counter {

    uint public count = 0;

    function increment() public returns(uint){
        count += 100;
        return count;
    }

    function get() public view returns (uint) {
        return count;
    }

    function decrease() public {
        require(count > 0, "Can not decrement further");
        count -= 1;
    }


}