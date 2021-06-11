Defily Farm #Yieldfarming
----------
Is Ownable as defined in these [docs](https://docs.openzeppelin.com/contracts/2.x/api/ownership).

This is the Defily farm where various LP tokens can be used to farm DFL:
- `defilyToken()` returns the DFL token address
- `devaddr()` returns the dev address (NOT THE SAME AS OWNER)
- `bonusEndBlock()` returns the end of the bonus block. No bonus in current deployment
- `rewardPerBlock()` returns the number of DFL emited per block
- `BONUS_MULTIPLIER()` returns 1
- `poolInfo()` Returns pool info struct for a particular farming pool. Struct data is defined bellow
- - `lpToken` the address of the LP token for the pool
- - `allocPoint` DFL weight setting to distribute per block.
- - `lastRewardBlock` Last block number that DFL distribution occurs.
- - `accRewardPerShare` DFL distributed per share of pool times e12
- `userInfo()` Returns struct for a particular user see bellow
- - `amount` How many LP tokens provided by the user
- - `rewardDebt` DFL reward owed to user
- `totalAllocPoint()` sum of allocation points in all pools
- `startBlock()` start of farming
- `poolLength()` returns the number of pools made
- `add(uint256 _allocPoint, IERC20 _lpToken, bool _withUpdate)` creates a new pool with the allocation points and token specified. Only for owner to call.
- `set(uint256 _pid, uint256 _allocPoint, bool _withUpdate)` changes a pool (PIDs) allocation points only owner
- `setMigrator(IMigratorChef _migrator)` sets migrator contract in case of migration. Only owner
- `migrate(uint256 _pid)` Anyone can call. Migrates a pool according to migrator's rules
- `getMultiplier(uint256 _from, uint256 _to)` returns rewards if BONUS_MULTIPLIER accross blocks
- `pendingRewards(uint256 _pid, address _user)` returns the DFL ready to be claimed for a user at a particular pool
- `massUpdatePools()` updates all the pools with rewards
- `updatePool(uint256 _pid)` updates a single pool
- `deposit(uint256 _pid, uint256 _amount)` user calls and deposits LP into a pool to start farming DFL
- `withdraw(uint256 _pid, uint256 _amount)` Withdraw deposited LP tokens
- `emergencyWithdraw(uint256 _pid)` withdraw with no rewards in case of emergency
- `dev(address _devaddr)` update the dev address
