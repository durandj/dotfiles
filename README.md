# Dotfiles

My personal environment configuration.

## Requirements

 * Debian based OS
 * Python 3.x
 * Curl
 * [Pip](https://pip.pypa.io/en/stable/installing/)
 * [Pipsi](https://github.com/mitsuhiko/pipsi)
 * [Ansible](https://ansible.com/)

## Setup

### Pipsi

Any time that I need to install a Python based command globally I
prefer to do so with each command in it's own virtual environment.
This keeps the dependencies for each package isolated from any other
and reducing the likelihood of one package breaking another. To
accomplish this, I use `pipsi` (Pip Script Installer).

```bash
sudo apt update
sudo apt install curl python3 python3-dev python3-pip python3-venv
curl https://bootstrap.pypa.io/get-pip.py | sudo python3
sudo pip install virtualenv
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | sudo python3
sudo chown --recursive james:james ~/.local
```

### Ansible

With `pipsi` installed, I use that to install Ansible.

```bash
pipsi install ansible
```

### Playbooks

Once Ansible is setup you can run any of the playbooks by using the
following command (assuming you're in the dotfiles directory).

```bash
ansible-playbook \
    --ask-become-pass \
    --inventory ansible/hosts \
    ansible/playbooks/<playbook>
```

`--ask-become-pass` prompts you for your password to switch to `root`
when needed.
`--inventory ansible/hosts` tells Ansible which hosts to run the
playbooks on and how to connect to them. In this case it's saying to
only connect to `localhost` and that you don't need to use `ssh` to
do it.

### Special Notes

#### Nvim

You'll need to include the `--extra-vars` argument for this playbook
and specify a set of completers to use. For example:

```
--extra-vars '{ "completers": [ "--clang-completer" ] }'
```

#### Zsh

Because of the way the oh-my-zsh installer works, it expects Zsh to
be the current shell. This won't be the case yet when installing it
so you might need to run the Zsh playbook twice with the first time
failing.
