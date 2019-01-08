pragma solidity >=0.4.22 <0.6.0;

//Oracle to confirm Tax Residence Sertificates
contract Oracle
    { struct Request {
        bytes data;
        function(uint) external callback;
    }

    Request[] requests;

    event NewRequest(uint);

    function query(bytes memory data, function(uint) external callback) public {
        requests.push(Request(data, callback));
        emit NewRequest(requests.length - 1);
    }

    function reply(uint requestID, uint response) public {
        requests[requestID].callback(response);
    }

    address Admin;

    //Trying to solve last mile problem - images schould be verifyed
    mapping ( bytes32 => verifiedImage) verifiedImages;
    bytes32[] imagesByVerificatorHash;

    //Or last mile may be put on users - if they want to be in oracle database - they should verify their data
    mapping ( address => User ) Users;
    address[] usersByAddress;

    struct verifiedImage {
    string imageURL;
    uint timeStamp;
    }

    struct User {
    string name;
    string city;
    string state;
    string country;
    bytes32[] certificateImages;
    }

    constructor () public payable {
        Admin = msg.sender;
    }

    modifier onlyAdmin() {
        if (msg.sender != Admin)
            revert('No rights');
        // Do not forget the "_;"! It will be replaced by the actual function body when the modifier is used.
        _;
    }

    function removeUser(address badUser) public onlyAdmin returns (bool success) {
        delete Users[badUser];
        return true;
    }

    function removeImage(bytes32 badImage) public onlyAdmin returns (bool success) {
        delete verifiedImages[badImage];
        return true;
    }

    function registerNewUser(string memory name,
        string memory city, string memory state, string memory country) public returns (bool success) {
        address thisNewAddress = msg.sender;

        if(bytes(Users[msg.sender].name).length == 0 && bytes(name).length != 0){
            Users[thisNewAddress].name = name;
            Users[thisNewAddress].city = city;
            Users[thisNewAddress].state = state;
            Users[thisNewAddress].country = country;
            usersByAddress.push(thisNewAddress);
            return true;
        } else {
            return false;
        }
    }

    function addImageToUser(string memory imageURL,bytes32 SHA256Hash) public returns (bool success) {
        address thisNewAddress = msg.sender;
        if(bytes(Users[thisNewAddress].name).length != 0){
            if(bytes(imageURL).length != 0){   // ) {

            if(bytes(verifiedImages[SHA256Hash].imageURL).length == 0) {
                imagesByVerificatorHash.push(SHA256Hash);
            }

                verifiedImages[SHA256Hash].imageURL = imageURL;
                verifiedImages[SHA256Hash].timeStamp = block.timestamp;
                Users[thisNewAddress].certificateImages.push(SHA256Hash);
                return true;
            } else {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }

    function getUsers() view public returns (address[] memory)
        { return usersByAddress; }

    function getUser(address userAddress) view public
        returns (string memory,string memory,string memory,string memory,bytes32[] memory)
    {
        return (Users[userAddress].name,Users[userAddress].city,
            Users[userAddress].state,Users[userAddress].country,
                Users[userAddress].certificateImages);
    }

    function getAllImages() view public returns (bytes32[] memory)
        { return imagesByVerificatorHash; }

    function getUserImages(address userAddress) view public returns (bytes32[] memory)
        { return Users[userAddress].certificateImages; }

    function getImage(bytes32 SHA256Hash) view public returns (string memory,uint) {
        return (verifiedImages[SHA256Hash].imageURL,verifiedImages[SHA256Hash].timeStamp);
    }
}
