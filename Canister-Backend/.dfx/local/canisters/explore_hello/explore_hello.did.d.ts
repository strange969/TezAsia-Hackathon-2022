import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'faucet' : ActorMethod<[], bigint>,
  'getminer' : ActorMethod<[], bigint>,
  'hola' : ActorMethod<[], Principal>,
  'ishold' : ActorMethod<[Principal, bigint], Array<bigint>>,
  'isminer' : ActorMethod<[Principal], bigint>,
  'lock' : ActorMethod<[Array<bigint>], bigint>,
  'mint' : ActorMethod<[bigint], bigint>,
  'wallet_balance' : ActorMethod<[], bigint>,
}
