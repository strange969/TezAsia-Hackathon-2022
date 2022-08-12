import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'faucet' : ActorMethod<[], bigint>,
  'getCoin' : ActorMethod<[], Array<bigint>>,
  'getminer' : ActorMethod<[], bigint>,
  'hola' : ActorMethod<[], Principal>,
  'ishold' : ActorMethod<[Principal, bigint], Array<bigint>>,
  'isminer' : ActorMethod<[Principal], bigint>,
  'isregister' : ActorMethod<[], bigint>,
  'lock' : ActorMethod<[Array<bigint>], bigint>,
  'matchwon' : ActorMethod<[bigint], bigint>,
  'mint' : ActorMethod<[bigint], bigint>,
  'startgame' : ActorMethod<[], bigint>,
  'wallet_balance' : ActorMethod<[], bigint>,
  'wallet_receive' : ActorMethod<[], { 'accepted' : bigint }>,
}
