// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

contract StorageFactory {



    //this is an array to store the contract that we are making
    SimpleStorage[] public simpleStorageArray;



    function createSimpleStorageContract() public {
        
        //here we are making a new variable with type of the contract "SimpleStorage" 
        SimpleStorage simpleStorage = new SimpleStorage();

        //here we are storing the new contract to the array
        simpleStorageArray.push(simpleStorage);

    }

    //this functions stores a number to a address in the array for ex - at 0th index we sotre 55.
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {

        // SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));

        // //calling funtion of the SimpleStorage contract
        // simpleStorage.store(_simpleStorageNumber);

        //the above code is same as this

       return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }// we can can't see what we have stored from this function so let's make another function

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        // SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]))e;

        // //calling the retirve funtion of the SimpleStorage contract
        // return simpleStorage.retrive();


        //above code is same as this
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrive();
    }



}