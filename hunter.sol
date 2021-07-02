
pragma solidity ^0.6.12;
// SPDX-License-Identifier: Unlicensed
interface IERC20 {
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
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

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
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, 'SafeMath: addition overflow');

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, 'SafeMath: subtraction overflow');
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
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
     *
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
        require(c / a == b, 'SafeMath: multiplication overflow');

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
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, 'SafeMath: division by zero');
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
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
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
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, 'SafeMath: modulo by zero');
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
     *
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

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!
interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint256);

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);

    function allPairs(uint256) external view returns (address pair);

    function allPairsLength() external view returns (uint256);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
        external
        returns (
            uint256 amountA,
            uint256 amountB,
            uint256 liquidity
        );

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountETH,
            uint256 liquidity
        );

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETH(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETHWithPermit(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountToken, uint256 amountETH);

    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactETHForTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapTokensForExactETH(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForETH(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapETHForExactTokens(
        uint256 amountOut,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function quote(
        uint256 amountA,
        uint256 reserveA,
        uint256 reserveB
    ) external pure returns (uint256 amountB);

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountOut);

    function getAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountIn);

    function getAmountsOut(uint256 amountIn, address[] calldata path) external view returns (uint256[] memory amounts);

    function getAmountsIn(uint256 amountOut, address[] calldata path) external view returns (uint256[] memory amounts);
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

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
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
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
        require(address(this).balance >= amount, 'Address: insufficient balance');

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}('');
        require(success, 'Address: unable to send value, recipient may have reverted');
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, 'Address: low-level call failed');
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, 'Address: low-level call with value failed');
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, 'Address: insufficient balance for call');
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(
        address target,
        bytes memory data,
        uint256 weiValue,
        string memory errorMessage
    ) private returns (bytes memory) {
        require(isContract(target), 'Address: call to non-contract');

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{value: weiValue}(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// pragma solidity >=0.6.2;

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
}


contract Ownable is Context {
    address private _owner;
    address private _previousOwner;
    uint256 private _lockTime;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() internal {
        address msgSender = _msgSender();
        _owner = msgSender;
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
        require(_owner == _msgSender(), 'Ownable: caller is not the owner');
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
        require(newOwner != address(0), 'Ownable: new owner is the zero address');
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function geUnlockTime() public view returns (uint256) {
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
        require(_previousOwner == msg.sender, "You don't have permission to unlock");
        require(now > _lockTime, 'Contract is locked until 7 days');
        emit OwnershipTransferred(_owner, _previousOwner);
        _owner = _previousOwner;
    }
}

interface IFomo {
    function transferNotify(address user) external;

    function swap() external;
}

interface IWrap {
    function withdraw() external;
}

contract HTNFT is IERC20, Context, Ownable {
    using SafeMath for uint256;
    using Address for address;

    uint256 private constant MAX_UINT256 = 2**256 - 1;

    // mapping (address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public _allowed;

    mapping(address => bool) private _freeAddress; //
    mapping(address => bool) private _isExcluded; //
    address[] private _excluded; //

    mapping(address => uint256) private _rOwned; //
    mapping(address => uint256) private _tOwned; //

     uint256 private constant MAX = ~uint256(0);
    uint256 private _tTotal = 1000 * 10**4 * 10**8 * 10**18;
    uint256 private _rTotal = (MAX - (MAX % _tTotal));

    string private _name = "HTNFT"; 
    string private _symbol = "HTNFT"; 
    uint8 private _decimals = 18;


    uint256 public constant _maxTxAmount = 600 * 10**4 * 10**4 * 10**18; //
    uint256 private numTokensSellToAddToLiquidity = 5000 * 10**4 * 10**4 * 10**18; //

    IERC20 public usdt = IERC20(0x32290FEd03629f7cd48204D4D071D953fF91b782); //heyue

    address public constant _blackHoleAddress = 0x0000000000000000000000000000000000000001;
    address public _nftAddress;
    address public _fomoAddress;
    address public _teamAddress;

    IUniswapV2Router02 public immutable uniswapV2Router; //LP
    address public immutable uniswapV2Pair; //jiaoyidui

    uint256[3] private _ratioFee = [6, 4, 2];
    uint256[3] private _ratioNFT = [15, 10, 5];
    uint256[3] private _fomoMin = [10, 5, 1];

    bool inSwapAndLiquify;
    bool public swapAndLiquifyEnabled = true;
    IWrap public wrap;

    uint256 private enterCount = 0;

    event SwapAndLiquifyEnabledUpdated(bool enabled);
    event SwapAndLiquify(uint256 tokensSwapped, uint256 ethReceived, uint256 tokensIntoLiqudity);

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function setWrap(IWrap _wrap) public {
        require(_msgSender() == owner(), "fail");
        wrap = _wrap;
        _freeAddress[address(_wrap)] = true;
    }
    constructor() public {
        
        _rOwned[msg.sender] = _rTotal;
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x298f4CA44cFa5a932D0Dd59Ad1c30Eb45aD79574); //liudongchi
        // Create a uniswap pair for this new token
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).createPair(address(this), address(usdt));
        // set the rest of the contract variables
        uniswapV2Router = _uniswapV2Router;

        _freeAddress[owner()] = true;
        _freeAddress[address(this)] = true;

        emit Transfer(address(0), msg.sender, _tTotal);
    }

    modifier lockTheSwap {
        inSwapAndLiquify = true;
        _;
        inSwapAndLiquify = false;
    }
    modifier transferCounter {
        enterCount = enterCount.add(1);
        _;
        enterCount = enterCount.sub(1, 'transfer counter');
    }

    function setNftAddress(address addr) public onlyOwner returns (address) {
        _nftAddress = addr;
        return _nftAddress;
    }

    function setFomoAddress(address addr) public onlyOwner returns (address) {
        _fomoAddress = addr;
        return _fomoAddress;
    }

    function setTeamAddress(address addr) public onlyOwner returns (address) {
        _teamAddress = addr;
        return _teamAddress;
    }

    function setFreeAddress(address addr) public onlyOwner returns (bool) {
        _freeAddress[addr] = true;
        return _freeAddress[addr];
    }

    function delFreeAddress(address addr) public onlyOwner returns (bool) {
        _freeAddress[addr] = false;
        return _freeAddress[addr];
    }

    function getFreeAddress(address addr) public view returns (bool) {
        return _freeAddress[addr];
    }

    function approve(address _spender, uint256 _value) public override returns (bool success) {
        _approve(_msgSender(), _spender, _value);
        return true;
    }

    function balanceOf(address account) public view override returns (uint256) {
        if (_isExcluded[account]) return _tOwned[account];
        return tokenFromReflection(_rOwned[account]);
    }

    function allowance(address addr, address _spender) public view override returns (uint256 remaining) {
        return _allowed[addr][_spender];
    }

    function totalSupply() public view override returns (uint256) {
        return _tTotal;
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) private {
        require(owner != address(0), 'ERC20: approve from the zero address');
        require(spender != address(0), 'ERC20: approve to the zero address');

        _allowed[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function addLiquidityUsdt(uint256 tokenAmount, uint256 usdtAmount) private {
        // approve token transfer to cover all possible scenarios
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        usdt.approve(address(uniswapV2Router), usdtAmount);

        uniswapV2Router.addLiquidity(
            address(this),
            address(usdt),
            tokenAmount,
            usdtAmount,
            0,
            0,
            _blackHoleAddress,
            block.timestamp
        );
    }

    function swapTokensForUsdt(uint256 tokenAmount) private {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = address(usdt);

        _approve(address(this), address(uniswapV2Router), tokenAmount);

        // make the swap
        uniswapV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(wrap),
            block.timestamp
        );

        wrap.withdraw();
    }

    function setSwapAndLiquifyEnabled(bool _enabled) public onlyOwner {
        swapAndLiquifyEnabled = _enabled;
        emit SwapAndLiquifyEnabledUpdated(_enabled);
    }

    function getHealthLevel() private view returns (uint256) {
        uint256 bal = usdt.balanceOf(uniswapV2Pair);
        if (bal <= 100 * 10**4 * 10**18) {
            return 0;
        } else if (bal <= 300 * 10**4 * 10**18) {
            return 1;
        } else {
            return 2;
        }
    }

    function getFomoLevel() private view returns (uint256) {
        uint256 bal = usdt.balanceOf(_fomoAddress);
        if (bal <= 10 * 10**4 * 10**18) {
            return 0;
        } else if (bal <= 30 * 10**4 * 10**18) {
            return 1;
        } else {
            return 2;
        }
    }

    function transfer(address _to, uint256 _value) public override returns (bool success) {
        //  if(msg.sender==uniswapV2Pair){//zhuanru

        // }
        return _transfer(msg.sender, _to, _value);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public override returns (bool success) {
        // if(msg.sender==address(uniswapV2Router) ){//zhuanchu

        // }

        _transfer(_from, _to, _value);
        _approve(
            _from,
            _msgSender(),
            _allowed[_from][_msgSender()].sub(_value, 'ERC20: transfer amount exceeds allowance')
        );
        return true;
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _value
    ) private returns (bool success) {
        require(_from != address(0), 'ERC20: transfer from the zero address');
        require(_to != address(0), 'ERC20: transfer to the zero address');
        require(_value > 0, 'Transfer amount must be greater than zero');
        require(_value <= _maxTxAmount||_to == _blackHoleAddress ||_to == _nftAddress ||_to== uniswapV2Pair||_to==_teamAddress , 'Transfer amount exceeds the maxTxAmount.');

        uint256 contractTokenBalance = balanceOf(address(this));

        bool overMinTokenBalance = contractTokenBalance >= numTokensSellToAddToLiquidity;
        if (overMinTokenBalance && !inSwapAndLiquify && _from != uniswapV2Pair && swapAndLiquifyEnabled) {
            contractTokenBalance = numTokensSellToAddToLiquidity;
            //add liquidity
            swapAndLiquify(contractTokenBalance);
        }

        if (enterCount == 1) {
            if (_from == uniswapV2Pair && _value >= _fomoMin[getFomoLevel()] * 10**4 * 10**18) {
                IFomo(_fomoAddress).transferNotify(_to);
            }
            if (!inSwapAndLiquify && _from != uniswapV2Pair && _from != _fomoAddress) {
                IFomo(_fomoAddress).swap();
            }
        }

        return _transferEmit(_from, _to, _value);
    }

    function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {
        // split the contract balance into halves
        uint256 half = contractTokenBalance.div(2);
        uint256 otherHalf = contractTokenBalance.sub(half, 'sub half');

        // capture the contract's current ETH balance.
        // this is so that we can capture exactly the amount of ETH that the
        // swap creates, and not make the liquidity event include any ETH that
        // has been manually sent to the contract
        //uint256 initialBalance = address(this).balance;

        // swap tokens for ETH
        swapTokensForUsdt(half); // <- this breaks the ETH -> HATE swap when swap+liquify is triggered

        // how much ETH did we just swap into?
        // uint256 newBalance = address(this).balance.sub(initialBalance);
        uint256 usdtBalance = usdt.balanceOf(address(this));

        // add liquidity to uniswap
        addLiquidityUsdt(otherHalf, usdtBalance);

        emit SwapAndLiquify(half, usdtBalance, otherHalf);
    }

    function excludeFromReward(address account) public onlyOwner() {
        require(!_isExcluded[account], 'Account is already excluded');
        if (_rOwned[account] > 0) {
            _tOwned[account] = tokenFromReflection(_rOwned[account]);
        }
        _isExcluded[account] = true;
        _excluded.push(account);
    }

    function includeInReward(address account) external onlyOwner() {
        require(_isExcluded[account], 'Account is already excluded');
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (_excluded[i] == account) {
                _excluded[i] = _excluded[_excluded.length - 1];
                _tOwned[account] = 0;
                _isExcluded[account] = false;
                _excluded.pop();
                break;
            }
        }
    }

    function _getRValues(
        uint256 tAmount,
        uint256 tTransferAmount,
        uint256 tFee,
        uint256 currentRate
    )
        private
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rTransferAmount = tTransferAmount.mul(currentRate);
        uint256 rFee = tFee.mul(currentRate);
        return (rAmount, rTransferAmount, rFee);
    }

    function _getTValues(uint256 tAmount, bool free)
        private
        view
        returns (
            uint256 tTransferAmount,
            uint256 tDev,
            uint256 tFee,
            uint256 feeNFT
        )
    {
        if (free) {
            return (tAmount, 0, 0, 0);
        }
        uint256 healthLevel = getHealthLevel();
        tDev = tAmount.div(50);
        tFee = tAmount.mul(_ratioFee[healthLevel]).div(100);

        feeNFT = tAmount.mul(_ratioNFT[healthLevel]).div(100);
        tTransferAmount = tAmount.sub(tFee.mul(3)).sub(tDev).sub(feeNFT);
    }

    function _transferEmit(
        address _from,
        address _to,
        uint256 _value
    ) private returns (bool success) {
        if (_isExcluded[_from] && !_isExcluded[_to]) {
            _transferFromExcluded(_from, _to, _value);
        } else if (!_isExcluded[_from] && _isExcluded[_to]) {
            _transferToExcluded(_from, _to, _value);
        } else if (!_isExcluded[_from] && !_isExcluded[_to]) {
            _transferStandard(_from, _to, _value);
        } else if (_isExcluded[_from] && _isExcluded[_to]) {
            _transferBothExcluded(_from, _to, _value);
        } else {
            _transferStandard(_from, _to, _value);
        }
        return true;
    }

    function _transferStandard(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (uint256 tTransferAmount, uint256 tDev, uint256 tFee, uint256 feeNFT) = _getTValues(
            tAmount,
            _freeAddress[sender]
        );
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(
            tAmount,
            tTransferAmount,
            tFee,
            _getRate()
        );
        _rOwned[sender] = _rOwned[sender].sub(rAmount, 'sub1 rAmount');
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _reflectFee(rFee);
        _takeTax(tDev, tFee);

        if (tFee > 0 && _fomoAddress != address(0) && _nftAddress != address(0)) {
            tokensForUsdt(tFee, _fomoAddress);
            tokensForUsdt(feeNFT, _nftAddress);
            emit Transfer(sender, address(this), tFee); //seed fee
            emit Transfer(sender, _teamAddress, tDev); //seed fee
            emit Transfer(sender, _fomoAddress, tFee); //seed fee
            emit Transfer(sender, _nftAddress, feeNFT); //seed fee
        }
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferToExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (uint256 tTransferAmount, uint256 tDev, uint256 tFee, uint256 feeNFT) = _getTValues(
            tAmount,
            _freeAddress[sender]
        );
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(
            tAmount,
            tTransferAmount,
            tFee,
            _getRate()
        );
        _rOwned[sender] = _rOwned[sender].sub(rAmount, 'sub2 rAmount');
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _reflectFee(rFee);
        _takeTax(tDev, tFee);
        if (tFee > 0 && _fomoAddress != address(0) && _nftAddress != address(0)) {
            tokensForUsdt(tFee, _fomoAddress);
            tokensForUsdt(feeNFT, _nftAddress);
            emit Transfer(sender, address(this), tFee); //seed fee
            emit Transfer(sender, _teamAddress, tDev); //seed fee
            emit Transfer(sender, _fomoAddress, tFee); //seed fee
            emit Transfer(sender, _nftAddress, feeNFT); //seed fee
        }
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferFromExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (uint256 tTransferAmount, uint256 tDev, uint256 tFee, uint256 feeNFT) = _getTValues(
            tAmount,
            _freeAddress[sender]
        );
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(
            tAmount,
            tTransferAmount,
            tFee,
            _getRate()
        );
        _tOwned[sender] = _tOwned[sender].sub(tAmount, 'sub3 tAmount');
        _rOwned[sender] = _rOwned[sender].sub(rAmount, 'sub3 rAmount');
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _reflectFee(rFee);
        _takeTax(tDev, tFee);
        if (tFee > 0 && _fomoAddress != address(0) && _nftAddress != address(0)) {
            tokensForUsdt(tFee, _fomoAddress);
            tokensForUsdt(feeNFT, _nftAddress);
            emit Transfer(sender, address(this), tFee); //seed fee
            emit Transfer(sender, _teamAddress, tDev); //seed fee
            emit Transfer(sender, _fomoAddress, tFee); //seed fee
            emit Transfer(sender, _nftAddress, feeNFT); //seed fee
        }
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferBothExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (uint256 tTransferAmount, uint256 tDev, uint256 tFee, uint256 feeNFT) = _getTValues(
            tAmount,
            _freeAddress[sender]
        );

        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(
            tAmount,
            tTransferAmount,
            tFee,
            _getRate()
        );
        _tOwned[sender] = _tOwned[sender].sub(tAmount, 'sub4 tAmount');
        _rOwned[sender] = _rOwned[sender].sub(rAmount, 'sub4 rAmount');
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _reflectFee(rFee);
        _takeTax(tDev, tFee);
        if (tFee > 0 && _fomoAddress != address(0) && _nftAddress != address(0)) {
            tokensForUsdt(tFee, _fomoAddress);
            tokensForUsdt(feeNFT, _nftAddress);
            emit Transfer(sender, address(this), tFee); //seed fee
            emit Transfer(sender, _teamAddress, tDev); //seed fee
            emit Transfer(sender, _fomoAddress, tFee); //seed fee
            emit Transfer(sender, _nftAddress, feeNFT); //seed fee
        }
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function tokensForUsdt(uint256 tokenAmount, address recipient) private {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = address(usdt);

        _approve(address(this), address(uniswapV2Router), tokenAmount);

        // make the swap
        uniswapV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            recipient,
            block.timestamp
        );
    }

    function _reflectFee(uint256 rFee) private {
        _rTotal = _rTotal.sub(rFee, 'reflect fee');
    }

    function _takeTax(uint256 tDev, uint256 tFee) private {
        uint256 currentRate = _getRate();
        uint256 rLiquidity = tFee.mul(currentRate);
        // uint256 rFomo = tFomo.mul(currentRate);
        uint256 rDev = tDev.mul(currentRate);

        _rOwned[address(this)] = _rOwned[address(this)].add(rLiquidity);
        if (_isExcluded[address(this)]) {
            _tOwned[address(this)] = _tOwned[address(this)].add(tFee);
        }
        _rOwned[_teamAddress] = _rOwned[_teamAddress].add(rDev);
        if (_isExcluded[_teamAddress]) {
            _tOwned[_teamAddress] = _tOwned[_teamAddress].add(tDev);
        }
    }

    function tokenFromReflection(uint256 rAmount) private view returns (uint256) {
        require(rAmount <= _rTotal, 'Amount must be less than total reflections');
        return rAmount.div(_getRate());
    }

    function _getRate() private view returns (uint256) {
        //
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        return rSupply.div(tSupply);
    }

    function _getCurrentSupply() private view returns (uint256, uint256) {
        //
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (_rOwned[_excluded[i]] > rSupply || _tOwned[_excluded[i]] > tSupply) return (_rTotal, _tTotal);
            rSupply = rSupply.sub(_rOwned[_excluded[i]], 'sub rSupply');
            tSupply = tSupply.sub(_tOwned[_excluded[i]], 'sub tSupply');
        }
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }
}