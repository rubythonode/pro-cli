# pro-cli

pro-cli is your local little environment manager. You can:

- quickly switch between projects that you worked on
- use the same directory structure in **every** project
- initialize and start whole environments (web server, database, caching, mail server, RabbitMQ, etc.) in seconds with docker compose
- install projects with a single command by using your own [scripts](https://github.com/chriha/pro-cli/wiki/Using-the-install-command-and-scripts)
- every developer is using the exact same environment and tools
- no need to install multiple versions for each tool locally
- reduce amount of necessary commands for each developer
- simple access to log files; tail and concat all or just specific services
- use the `project` command everywhere in your project, not only in your root

See the [wiki](https://github.com/chriha/pro-cli/wiki) for further help.

## TOC

- [Install](#install)
  - [Dependencies](#dependencies)
  - [Install pro-cli](#install-pro-cli)
- [Commands](#commands)
  - [Logs](#logs)
- [Configuration](#configuration)
- [Used Repos](#used-repos)
  - [docker](#docker)
- [Supported Systems](#supported-systems)
- [Update](#update)
- [Uninstall](#uninstall)


## Install

### Dependencies

- The amazing [jq](https://stedolan.github.io/jq/) -> [download](https://stedolan.github.io/jq/download/)

### Install pro-cli
After installing *jq* via `brew install jq`, please install pro-cli via:
```bash
git clone -q https://github.com/chriha/pro-cli.git $HOME/.pro-cli && $HOME/.pro-cli/setup.sh
```

Reload your shell and use the `project` command with all its beauty.

## Commands

Commands are depending on the project type. List them via the `project` command. If you are inside a project, pro-cli will show you all available commands for that specific type (PHP, Laravel, etc.). Outside the projects, you will just see the commands, that are specific to pro-cli.

### Logs

Tail logs of all or just specific services. See `project logs -h` for further help.

## Configuration

Every pro-cli project has its own [`pro-cli.json`](pro-cli.json) file which you can change to your needs. Add whole installation processes or single commands.

### docker

Each project has its `docker-compose.yml` which should not be touched as it will be overwritten as soon as the project structure gets updated. Instead you should create your own docker-compose file according to the `env` in `pro-cli.json`. For example, if you set the `env` to `local`, **pro-cli** will look for and use `docker-compose.local.yml`. Take a look at [pro-init-php](https://github.com/chriha/pro-init-php) for an example.

## Supported systems

Only PHP supported right now, but feel free to contribute.

## Update

To manually update **pro-cli** just use the `project self-update` command.

## Uninstall

```bash
rm -rf $HOME/.pro-cli && rm $HOME/.bin/project
```
