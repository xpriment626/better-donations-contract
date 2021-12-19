//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract BetterDonations 

{
    mapping(address => bool) contributors;
    address payable private nonProfit;
    address private charityRepresentative;
    address private orgRepresentative;
    uint256 private verificationCode;

    constructor(address payable _reciever, address _charRep, address _orgRep, uint256 _verify)
    {
        nonProfit = _reciever;
        charityRepresentative = _charRep;
        orgRepresentative = _orgRep;
        verificationCode = _verify;
    }

        function signIn(address _input) public 
        {
            require(_input == msg.sender, "Please use your own address");
            contributors[_input] = true;
        }
    
        function donate() public requireSignIn() payable {}

        function getBalance() public view returns(uint256)
        {
            return address(this).balance;
        }

        function verifyDoner(address _verify) public view
        {
            require(contributors[_verify] == true, "This address has not contributed");
        }

        function getBalance() public view returns(uint256)
        {
            return address(this).balance;
        }

        function transferToNPO(uint256 _code) payable onlyNonProfit() public
        {
            require(_code == verificationCode, 'INVALID VERIFICATION CODE');
            nonProfit.transfer(address(this).balance);
        }

        modifier onlyNonProfit()
        {
            require(msg.sender == nonProfit, 'ONLY the NPO can initialise fund transfer');
            _;
        }

        modifier requireSignIn()
        {
            require(contributors[msg.sender] == true, "Sign in to donate");
            _;
        } 

}