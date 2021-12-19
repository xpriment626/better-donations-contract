# BETTER DONATIONS SMART CONTRACT

This project has been made in conjuction with a feasability study of smart contract use cases in the Philippines. The Better Donations smart contract proposes a new way for charitable organisations to go about receiving donations.

Current Functionality Outline:

    - The donate() function can be viewed and called by any address.
    - Addresses that donate to the contract are pushed into an array of contributors
    - getBalance() function displays the balance of the contract at the period in which its called.
    - transferToNPO() sends the entire balance to the receiving address
    - MODIFIER: Restrict fund transfers to ONLY the receiving address

Functionality to be Added (open to contributions):

    - checkContribution() function which takes an address as a parameter and returns bool value indicating whether the address has already made a contibution.
    - Implement 24hr per donation functionality
    - Functionallity to automatically transfer funds once a specified timestamp is reached
