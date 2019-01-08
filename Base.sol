pragma solidity >=0.4.22 <0.6.0;
contract Base {

    //Tax procedures
    string public notification = "Your virtual currency is convertible. You need to assess your tax obligations.";

    function Notifier() public {
        notification = 'Your virtual currency is convertible. You need to assess your tax obligations.';
    }

    function setNotification(string memory _notification) public {
        notification = _notification;
    }

    function notify() view public returns (string memory) {
        return notification;
    }


    //Base function
    function withdraw() public {
        msg.sender.transfer(address(this).balance);
    }
}
