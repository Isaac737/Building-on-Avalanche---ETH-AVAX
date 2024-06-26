// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    event Redeemed(address indexed user, uint256 itemId, uint256 quantity);

    struct Item {
        uint256 id;
        string name;
        uint256 quantity;
        uint256 price;
    }

    Item[] public items;

    constructor(address initialOwner) ERC20("Degen", "DGN") Ownable(initialOwner) {
        
        items.push(Item(0, "Lightning Necklace", 100, 1 ether));
        items.push(Item(1, "Gold Boomerang", 50, 2 ether));
        items.push(Item(2, "Sapphire Dust", 200, 0.5 ether));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function redeem(uint256 itemId, uint256 quantity) public {
        Item storage item = items[itemId];
        require(item.id > 0, "Invalid item ID");
        require(item.quantity >= quantity, "Insufficient quantity to redeem");
        item.quantity -= quantity;

        emit Redeemed(msg.sender, itemId, quantity);
    }

    function getBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function burn(uint256 amount) public override {
        require(balanceOf(_msgSender()) >= amount, "ERC20: burn amount exceeds balance");
        _burn(_msgSender(), amount);
    }

    function burnFrom(address account, uint256 amount) public override {
        require(balanceOf(account) >= amount, "ERC20: burn amount exceeds balance");
        _burn(account, amount);
    }
}