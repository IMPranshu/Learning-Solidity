// SPDX-License-Identifier: MIT


pragma solidity >=0.6.6 <0.9.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    // this is used to keep track who sent us funds
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable{

        // msg.sender and msg.value are keywords in every contract call and transaction
        // msg.sender is the sender of the func. call and msg.value is how much they sent
        addressToAmountFunded[msg.sender] += msg.value;


        // We want to send a minimum value that the user can send at one transaction
        // and we want to set that minimum rate in INR
        // what the ETH -> INR conversion rate is 
        // how to get this conversion in the smart contract and from ehre to get thsi data????
        // This is where oracles are used.

    }
    // we are using the verison() function on the imported Aggregator contract here
    function getVersion() public view returns(uint256){
        // Here we define the working with other contracts using interfaces

        // it is the address from where the data is being fetched from the address
        // in this case we are fetching the Kovan adress of ETH / USD as the imported contract works on KOVAN testnet
        // this address is located on an actual testnet and will not work on our VM.
        // and we need to deploy it in our InjectedWeb3 env.
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331); 
        return priceFeed.version();
    }
    // here are using the latestRoundData function on the imported contract.
    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);

        // as the lastestRoundData function returns a tuple of 5 objects we are doinf this 
        //(uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answerInRound) = priceFeed.latestRoundData();
        // instead of the above line we can use blanks as we are only using one of the variable 
        // by using the blanks we can avoid the warning too
        (, int256 answer, ,,) = priceFeed.latestRoundData();


        // as the return type of getPrice function is uint we have to typecast the answer variable.
        return uint256(answer);
        // we can send the answer in wei uint by multiplying the answer with 10^8.

    }// now we have the price of ethereum in USD, we can set the minimum price in the fund funtion now.

    funtion getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
    }

}


 