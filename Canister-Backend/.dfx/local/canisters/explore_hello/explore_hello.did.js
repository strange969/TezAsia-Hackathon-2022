export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'faucet' : IDL.Func([], [IDL.Nat], []),
    'getminer' : IDL.Func([], [IDL.Nat], []),
    'hola' : IDL.Func([], [IDL.Principal], []),
    'ishold' : IDL.Func(
        [IDL.Principal, IDL.Nat],
        [IDL.Vec(IDL.Nat)],
        ['query'],
      ),
    'isminer' : IDL.Func([IDL.Principal], [IDL.Nat], ['query']),
    'lock' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Nat], []),
    'mint' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'wallet_balance' : IDL.Func([], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };
