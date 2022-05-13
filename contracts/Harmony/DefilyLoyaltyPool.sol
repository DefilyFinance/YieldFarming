// File: @openzeppelin/contracts/utils/Context.sol

// SPDX-License-Identifier: MIT

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: contracts/Math.sol

pragma solidity ^0.6.0;

/**
 * @dev Standard math utilities missing in the Solidity language.
 */
library Math {
    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + (((a % 2) + (b % 2)) / 2);
    }
}

// File: contracts/Context.sol

pragma solidity ^0.6.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor() internal {}

    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: contracts/IERC20.sol

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

// File: contracts/Address.sol

pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;


            bytes32 accountHash
         = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            codehash := extcodehash(account)
        }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }
}

// File: contracts/ERC20.sol

pragma solidity ^0.6.0;

/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20MinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;
    using Address for address;

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     *
     * To select a different value for {decimals}, use {_setupDecimals}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is
     * called.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount)
        public
        virtual
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender)
        public
        view
        virtual
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount)
        public
        virtual
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()].sub(
                amount,
                "ERC20: transfer amount exceeds allowance"
            )
        );
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue)
        public
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].add(addedValue)
        );
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].sub(
                subtractedValue,
                "ERC20: decreased allowance below zero"
            )
        );
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(
            amount,
            "ERC20: transfer amount exceeds balance"
        );
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(
            amount,
            "ERC20: burn amount exceeds balance"
        );
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Sets {decimals} to a value other than the default one of 18.
     *
     * WARNING: This function should only be called from the constructor. Most
     * applications that interact with token contracts will not expect
     * {decimals} to ever change, and may work incorrectly if it does.
     */
    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}

// File: @openzeppelin/contracts/utils/ReentrancyGuard.sol

