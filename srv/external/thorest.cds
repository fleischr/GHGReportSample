/* checksum : 41b1030f56aeedf3af54fa3e375e7681 */
@Capabilities.BatchSupported : false
@Capabilities.KeyAsSegmentSupported : true
@Core.Description : 'Thorest'
@Core.SchemaVersion : '2.1.0'
@Core.LongDescription : ```
RESTful API to access VeChain Thor Network

[Project Home](https://github.com/vechain/thor)

```
service Thorest {};

@Common.Label : 'Accounts'
@Core.Description : 'Retrieve account detail'
@Core.LongDescription : ```
includes \`balance\`, \`energy\` and \`hasCode\`, by account \`address\`. An account with \`hasCode\` be *true* is a contract.

Historical account detail can be queried by specifying \`revision\` query string.

```
@openapi.path : '/accounts/{address}'
function Thorest.accounts_(
  @description : 'address of account'
  @openapi.in : 'path'
  address : String,
  @description : 'can be block number or ID. best block is assumed if omitted.'
  @openapi.in : 'query'
  revision : String
) returns Thorest_types.Account;

@Common.Label : 'Accounts'
@Core.Description : 'Execute account code'
@Core.LongDescription : ```
to simulate contract method call, without sending transaction to block chain.

It's useful to estimate gas usage and execution result of a clause.

```
@openapi.path : '/accounts/{address}'
action Thorest.accounts__post(
  @description : 'address of account'
  @openapi.in : 'path'
  address : String,
  @description : 'can be block number or ID. best block is assumed if omitted.'
  @openapi.in : 'query'
  revision : String,
  @openapi.in : 'body'
  body : Thorest_types.CallData
) returns Thorest_types.CallResult;

@Common.Label : 'Accounts'
@Core.Description : 'Execute a batch of codes'
@Core.LongDescription : `to simulate execution of a transaction.
`
@openapi.path : '/accounts/*'
action Thorest.accounts___post(
  @description : 'can be block number or ID. best block is assumed if omitted.'
  @openapi.in : 'query'
  revision : String,
  @openapi.in : 'body'
  body : Thorest.anonymous.type0
) returns Thorest_types.BatchCallResult;

@Common.Label : 'Accounts'
@Core.Description : 'Execute bytecodes'
@Core.LongDescription : ```
to simulate contract deployment without sending transaction to block chain.

It's useful to estimate gas usage and contract deployment result of a clause.

### TIPS:
  - \`data\` in request body is the bytecodes of a contract
  - \`data\` in response body is the runtime bytecodes assigned to account which the contract to be deployed

```
@openapi.path : '/accounts'
action Thorest.accounts_post(
  @description : 'can be block number or ID. best block is assumed if omitted.'
  @openapi.in : 'query'
  revision : String,
  @openapi.in : 'body'
  body : Thorest_types.CallData
) returns Thorest_types.CallResult;

@Common.Label : 'Accounts'
@Core.Description : 'Retrieve account code'
@Core.LongDescription : `if any. Here the code is runtime bytecodes.
`
@openapi.path : '/accounts/{address}/code'
function Thorest.accounts__code(
  @description : 'address of account'
  @openapi.in : 'path'
  address : String,
  @description : 'can be block number or ID. best block is assumed if omitted.'
  @openapi.in : 'query'
  revision : String
) returns Thorest_types.Code;

@Common.Label : 'Accounts'
@Core.Description : 'Retrieve account storage value'
@Core.LongDescription : `for given key.
`
@openapi.path : '/accounts/{address}/storage/{key}'
function Thorest.accounts__storage_(
  @description : 'address of account'
  @openapi.in : 'path'
  address : String,
  @description : 'the key(position) to access account storage'
  @openapi.in : 'path'
  ![key] : String,
  @description : 'can be block number or ID. best block is assumed if omitted.'
  @openapi.in : 'query'
  revision : String
) returns Thorest_types.Storage;

