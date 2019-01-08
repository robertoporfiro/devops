# Problem 
**sign_and_send_pubkey: signing failed: agent refused operation
Permission denied (publickey).**


### SSH-AGENT
- Is a program to hold private keys.<br/>
- ssh-agent is started in the beginning of an X-session or a login session


### How fuction
Running `ssh-agent`<br/>
```
SSH_AUTH_SOCK=/tmp/ssh-ExuTNSPEpyoB/agent.5831; export SSH_AUTH_SOCK;
echo Agent pid 5831;
```
- The ssh-agent create directory in /tmp to store the process that runs the socket.


###  environment variables
- `$SSH_AGENT_PID`: contains the PID of the agent.
- `$SSH_AUTH_SOCK`: contains **path of the unix file socket** that the agent uses for communication with other processes.
 - Run environment variable SSH_AUTH_SOCK with contains path `/run/user/1000/keyring/ssh`<br/>
 - The path execute a file socket with contains private key auth
 
 
 ### Configuration key to ssh-agent
- Start the ssh-agent in the background.<br/>
`eval "$(ssh-agent -s)"`

- Agent dont have set private key.<br/>
`ssh-add ~/.ssh/id_rsa`


---

### Problem
- SSH agent wasn´t running
- Keys loaded correctly

### Solution
- PAM_ssh is a lib to ssh-client
- In the PAM session phase, an ssh-agent process is started and keys are added.
- https://packages.ubuntu.com/xenial/admin/libpam-ssh
- Now, service ssh inactive and ssh.socket activate

####
- In ~/.ssh create file agent-NAME-PC<br/>
```
SSH_AUTH_SOCK=/tmp/ssh-yy5ZvJCU3Lde/agent.2676; export SSH_AUTH_SOCK;
SSH_AGENT_PID=2677; export SSH_AGENT_PID;
echo Agent pid 2677;
```


---
- create new user to check ssh
- view if lib contains in apt/dpkg


#### References:
- http://blog.joncairns.com/2013/12/understanding-ssh-agent-and-ssh-add/
- https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
- https://unix.stackexchange.com/questions/420124/who-is-starting-my-ssh-agent-and-why-wont-it-properly-terminate
- https://packages.ubuntu.com/xenial/admin/libpam-ssh
- https://linux.die.net/man/1/ssh-agent
- http://manpages.ubuntu.com/manpages/xenial/en/man1/ssh.1.html
- https://packages.ubuntu.com/xenial/admin/libpam-ssh
