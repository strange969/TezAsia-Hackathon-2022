import { Actor, HttpAgent } from '@dfinity/agent';
import { AuthClient } from '@dfinity/auth-client';
import { idlFactory } from './main.did.js';

class ICPHelper{

    canisterId = "tdja5-gyaaa-aaaag-aaoeq-cai";

    async init(){
        this.authClient = await AuthClient.create();
        return this.authClient;
    }

    async isLoggedIn(){
        return await this.authClient.isAuthenticated();
    }

    login(){
        return new Promise((resolve, reject) => {
            this.authClient.login({
                onSuccess: async () => {
                    resolve();
                },
                onError: async (e) =>{
                    console.error(e);
                    reject(e);
                }
            });
        })

    }

    logout(){
        this.authClient.logout()
    }

    address(){
        return this.authClient.getIdentity().getPrincipal().toString()
    }

    getActor(){
        const agent = new HttpAgent({ host: "https://tdja5-gyaaa-aaaag-aaoeq-cai.raw.ic0.app" });
        return Actor.createActor(idlFactory, {
          agent,
          canisterId: this.canisterId
        });
    };
}
 
window.ICPHelper = ICPHelper;