@Common.Label : 'Transactions'
@Core.Description : 'Retrieve transaction'
@Core.LongDescription : `by ID. When \`pending\` is true, a pending tx with null \`meta\` might be returned.
`
@openapi.path : '/transactions/{id}'
function Thorest.transactions_(
  @description : 'ID of transaction'
  @openapi.in : 'path'
  id : String,
  @description : 'whether retrieve a raw transaction.'
  @openapi.in : 'query'
  raw : Boolean,
  @description : 'ID of head block. best block is assumed if omitted'
  @openapi.in : 'query'
  head : String,
  @description : `whether to return tx, even it's pending
`
  @openapi.in : 'query'
  pending : Boolean
) returns {
  meta : Thorest_types.TxMeta;
};

@Common.Label : 'Transactions'
@Core.Description : 'Retrieve transaction receipt'
@Core.LongDescription : `by ID.
`
@openapi.path : '/transactions/{id}/receipt'
function Thorest.transactions__receipt(
  @description : 'ID of transaction'
  @openapi.in : 'path'
  id : String,
  @description : 'ID of head block. best block is assumed if omitted'
  @openapi.in : 'query'
  head : String
) returns Thorest.anonymous.type1;

@Common.Label : 'Transactions'
@Core.Description : 'Commit transaction'
@Core.LongDescription : `in raw.
`
@openapi.path : '/transactions'
action Thorest.transactions_post(
  @openapi.in : 'body'
  body : Thorest_types.RawTx
) returns Thorest_types.TXID;

@Common.Label : 'Blocks'
@Core.Description : 'Retrieve block'
@Core.LongDescription : `by ID or number, or 'best' for latest block or 'finalized' for finalized block. If \`expanded\` query option is true, all transactions along with
their receipts will be embedded under \`transactions\` field instead of ids.
`
@openapi.path : '/blocks/{revision}'
function Thorest.blocks_(
  @description : `block ID or number, or 'best' stands for latest block, or 'finalized' stands for finalized block
`
  @openapi.in : 'path'
  revision : String,
  @description : `whether the returned block is expanded.
`
  @openapi.in : 'query'
  expanded : Boolean
) returns {
  @description : 'embedded transactions along with their receipts'
  transactions : many Thorest.anonymous.type3;
};

@Common.Label : 'Logs'
@Core.Description : 'Filter event logs'
@Core.LongDescription : `Event logs are produced by \`OP_LOG\` in EVM.
`
@openapi.path : '/logs/event'
action Thorest.logs_event_post(
  @openapi.in : 'body'
  body : Thorest_types.EventFilter
) returns many Thorest.anonymous.type4;

@Common.Label : 'Logs'
@Core.Description : 'Filter transfer logs'
@Core.LongDescription : `Transfer logs are recorded on VET transferring.
`
@openapi.path : '/logs/transfer'
action Thorest.logs_transfer_post(
  @openapi.in : 'body'
  body : Thorest_types.TransferFilter
) returns many Thorest.anonymous.type5;

@Common.Label : 'Node'
@Core.Description : 'Retrieve connected peers'
@openapi.path : '/node/network/peers'
function Thorest.node_network_peers() returns many Thorest_types.PeerStats;

@Common.Label : 'Subscriptions'
@Core.Description : '(Websocket) Subscribe new blocks'
@openapi.path : '/subscriptions/block'
function Thorest.subscriptions_block(
  @description : `a saved block ID for resuming the subscription. best block ID is assumed if omitted.
`
  @openapi.in : 'query'
  pos : String
) returns Thorest.anonymous.type7;

@Common.Label : 'Subscriptions'
@Core.Description : '(Websocket) Subscribe new events'
@Core.LongDescription : `which satisfy criteria in query.
`
@openapi.path : '/subscriptions/event'
function Thorest.subscriptions_event(
  @description : `a saved block ID for resuming the subscription. best block ID is assumed if omitted.
`
  @openapi.in : 'query'
  pos : String,
  @description : 'address of event emitter'
  @openapi.in : 'query'
  addr : String,
  @description : 'topic0 of event'
  @openapi.in : 'query'
  t0 : String,
  @description : 'topic1 of event'
  @openapi.in : 'query'
  t1 : String,
  @description : 'topic2 of event'
  @openapi.in : 'query'
  t2 : String,
  @description : 'topic3 of event'
  @openapi.in : 'query'
  t3 : String,
  @description : 'topic4 of event'
  @openapi.in : 'query'
  t4 : String
) returns Thorest.anonymous.type8;

