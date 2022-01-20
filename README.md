# Dotfiles

My personal environment configuration.

## Requirements

 * Debian based OS
 * Python 3.x
 * Curl
 * [Pip](https://pip.pypa.io/en/stable/installing/)
 * [PipX](https://pipxproject.github.io/pipx)
 * [Ansible](https://ansible.com/)

## Setup

### PipX

Any time that I need to install a Python based command globally I
prefer to do so with each command in it's own virtual environment.
This keeps the dependencies for each package isolated from any other
and reducing the likelihood of one package breaking another. To
accomplish this, I use `pipx`.

```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
export PATH="~/.local/bin:$PATH"
python3 -m pip install --user pipx
```

Or on a recent version of Manjaro.

```bash
export PATH="~/.local/bin:$PATH"
python3 -m pip install --user pipx
git clone https://github.com/kewlfft/ansible-aur.git ~/.ansible/plugins/modules/aur
```

### Ansible

With `pipx` installed, I use that to install Ansible.

```bash
pipx install ansible
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

#### Zsh

Because of the way the oh-my-zsh installer works, it expects Zsh to
be the current shell. This won't be the case yet when installing it
so you might need to run the Zsh playbook twice with the first time
failing.
