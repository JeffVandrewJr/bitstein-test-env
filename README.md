# A Dockerized Setup for BTC/LN Network Test Environment

To view the original Medium post that inspired this, [click here](https://medium.com/@bitstein/setting-up-a-bitcoin-lightning-network-test-environment-ab967167594a).

[@bitstein](https://twitter.com/bitstein) recently put out a tutorial on setting up a local BTC/LN regtest environment.

I liked it, so I made the environment setup easier by dockerizing it.

To set up the testing environment, simply clone this git repository, and then:

```
cd bitstein-test-env
sudo docker-compose up -d
```

That's literally it. You're done.

## Simplifications and differences from the canonical version Medium post instructions:

1. He calls his two lightning nodes "1" and "2." Here they are instead called "alice" and "bob".

2. You don't need to mess with bash aliases, as Alice and Bob have their own containers on their own little private network. Whenever you want to send a command to Alice's `lncli` you just run `./lncli-alice.sh <command>`. The `lncli-alice.sh` script automatically forwards the command into Alice's container for you. Same works for Bob. For bitcoind, you simply run `bitcoin-cli.sh <command>`. You may need to use `sudo` for these commands.

3. In the canonical version, one of the nodes had to use the nonstandard port 9734. In the Dockerized version, since everyone has their own container, both nodes run on the standard 9735.

4. For any Docker noobs, Docker automatically uses the container names as resolvable IP addresses. So if you're trying to connect to the nodes, Alice's IP address is simply `alice:9735` and Bob's is `bob:9735`.

5. You can skip the step in the canonical instructions where you use `lncli create`, as both Alice and Bob will spin up with already-created wallets.