@Common.Label : 'Subscriptions'
@Core.Description : '(Websocket) Subscribe new transfers'
@Core.LongDescription : `which satisfy criteria in query.
`
@openapi.path : '/subscriptions/transfer'
function Thorest.subscriptions_transfer(
  @description : `a saved block ID for resuming the subscription. best block ID is assumed if omitted.
`
  @openapi.in : 'query'
  pos : String,
  @description : 'signer address of tx which contains the transfer'
  @openapi.in : 'query'
  txOrigin : String,
  @description : 'address of token sender'
  @openapi.in : 'query'
  sender : String,
  @description : 'address of token recipient'
  @openapi.in : 'query'
  recipient : String
) returns Thorest.anonymous.type9;

@Common.Label : 'Subscriptions'
@Core.Description : '(Websocket) Subscribe block chain''s beats'
@Core.LongDescription : `which contain summary of new blocks, and bloom filters that composited with affected addresses.
`
@openapi.path : '/subscriptions/beat'
function Thorest.subscriptions_beat(
  @description : `a saved block ID for resuming the subscription. best block ID is assumed if omitted.
`
  @openapi.in : 'query'
  pos : String
) returns Thorest.anonymous.type10;

@Common.Label : 'Subscriptions'
@Core.Description : '(Websocket) Subscribe block chain''s beats'
@Core.LongDescription : `which contain summary of new blocks, and bloom filters that composited with affected addresses.
`
@openapi.path : '/subscriptions/beat2'
function Thorest.subscriptions_beat2(
  @description : `a saved block ID for resuming the subscription. best block ID is assumed if omitted.
`
  @openapi.in : 'query'
  pos : String
) returns Thorest.anonymous.type11;

@Common.Label : 'Subscriptions'
@Core.Description : '(Websocket) Subscribe to new transactions'
@Core.LongDescription : `which is in pending state.
`
@openapi.path : '/subscriptions/txpool'
function Thorest.subscriptions_txpool() returns Thorest_types.TXID;

@Common.Label : 'Debug'
@Core.Description : 'Create a tracer'
@Core.LongDescription : 'for a clause'
@openapi.path : '/debug/tracers'
action Thorest.debug_tracers_post(
  @openapi.in : 'body'
  body : Thorest.anonymous.type12
) returns { };

@Common.Label : 'Debug'
@Core.Description : 'Create a tracer'
@Core.LongDescription : 'for evaluating a method call'
@openapi.path : '/debug/tracers/call'
action Thorest.debug_tracers_call_post(
  @description : 'ID of head block. best block is assumed if omitted'
  @openapi.in : 'query'
  head : String,
  @openapi.in : 'body'
  body : Thorest.anonymous.type13
) returns { };

@Common.Label : 'Debug'
@Core.Description : 'Retrieve storage range'
@Core.LongDescription : `of the account with given address
`
@openapi.path : '/debug/storage-range'
action Thorest.debug_storage_range_post(
  @openapi.in : 'body'
  body : Thorest_types.StorageRangeOption
) returns Thorest_types.StorageRange;

type Thorest_types.Account {
  @description : 'balance in unit WEI, presented with hex string'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x47ff1f90327aa0f8e'
  balance : String;
  @description : 'energy in uint WEI, presented with hex string'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xcf624158d591398'
  energy : String;
  @description : 'whether the account has code'
  hasCode : Boolean;
};

type Thorest_types.Code {
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x6060604052600080fd00a165627a7a72305820c23d3ae2dc86ad130561a2829d87c7cb8435365492bd1548eb7e7fc0f3632be90029'
  code : String;
};

type Thorest_types.Storage {
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0000000000000000000000000000000000000000000000000000000000000001'
  value : String;
};

@description : 'transaction meta info'
type Thorest_types.TxMeta {
  @description : 'block identifier (bytes32)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0004f6cc88bb4626a92907718e82f255b8fa511453a78e8797eb8cea3393b215'
  blockID : String;
  @description : 'block number (height)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 325324
  blockNumber : Integer;
  @description : 'block unix timestamp'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 1533267900
  blockTimestamp : Integer;
};

