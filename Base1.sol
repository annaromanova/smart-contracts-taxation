pragma solidity >=0.4.22 <0.6.0;

//Contract to store tax rate
contract TaxRate{
    uint private taxRate = 20;
    function getRate() public view returns (uint){
        return taxRate;
    }

    function setRate(uint _rate) public{
        taxRate = _rate;
    }
}

contract Base1 {

    //Tax procedures
    function useNewRate() public returns (uint){

        TaxRate myObj = new TaxRate();
        myObj.setRate(10);
        return myObj.getRate();
    }

    //Base function
    function withdraw() public {
        msg.sender.transfer(address(this).balance);
    }
}
