let icpInstance;
let icpAuthClient;
let actor;

window.connect = async function(){
  icpInstance = new ICPHelper();
  icpAuthClient = await icpInstance.init()
  if(!await icpInstance.isLoggedIn()){
    await icpInstance.login();
  } 
  window.accounts = icpInstance.address();
  actor = icpInstance.getActor();
  myGameInstance.SendMessage('RTS_Camera','onConnect');
  window.userdata()
}

window.openMarketPlace = () =>{
  window.open("https://uqnba-7yaaa-aaaal-qa7pq-cai.raw.ic0.app/")
}

window.startgame = async function(){
  await actor.startgame();
  myGameInstance.SendMessage('RTS_Camera','onDone');
}

window.savegame = async function(str){
  let tee = JSON.parse(str);
  let test = [0,0,0,0,0,0,0]
  for (let i =0;i<tee.buil.length;i++){
    if(tee.buil[i].buildingIndex<4){
      test[tee.buil[i].buildingIndex] =  test[tee.buil[i].buildingIndex]+1
    }
  }
  await actor.lock(test);
  myGameInstance.SendMessage('syncButton','onSave');
}

let graphkey = {
    0:"miner",
    1:"cannon",
    2:"xbow",
    3:"tesla",
    4:"archer",
    5:"robot",
    6:"valkyriee"
}
const keys = Object.keys(graphkey);
keys.forEach((item, i) => {
  window[graphkey[item]]=0;
});

window.collectwin = async function(buildingamount){
  await actor.matchwon(buildingamount);
}

window.userdata = async function(){
  if(!await actor.isregister()){
    myGameInstance.SendMessage('RTS_Camera','onNewUser');
  }else{
    let coinData = await actor.getCoin();
    window.aureus = Number(coinData[0]);
    for(let i = 1; i<=6; i++){
      window[graphkey[i]] = Number(coinData[i]);
    }
    myGameInstance.SendMessage('RTS_Camera','onDone');
  }
}