@description : 'tx receipt meta info'
type Thorest_types.ReceiptMeta {
  @description : 'block identifier (bytes32)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0004f6cc88bb4626a92907718e82f255b8fa511453a78e8797eb8cea3393b215'
  blockID : String;
  @description : 'block number (height)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 325324
  blockNumber : Integer;
  @description : 'block unix timestamp'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 1533267900
  blockTimestamp : Integer;
  @description : 'transaction identifier'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x284bba50ef777889ff1a367ed0b38d5e5626714477c40de38d71cedd6f9fa477'
  txID : String;
  @description : 'transaction origin (signer)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xdb4027477b2a8fe4c83c6dafe7f86678bb1b8a8d'
  txOrigin : String;
};

@description : 'event or transfer log meta info'
type Thorest_types.LogMeta {
  @description : 'block identifier (bytes32)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0004f6cc88bb4626a92907718e82f255b8fa511453a78e8797eb8cea3393b215'
  blockID : String;
  @description : 'block number (height)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 325324
  blockNumber : Integer;
  @description : 'block unix timestamp'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 1533267900
  blockTimestamp : Integer;
  @description : 'transaction identifier'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x284bba50ef777889ff1a367ed0b38d5e5626714477c40de38d71cedd6f9fa477'
  txID : String;
  @description : 'transaction origin (signer)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xdb4027477b2a8fe4c83c6dafe7f86678bb1b8a8d'
  txOrigin : String;
  @description : 'index of clause which generates this log'
  clauseIndex : Integer;
};

type Thorest_types.Block {
  @description : 'block number (height)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 325324
  number : Integer;
  @description : 'block identifier'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0004f6cc88bb4626a92907718e82f255b8fa511453a78e8797eb8cea3393b215'
  id : String;
  @description : 'RLP encoded block size in bytes'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 373
  size : Integer;
  @description : 'parent block ID'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0004f6cb730dbd90fed09d165bfdf33cc0eed47ec068938f6ee7b7c12a4ea98d'
  parentID : String;
  @description : 'block unix timestamp'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 1533267900
  timestamp : Integer;
  @description : 'block gas limit (max allowed accumulative gas usage of transactions)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 11253579
  gasLimit : Integer;
  @description : 'address of account to receive block reward'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xb4094c25f86d628fdd571afc4077f0d0196afb48'
  beneficiary : String;
  @description : 'accumulative gas usage of transactions'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 21000
  gasUsed : Integer;
  @description : 'sum of all ancestral blocks'' score'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 1029988
  totalScore : Integer;
  @description : 'root hash of transactions in the block'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x89dfd9fcd10c9e53d68592cf8b540b280b72d381b868523223992f3e09a806bb'
  txsRoot : String;
  @description : 'supported txs features bitset'
  txsFeatures : Integer;
  @description : 'root hash of accounts state'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x86bcc6d214bc9d8d0dedba1012a63c8317d19ce97f60c8a2ef5c59bbd40d4261'
  stateRoot : String;
  @description : 'root hash of transaction receipts'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x15787e2533c470e8a688e6cd17a1ee12d8457778d5f82d2c109e2d6226d8e54e'
  receiptsRoot : String;
  @description : 'whether the block signer voted COM(Commit) in BFT'
  com : Boolean;
  @description : 'the one who signed this block'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xab7b27fc9e7d29f9f2e5bd361747a5515d0cc2d1'
  signer : String;
};

type Thorest_types.Clause {
  @description : 'recipient of clause, null for contract deployment (bytes32)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x5034aa590125b64023a0262112b98d72e3c8e40e'
  to : String;
  @description : 'hex form of token to be transferred'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x47fdb3c3f456c0000'
  value : String;
  @description : 'input data (bytes)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x'
  data : String;
};

