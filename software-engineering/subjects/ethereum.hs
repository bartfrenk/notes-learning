type Scalar = ()
type Address = ()
type Hash = ()
type Signature = ()
type Byte = ()
type EVMCodeFragment = ()
type Serialized = ()
newtype Wei = Wei Scalar

class RLP s where
  computeRLP :: t -> s

data Set a

-- Keccak hash function
hashFunction :: [s] -> Hash
hashFunction = undefined -- this is Keccak

class WorldState w where
  accountRegister :: w -> Address -> AccountState
  collapseWorldState :: w -> Set (Hash, RLP AccountState)

-- maintained in a 'modified Merkle Patricia tree', to ensure:
-- 1. hash of the root node is a secure identity for the world state
data MerkelPatriciaWorldState = MerkelPatriciaWorldState

instance WorldState MerkelPatriciaWorldState where
  accountRegister = undefined
  collapseWorldState = undefined

data AccountState = AccountState {
  accountNonce :: Scalar,    -- number of transactions sent from this address (n)
  accountBalance :: Scalar,  -- number of Wei owned by the user (b)
  storageRoot :: Hash,       -- hash of the root node of a MP tree that encodes the storage content
                             -- of the account (s)
  codeHash :: Hash           -- hash of the 'EVM code' of this account (c)
}

-- EVM code = code that gets executed should this address receive a message call.

-- simple account, sometimes referred to as a "non-contract" account
isSimpleAccount :: AccountState -> Bool
isSimpleAccount account = codeHash account == hashFunction []

data CommonTransactionData = CommonTransactionData {
  transactionNonce :: Scalar,  -- number of transactions sent by the sender (n)
  gasPrice :: Scalar,          -- the number of Wei to be paid per unit of gas (p)
  gasLimit :: Scalar,          -- the maximum amount of gas that should be used
                               -- in executing this transaction (g)
  to :: Address,               -- address of the recipient (t)
  value :: Scalar,             -- Wei transferred to the message call's recipient
  v :: Signature,              -- see Appendix F
  r :: Signature,
  s :: Signature
  }

type InputData = [Byte]
data Transaction = ResultInMessageCall CommonTransactionData InputData
                 | ResultInNewAccount CommonTransactionData EVMCodeFragment

-- header
-- comprised transactions (T)
-- ommer headers
type OmmerSet = Set BlockHeader
data Block = Block BlockHeader [Transaction] OmmerSet

data BlockHeader = BlockHeader {
  parentHash :: Hash,     -- hash of the parent's block header (p)
  ommersHash :: Hash,     -- hash of the Ommer set (o)
  beneficiary :: Address, -- address to which mining fees are transferred (c)
  stateRoot :: Hash, -- hash of the root node of the state tree after
                     -- transactions are applied (r)
  transactionsRoot :: Hash, -- (t)
  receiptsRoot :: Hash, -- (e)
  logsBloom :: String, -- Bloom filter (b)
  difficulty :: Scalar, -- (d)
  number :: Scalar, -- number of ancestor blocks (i)
  bhGasLimit :: Scalar, -- (l)
  gasUsed :: Scalar, -- (g)
  timestamps :: Scalar, -- output of time() (s)
  extraData :: [Byte], -- (x)
  mixHash :: Hash, -- (m)
  blockHeaderNonce :: Hash -- (n)
  }

data TransactionReceipt = TransactionReceipt {
  postTransactionState :: (), -- post-transaction state
  cumulativeGasUsedInBlock :: Scalar, --
  logsCreated :: (), --
  logBloomFilter :: (),
  }

-- serialization mechanism for product types