contract Ownable is Context {
    address private _owner;
    address private _previousOwner;
    uint256 private _lockTime;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() internal {
        address msgSender = _msgSender();
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function getUnlockTime() public view returns (uint256) {
        return _lockTime;
    }

    //Locks the contract for owner for the amount of time provided
    function lock(uint256 time) public virtual onlyOwner {
        _previousOwner = _owner;
        _owner = address(0);
        _lockTime = now + time;
        emit OwnershipTransferred(_owner, address(0));
    }

    //Unlocks the contract for owner when _lockTime is exceeds
    function unlock() public virtual {
        require(
            _previousOwner == msg.sender,
            "You don't have permission to unlock"
        );
        require(now > _lockTime, "Contract is locked until 7 days");
        emit OwnershipTransferred(_owner, _previousOwner);
        _owner = _previousOwner;
    }
}

pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() internal {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

// File: contracts/DefilyLoyaltyPool.sol

pragma solidity 0.6.12;

contract DefilyLoyaltyPool is
    Ownable,
    ReentrancyGuard
{
    using SafeMath for uint256;

    address public initializer; // The address of the smart chef factory

    bool public isInitialized; // Whether it is initialized

    uint256 public bonusEndBlock; // The block number when DRAGON mining ends.
    uint256 public startBlock; // The block number when DRAGON mining starts.
    uint256 public lastRewardBlock; // The block number of the last pool update
    uint256 public additionalBlocks; // The number of blocks that will be added
    uint256 public lockDuration = 90 days; // The lock duration
    uint256 public resetDeadline; // The timestamp that reset occured
    uint256 public resetDuration = 7 days; // The reset duration
    uint256 public totalStaked;

    mapping(address => UserInfo) public userInfo; // Info of each user that stakes tokens (stakedToken)
    mapping(ERC20 => PoolInfo) public poolInfo; // The pool's info

    ERC20[] public rewardTokens; // The reward token
    ERC20 public stakedToken; // The staked token

    struct UserInfo {
        uint256 amount; // How many staked tokens the user has provided
        uint256 unlockTimestamp;
        mapping(ERC20 => uint256) rewardDebt; // Reward debt
    }

    struct PoolInfo {
        uint256 accTokenPerShare; // Accrued token per share
        uint256 rewardPerBlock; // DRAGON tokens created per block.
        uint256 PRECISION_FACTOR; // The precision factor
        uint256 totalRewardSupply; // The total reward supply
        uint256 claimedRewards; // The claimed rewards in all batches
        bool isNew; // Flag for new tokens added
    }

    //******EVENTS********//
    event AdminTokenRecovery(address tokenRecovered, uint256 amount);
    event Deposit(address indexed user, uint256 amount);
    event EmergencyWithdraw(address indexed user, uint256 amount);
    event NewStartAndEndBlocks(uint256 startBlock, uint256 endBlock);
    event NewRewardPerBlock(uint256 rewardPerBlock, ERC20 token);
    event Withdraw(address indexed user, uint256 amount);
    event NewRewardToken(ERC20 token, uint256 p_factor);
    event RemoveRewardToken(ERC20 token);

    constructor() public {
        initializer = msg.sender;
    }

    //******ADMIN FUNCTIONS********//
    // Initialize pool
    function initialize(
        ERC20 _stakedToken,
        ERC20[] memory _rewardTokens,
        uint256 _startBlock,
        uint256 _additionalBlocks,
        uint256 _resetAt,
        address _admin
    ) external {
        require(!isInitialized, "Already initialized");
        require(msg.sender == initializer, "Not factory");

        // Make this contract initialized
        isInitialized = true;

        stakedToken = _stakedToken;
        rewardTokens = _rewardTokens;
        startBlock = _startBlock;
        bonusEndBlock = block.number;
        additionalBlocks = _additionalBlocks;
        resetDeadline = _resetAt;

        uint256 decimalsRewardToken;
        for (uint256 i = 0; i < _rewardTokens.length; i++) {
            decimalsRewardToken = uint256(_rewardTokens[i].decimals());
            require(decimalsRewardToken < 30, "Must be inferior to 30");
            poolInfo[_rewardTokens[i]].PRECISION_FACTOR = uint256(
                10**(uint256(30).sub(decimalsRewardToken))
            );
        }

        // Set the lastRewardBlock as the startBlock
        lastRewardBlock = startBlock;

        // Update reward
        _updateReward();

        // Transfer ownership to the admin address who becomes owner of the contract
        transferOwnership(_admin);

        initializer = address(0);
    }

    // Batch reward withdraw by owner
    function emergencyRewardWithdraw(uint256[] memory _amount) external onlyOwner {
        for (uint256 i = 0; i < rewardTokens.length; i++) {
            ERC20(rewardTokens[i]).transfer(address(msg.sender), _amount[i]);
        }
    }

    // Recover any token in case of emergency by owner
    function recoverWrongTokens(address _tokenAddress, uint256 _tokenAmount)
        external
        onlyOwner
    {
        require(_tokenAddress != address(stakedToken), "Not user's funds");
        ERC20(_tokenAddress).transfer(address(msg.sender), _tokenAmount);
        emit AdminTokenRecovery(_tokenAddress, _tokenAmount);
    }

    // Owner update reward per block for a specific token
    function updateRewardPerBlock(uint256 _rewardPerBlock, ERC20 _token)
        external
        onlyOwner
    {
        (bool foundToken, uint256 tokenIndex) = findElementPosition(
            _token,
            rewardTokens
        );
        require(foundToken, "Cannot find token");
        poolInfo[_token].rewardPerBlock = _rewardPerBlock;
        emit NewRewardPerBlock(_rewardPerBlock, _token);
    }

    // Owner update start and end blocks
    function updateStartAndEndBlocks(
        uint256 _startBlock,
        uint256 _bonusEndBlock
    ) external onlyOwner {
        require(
            _startBlock < _bonusEndBlock,
            "New startBlock must be lower than new endBlock"
        );

        startBlock = _startBlock;
        bonusEndBlock = _bonusEndBlock;

        // Set the lastRewardBlock as the startBlock
        lastRewardBlock = startBlock;

        emit NewStartAndEndBlocks(_startBlock, _bonusEndBlock);
    }

    // Owner update additional blocks per distribution
    function updateAdditionalBlocks(uint256 _blocks) external nonReentrant onlyOwner{
        additionalBlocks = _blocks;
    }

    // Owner update lock duration
    function updateLockDuration(uint256 _lockTime) external nonReentrant onlyOwner{
        lockDuration = _lockTime;
    }

    // Owner update reset duration
    function updateResetDuration(uint256 _resetTime) external nonReentrant onlyOwner{
        resetDuration = _resetTime;
    }

    // Add reward token and reward per block
    function addRewardToken(ERC20 _token)
        external
        onlyOwner
    {
        require(address(_token) != address(0), "Must be a real token");
        require(address(_token) != address(this), "Must be a real token");

        (bool foundToken, uint256 tokenIndex) = findElementPosition(
            _token,
            rewardTokens
        );
        require(!foundToken, "Token exists");
        rewardTokens.push(_token);

        uint256 decimalsRewardToken = uint256(_token.decimals());
        require(decimalsRewardToken < 30, "Must be inferior to 30");
        poolInfo[_token].PRECISION_FACTOR = uint256(
            10**(uint256(30).sub(decimalsRewardToken))
        );
        poolInfo[_token].rewardPerBlock = 0;
        poolInfo[_token].accTokenPerShare = 0;
        poolInfo[_token].isNew = true;

        emit NewRewardToken(_token, poolInfo[_token].PRECISION_FACTOR);
    }

    // Remove a reward token
    function removeRewardToken(ERC20 _token) external onlyOwner {
        require(address(_token) != address(0), "Must be a real token");
        require(address(_token) != address(this), "Must be a real token");
        require(rewardTokens.length > 0, "List of token is empty");

        (bool foundToken, uint256 tokenIndex) = findElementPosition(
            _token,
            rewardTokens
        );
        require(foundToken, "Cannot find token");
        (bool success, ERC20[] memory newRewards) = removeElement(
            tokenIndex,
            rewardTokens
        );
        rewardTokens = newRewards;
        require(success, "Remove token unsuccessfully");
        poolInfo[_token].PRECISION_FACTOR = 0;
        poolInfo[_token].rewardPerBlock = 0;
        poolInfo[_token].accTokenPerShare = 0;

        emit RemoveRewardToken(_token);
    }

    //******USER FUNCTIONS********//
    // User deposit
    function deposit(uint256 _amount) external nonReentrant {
        UserInfo storage user = userInfo[msg.sender];

        _updatePool();
        _updateReset();

        user.unlockTimestamp = resetDeadline.add(resetDuration).add(lockDuration);

        if (user.amount > 0) {
            uint256 pending;
            for (uint256 i = 0; i < rewardTokens.length; i++) {
                pending = user
                .amount
                .mul(poolInfo[rewardTokens[i]].accTokenPerShare)
                .div(poolInfo[rewardTokens[i]].PRECISION_FACTOR)
                .sub(user.rewardDebt[rewardTokens[i]]);
                if (pending > 0) {
                    ERC20(rewardTokens[i]).transfer(
                        address(msg.sender),
                        pending
                    );
                    poolInfo[rewardTokens[i]].claimedRewards = poolInfo[rewardTokens[i]].claimedRewards.add(pending);
                }
            }
        }

        if (_amount > 0) {
            user.amount = user.amount.add(_amount);
            totalStaked = totalStaked.add(_amount);
            ERC20(stakedToken).transferFrom(
                address(msg.sender),
                address(this),
                _amount
            );
        }
        for (uint256 i = 0; i < rewardTokens.length; i++) {
            user.rewardDebt[rewardTokens[i]] = user
            .amount
            .mul(poolInfo[rewardTokens[i]].accTokenPerShare)
            .div(poolInfo[rewardTokens[i]].PRECISION_FACTOR);
        }

        _updateReward();

        emit Deposit(msg.sender, _amount);
    }

    // User withdraw
    function withdraw(uint256 _amount) external nonReentrant {
        UserInfo storage user = userInfo[msg.sender];
        require(user.amount >= _amount, "Amount to withdraw too high");

        _updatePool();
        _updateReset();

        uint256 pending;
        for (uint256 i = 0; i < rewardTokens.length; i++) {
            pending = user
            .amount
            .mul(poolInfo[rewardTokens[i]].accTokenPerShare)
            .div(poolInfo[rewardTokens[i]].PRECISION_FACTOR)
            .sub(user.rewardDebt[rewardTokens[i]]);
            if (pending > 0) {
                ERC20(rewardTokens[i]).transfer(address(msg.sender), pending);
                poolInfo[rewardTokens[i]].claimedRewards = poolInfo[rewardTokens[i]].claimedRewards.add(pending);
            }
        }
        if (_amount > 0) {
            user.amount = user.amount.sub(_amount);
            totalStaked = totalStaked.sub(_amount);
            uint256 payout = _amount;
            if(block.timestamp < user.unlockTimestamp){
                payout = _amount.div(2);
            }
            ERC20(stakedToken).transfer(address(msg.sender), payout);
        }
        for (uint256 i = 0; i < rewardTokens.length; i++) {
            user.rewardDebt[rewardTokens[i]] = user
            .amount
            .mul(poolInfo[rewardTokens[i]].accTokenPerShare)
            .div(poolInfo[rewardTokens[i]].PRECISION_FACTOR);
        }

        _updateReward();

        emit Withdraw(msg.sender, _amount);
    }

    // Update reward distribution by hand
    function updateReward() external nonReentrant {
        _updateReward();
    }

    // Update reset by hand
    function updateReset() external nonReentrant {
        _updateReset();
    }

    // User withdraw in case emergency
    function emergencyWithdraw() external nonReentrant {
        UserInfo storage user = userInfo[msg.sender];
        uint256 amountToTransfer = user.amount;
        user.amount = 0;
        for (uint256 i = 0; i < rewardTokens.length; i++) {
            user.rewardDebt[rewardTokens[i]] = 0;
        }

        if (amountToTransfer > 0) {
            totalStaked = totalStaked.sub(amountToTransfer);
            ERC20(stakedToken).transfer(address(msg.sender), amountToTransfer);
        }

        emit EmergencyWithdraw(msg.sender, user.amount);
    }

    //**********VIEW FUNCTIONS***********//
    // User view all pending rewards
    function pendingReward(address _user)
        external
        view
        returns (uint256[] memory)
    {
        UserInfo storage user = userInfo[_user];
        uint256 stakedTokenSupply = totalStaked;
        uint256[] memory userPendingRewards = new uint256[](
            rewardTokens.length
        );
        if (block.number > lastRewardBlock && stakedTokenSupply != 0) {
            uint256 multiplier = _getMultiplier(lastRewardBlock, block.number);
            uint256 dragonReward;
            uint256 adjustedTokenPerShare;
            for (uint256 i = 0; i < rewardTokens.length; i++) {
                dragonReward = multiplier.mul(poolInfo[rewardTokens[i]].rewardPerBlock);
                adjustedTokenPerShare = poolInfo[rewardTokens[i]].accTokenPerShare.add(
                    dragonReward.mul(poolInfo[rewardTokens[i]].PRECISION_FACTOR).div(
                        stakedTokenSupply
                    )
                );
                userPendingRewards[i] = user
                .amount
                .mul(adjustedTokenPerShare)
                .div(poolInfo[rewardTokens[i]].PRECISION_FACTOR)
                .sub(user.rewardDebt[rewardTokens[i]]);
            }
            return (userPendingRewards);
        } else {
            for (uint256 i = 0; i < rewardTokens.length; i++) {
                userPendingRewards[i] = user
                .amount
                .mul(poolInfo[rewardTokens[i]].accTokenPerShare)
                .div(poolInfo[rewardTokens[i]].PRECISION_FACTOR)
                .sub(user.rewardDebt[rewardTokens[i]]);
            }
            return (userPendingRewards);
        }
    }

    // User view pending reward by token
    function pendingRewardByToken(address _user, ERC20 _token)
        external
        view
        returns (uint256)
    {
        (bool foundToken, uint256 tokenIndex) = findElementPosition(
            _token,
            rewardTokens
        );
        if (!foundToken) {
            return 0;
        }
        UserInfo storage user = userInfo[_user];
        uint256 stakedTokenSupply = totalStaked;
        uint256 userPendingReward;
        if (block.number > lastRewardBlock && stakedTokenSupply != 0) {
            uint256 multiplier = _getMultiplier(lastRewardBlock, block.number);
            uint256 dragonReward = multiplier.mul(poolInfo[_token].rewardPerBlock);
            uint256 adjustedTokenPerShare = poolInfo[_token].accTokenPerShare.add(
                dragonReward.mul(poolInfo[_token].PRECISION_FACTOR).div(
                    stakedTokenSupply
                )
            );
            userPendingReward = user
            .amount
            .mul(adjustedTokenPerShare)
            .div(poolInfo[_token].PRECISION_FACTOR)
            .sub(user.rewardDebt[_token]);
            return userPendingReward;
        } else {
            return
                user
                    .amount
                    .mul(poolInfo[_token].accTokenPerShare)
                    .div(poolInfo[_token].PRECISION_FACTOR)
                    .sub(user.rewardDebt[_token]);
        }
    }

    // View all reward per block
    function getAllRewardPerBlock()
        external
        view
        returns (uint256[] memory)
    {
        uint256[] memory RPBlist = new uint256[](rewardTokens.length);
        for (uint256 i = 0; i < rewardTokens.length; i++) {
            RPBlist[i] = poolInfo[rewardTokens[i]].rewardPerBlock;
        }
        return (RPBlist);
    }

    //**************SUPPORTING FUNCTIONS*******************//
    function _updatePool() internal {
        if (block.number <= lastRewardBlock) {
            return;
        }

        uint256 stakedTokenSupply = totalStaked;

        if (stakedTokenSupply == 0) {
            lastRewardBlock = block.number;
            return;
        }

        uint256 multiplier = _getMultiplier(lastRewardBlock, block.number);
        uint256 dragonReward;
        for (uint256 i = 0; i < rewardTokens.length; i++) {
            dragonReward = multiplier.mul(poolInfo[rewardTokens[i]].rewardPerBlock);
            poolInfo[rewardTokens[i]].accTokenPerShare = poolInfo[rewardTokens[i]].accTokenPerShare
            .add(
                dragonReward.mul(poolInfo[rewardTokens[i]].PRECISION_FACTOR).div(
                    stakedTokenSupply
                )
            );
        }
        lastRewardBlock = block.number;
    }

    // Update reward distribution rate every X blocks
    function _updateReward() internal {
        if(block.number < bonusEndBlock){
            return;
        }
        uint256 reservedBlocks = block.number.sub(bonusEndBlock);
        uint256 reservedRewards;
        uint256 newSupply;
        uint256 rewardSupply;
        uint256 unclaimedRewards;
        bonusEndBlock = bonusEndBlock.add(additionalBlocks);
        for (uint256 i = 0; i < rewardTokens.length; i++) {
            newSupply = rewardTokens[i].balanceOf(address(this));
            if(address(rewardTokens[i]) == address(stakedToken)){
                newSupply = rewardTokens[i].balanceOf(address(this)).sub(totalStaked);
            }
            unclaimedRewards = poolInfo[rewardTokens[i]].totalRewardSupply.sub(poolInfo[rewardTokens[i]].claimedRewards);
            rewardSupply = newSupply.sub(unclaimedRewards);

            if(reservedBlocks > 0){
                reservedRewards = rewardSupply.mul(reservedBlocks).div(additionalBlocks);
                rewardSupply = rewardSupply.add(reservedRewards);
                if(poolInfo[rewardTokens[i]].isNew){
                    rewardSupply = rewardSupply.sub(reservedRewards);
                    poolInfo[rewardTokens[i]].isNew = false;
                }
            }
            poolInfo[rewardTokens[i]].rewardPerBlock = rewardSupply.div(additionalBlocks);
            poolInfo[rewardTokens[i]].totalRewardSupply = poolInfo[rewardTokens[i]].totalRewardSupply.add(rewardSupply);
        }
    }

    // Update distribution period
    function _updateReset() internal {
        if(block.timestamp < resetDeadline.add(resetDuration)){
            return;
        }
        resetDeadline = resetDeadline.add(resetDuration);
    }

    // Reward multiplier from > to blocks
    function _getMultiplier(uint256 _from, uint256 _to)
        internal
        view
        returns (uint256)
    {
        if (_to <= bonusEndBlock) {
            return _to.sub(_from);
        } else if (_from >= bonusEndBlock) {
            return 0;
        } else {
            return bonusEndBlock.sub(_from);
        }
    }

    // Remove element at index
    function removeElement(uint256 _index, ERC20[] storage _array)
        internal
        returns (bool, ERC20[] memory)
    {
        if (_index >= _array.length) {
            return (false, _array);
        }

        for (uint256 i = _index; i < _array.length - 1; i++) {
            _array[i] = _array[i + 1];
        }

        _array.pop();
        return (true, _array);
    }

    // Find element in array
    function findElementPosition(ERC20 _token, ERC20[] storage _array)
        internal
        view
        returns (bool, uint256)
    {
        for (uint256 i = 0; i < _array.length; i++) {
            if (_array[i] == _token) {
                return (true, i);
            }
        }
        return (false, 0);
    }
}