type Thorest_types.Tx {
  @description : 'identifier of the transaction'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x284bba50ef777889ff1a367ed0b38d5e5626714477c40de38d71cedd6f9fa477'
  id : String;
  @description : 'the one who signed the transaction'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xdb4027477b2a8fe4c83c6dafe7f86678bb1b8a8d'
  origin : String;
  @description : 'the delegator who paid the gas fee'
  delegator : String;
  @description : 'byte size of the transaction that is RLP encoded'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 130
  size : Integer;
  @description : 'last byte of genesis block ID'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 39
  chainTag : Integer;
  @description : '8 bytes prefix of some block ID'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0004f6cb730dbd90'
  blockRef : String;
  @description : 'expiration relative to blockRef, in unit block'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 720
  expiration : Integer;
  clauses : many Thorest_types.Clause;
  @description : 'coefficient used to calculate the final gas price'
  gasPriceCoef : Integer;
  @description : 'max amount of gas can be consumed to execute this transaction'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 21000
  gas : Integer;
  @description : 'ID of the transaction on which the current transaction depends on. can be null.'
  dependsOn : String;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x29c257e36ea6e72a'
  nonce : String;
};

type Thorest_types.RawTx {
  @description : 'hex form of encoded transaction'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xf86981ba800adad994000000000000000000000000000000000000746f82271080018252088001c0b8414792c9439594098323900e6470742cd877ec9f9906bca05510e421f3b013ed221324e77ca10d3466b32b1800c72e12719b213f1d4c370305399dd27af962626400'
  raw : String;
};

type Thorest_types.Event {
  @description : 'the address of contract which produces the event (bytes20)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x7567d83b7b8d80addcb281a71d54fc7b3364ffed'
  address : String;
  topics : many Thorest.anonymous.type14;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x4de71f2d588aa8a1ea00fe8312d92966da424d9939a511fc0be81e65fad52af8'
  data : String;
};

type Thorest_types.Transfer {
  @description : 'address that sends tokens'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xdb4027477b2a8fe4c83c6dafe7f86678bb1b8a8d'
  sender : String;
  @description : 'address that receives tokens'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x5034aa590125b64023a0262112b98d72e3c8e40e'
  recipient : String;
  @description : 'amount of tokens'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x47fdb3c3f456c0000'
  amount : String;
};

type Thorest_types.Receipt {
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 21000
  gasUsed : Integer;
  @description : 'address of account who paid used gas'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xdb4027477b2a8fe4c83c6dafe7f86678bb1b8a8d'
  gasPayer : String;
  @description : 'hex form of amount of paid energy'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x1236efcbcbb340000'
  paid : String;
  @description : 'hex form of amount of reward'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x576e189f04f60000'
  reward : String;
  @description : 'true means the transaction was reverted'
  reverted : Boolean;
  outputs : many {
    @description : `deployed contract address, if the corresponding clause is a
contract deployment clause
`
    contractAddress : String;
    events : many Thorest_types.Event;
    transfers : many Thorest_types.Transfer;
  };
};

type Thorest_types.CallData {
  @description : 'amount of token to be transferred'
  value : String;
  @description : 'input data for contract call'
  data : String;
  @description : 'max allowed gas for execution'
  gas : Integer;
  @description : 'absolute gas price'
  gasPrice : String;
  @description : 'caller address (msg.sender)'
  caller : String;
};

type Thorest_types.ExtendedCallData {
  @description : 'tx proved work(for extension contract)'
  provedWork : String;
  @description : 'gas payer(for extension contract)'
  gasPayer : String;
  @description : 'tx expiration(for extension contract)'
  expiration : Integer;
  @description : 'block reference(for extension contract)'
  blockRef : String;
};

type Thorest_types.CallResult {
  @description : 'the output data'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x103556a73c10e38ffe2fc4aa50fc9d46ad0148f07e26417e117bd1ece9d948b5'
  data : String;
  events : many Thorest_types.Event;
  transfers : many Thorest_types.Transfer;
  @description : 'gas used during execution'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 21000
  gasUsed : Integer;
  reverted : Boolean;
  vmError : String;
};

type Thorest_types.BatchCallData {
  clauses : many Thorest_types.Clause;
  @description : 'max allowed gas for execution'
  gas : Integer;
  @description : 'absolute gas price'
  gasPrice : String;
  @description : 'caller address (msg.sender)'
  caller : String;
};

type Thorest_types.BatchCallResult : many Thorest_types.CallResult;

