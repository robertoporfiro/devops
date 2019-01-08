# Problem 
**sign_and_send_pubkey: signing failed: agent refused operation
Permission denied (publickey).**


### SSH-AGENT
- Is a program to hold private keys.<br/>
- ssh-agent is started in the beginning of an X-session or a login session


#### How fuction
Running `ssh-agent`<br/>
```
SSH_AUTH_SOCK=/tmp/ssh-ExuTNSPEpyoB/agent.5831; export SSH_AUTH_SOCK;
echo Agent pid 5831;
```
- The ssh-agent create directory in /tmp to store the process that runs the socket.


####  environment variables
- `$SSH_AGENT_PID`: contains the PID of the agent.
- `$SSH_AUTH_SOCK`: contains **path of the unix file socket** that the agent uses for communication with other processes.
 - Run environment variable SSH_AUTH_SOCK with contains path `/run/user/1000/keyring/ssh`<br/>
 - The path execute a file socket with contains private key auth


https://linux.die.net/man/1/ssh-agent

