## Basic usage

### Initialization

1. Clone this repository
2. Run `scripts/init.sh`

The init script will add the production configuration and then clone and build the game sources.

#### Configuration hints

Enable ECON to control the server via the scripts. You'll have to restart and monitor the server manually in the other case.

### Later on

#### Use screen

Use something like `screen` to keep the server running after the terminal detached.

Open the right session with `screen -S InfcProduction` at the first time and `screen -r InfcProduction` later (any other session name would work).

#### Run the server

Run the server with a script:
`scripts/run.sh`

That is it.

If you're using `screen` then press `Ctrl+A`+`Ctrl+D` to detach the session (the server will be kept running).

#### Check the server status

Use a script to check that the server is running:

`scripts/status.sh`

### Update the server

On a new version released run `scripts/update.sh`. The update will be installed as soon as the server becomes empty.

You can check the running server version:

`scripts/version.sh`

## Advanced usage

### Run an extra configuration
### Customize the source repository branch