@description : ```
pass these parameters if you need filtered results paged. e.g. 
\`\`\`
{
  "options": {
    "offset": 0,
    "limit": 10   
  }
}
\`\`\`
the above refers that page offset is 0, and the page size is 10.
pass options \`null\` if you don't need to demand paging.

```
type Thorest_types.FilterOptions {
  @description : `offset in matched record set
`
  offset : Integer;
  @description : `limit of records to output
`
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 10
  limit : Integer;
};

@description : ```
defines the range to filter in. e.g.
\`\`\`
{
  "range": {
    "unit": "block",
    "from": 10,
    "to": 1000
  }
}
\`\`\`
refers to the range from block 10 to block 1000.
\`null\` stands for the full range.
    

```
type Thorest_types.FilterRange {
  @description : `defines the unit of \`from\` and \`to\`.
\`block\` means block number, \`time\` means block timestamp, default to \`block\`.
`
  @assert.range : true
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 'block'
  unit : String enum {
    block;
    time;
  };
  ![from] : Integer;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 100000
  to : Integer;
};

@description : ```
criteria to filter out event. All fields are joined with \`and\` operator. \`null\` field are ignored. e.g. 
\`\`\`
{
  "address": "0x0000000000000000000000000000456E65726779",
  "topic0": "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"
}
\`\`\`
matches events emitted by \`0xe59d475abe695c7f67a8a2321f33a856b0b4c71d\` and with \`topic0\` equals \`0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef\`.

```
type Thorest_types.EventCriteria {
  @description : 'address of event emitter'
  address : String;
  topic0 : String;
  topic1 : String;
  topic2 : String;
  topic3 : String;
  topic4 : String;
};

type Thorest_types.EventFilter {
  range : Thorest_types.FilterRange;
  options : Thorest_types.FilterOptions;
  criteriaSet : many Thorest_types.EventCriteria;
  @description : `order of filters, defaults to \`asc\`
`
  @assert.range : true
  order : String enum {
    asc;
    desc;
  };
};

type Thorest_types.TransferCriteria {
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xe59d475abe695c7f67a8a2321f33a856b0b4c71d'
  txOrigin : String;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xe59d475abe695c7f67a8a2321f33a856b0b4c71d'
  sender : String;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x7567d83b7b8d80addcb281a71d54fc7b3364ffed'
  recipient : String;
};

type Thorest_types.TransferFilter {
  range : Thorest_types.FilterRange;
  options : Thorest_types.FilterOptions;
  criteriaSet : many Thorest_types.TransferCriteria;
  @description : `order of filters, defaults to \`asc\`
`
  @assert.range : true
  order : String enum {
    asc;
    desc;
  };
};

type Thorest_types.PeerStats {
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 'thor/v1.0.0-6680b98-dev/linux/go1.10.3'
  name : String;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x000087b3a4d4cdf1cc52d56b9704f4c18f020e1b48dbbf4a23d1ee4f1fa5ff94'
  bestBlockID : String;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 68497
  totalScore : Integer;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '50e122a505ee55b84331068acfd857e37ad58f463a0fab9aaff2c1e4b2e2d22ae71dc14fdaf6eead74bd3f60594644aa35c588f9ca6be3341e2ce18ddc413321'
  peerID : String;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '128.1.39.120:11235'
  netAddr : String;
  inbound : Boolean;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 28
  duration : Integer;
};

type Thorest_types.TXID {
  id : String;
};

type Thorest_types.Obsolete {
  @description : `indicates whether the block containing this data become branch block
`
  obsolete : Boolean;
};

type Thorest_types.ClauseTracerOption {
  @description : ```
  the unified path of target to be traced.
  Currently, only clause is supported. Format:
  \`blockID/(txIndex|txId)/clauseIndex\`
  
  ```
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x000dabb4d6f0a80ad7ad7cd0e07a1f20b546db0730d869d5ccb0dd2a16e7595b/0/0'
  target : String;
};

type Thorest_types.TracerOption {
  @description : `name of tracer. Empty name stands for default struct logger tracer.
`
  @assert.range : true
  name : String enum {
    _ = '';
    _4byte = '4byte';
    call;
    noop;
    prestate;
    unigram;
    bigram;
    trigram;
    evmdis;
    opcount;
  };
  @description : `configuration of tracer. It is tracer specific.
`
  config : { };
};

type Thorest_types.StorageRangeOption {
  @description : `address of account
`
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0xa4627036e2095eb71c2341054daa63577c062498'
  address : String;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0000000000000000000000000000000000000000000000000000000000000000'
  keyStart : String;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 10
  maxResult : Decimal;
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x000edefb448685f9c72fc2b946980ef51d8d208bbaa4d3fdcf0c57d4847aca2e/0/0'
  target : String;
};

type Thorest_types.StorageRange {
  nextKey : String;
  storage : { };
};

type Thorest_types.Beat {
  @description : 'block number (height)'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 325324
  number : Integer;
  @description : 'block identifier'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0004f6cc88bb4626a92907718e82f255b8fa511453a78e8797eb8cea3393b215'
  id : String;
  @description : 'parent block ID'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x0004f6cb730dbd90fed09d165bfdf33cc0eed47ec068938f6ee7b7c12a4ea98d'
  parentID : String;
  @description : 'block unix timestamp'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 1533267900
  timestamp : Integer;
  @description : 'supported txs features bitset'
  txsFeatures : Integer;
  @description : `the bloom filter composited with affected addresses
`
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
  bloom : String;
  @description : `the number of hash functions for bloom filter
`
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 3
  k : Integer;
};

type Thorest_types.Beat2 : Thorest_types.Beat {
  @description : 'block gas limit'
  @Core.Example.$Type : 'Core.PrimitiveExampleValue'
  @Core.Example.Value : 12000000
  gasLimit : Integer;
};

type Thorest_types.IsTrunk {
  @description : 'whether the block is on the trunk'
  isTrunk : Boolean;
};

type Thorest_types.IsFinalized {
  @description : 'whether the block is finalized'
  isFinalized : Boolean;
};

type Thorest.anonymous.type0 : Thorest_types.BatchCallData, Thorest_types.ExtendedCallData { };

type Thorest.anonymous.type1 : Thorest_types.Receipt {
  meta : Thorest_types.ReceiptMeta;
};

@Core.Example.$Type : 'Core.PrimitiveExampleValue'
@Core.Example.Value : '0x284bba50ef777889ff1a367ed0b38d5e5626714477c40de38d71cedd6f9fa477'
type Thorest.anonymous.type2 : String;

type Thorest.anonymous.type3 : Thorest_types.Tx, Thorest_types.Receipt { };

type Thorest.anonymous.type4 : Thorest_types.Event {
  meta : Thorest_types.LogMeta;
};

type Thorest.anonymous.type5 : Thorest_types.Transfer {
  meta : Thorest_types.LogMeta;
};

@Core.Example.$Type : 'Core.PrimitiveExampleValue'
@Core.Example.Value : '0x284bba50ef777889ff1a367ed0b38d5e5626714477c40de38d71cedd6f9fa477'
type Thorest.anonymous.type6 : String;

type Thorest.anonymous.type7 : Thorest_types.Block, Thorest_types.Obsolete {
  @description : 'transaction IDs'
  transactions : many Thorest.anonymous.type6;
};

type Thorest.anonymous.type8 : Thorest_types.Event, Thorest_types.Obsolete {
  meta : Thorest_types.LogMeta;
};

type Thorest.anonymous.type9 : Thorest_types.Transfer, Thorest_types.Obsolete {
  meta : Thorest_types.LogMeta;
};

type Thorest.anonymous.type10 : Thorest_types.Beat, Thorest_types.Obsolete { };

type Thorest.anonymous.type11 : Thorest_types.Beat2, Thorest_types.Obsolete { };

type Thorest.anonymous.type12 : Thorest_types.ClauseTracerOption, Thorest_types.TracerOption { };

type Thorest.anonymous.type13 : Thorest_types.TracerOption, Thorest_types.CallData, Thorest_types.ExtendedCallData { };

@Core.Example.$Type : 'Core.PrimitiveExampleValue'
@Core.Example.Value : '0x4de71f2d588aa8a1ea00fe8312d92966da424d9939a511fc0be81e65fad52af8'
type Thorest.anonymous.type14 : String;

