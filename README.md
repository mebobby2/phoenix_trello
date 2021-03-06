# PhoenixTrello

Building a clone of the popular Trello app to get familiar with with Elixir and Phoenix. We use React/Redux on the front end.

## Prerequisites
1. Elixr/Erlang must be installed
2. Postgres.app must be installed
3. Need to add bin directory of Postgres.app to PATH so ecto can use psql from the command line.
Add the line "export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin" to ~/.bash_profile

## Installation
1. Run 'mix deps.get' to install Mix dependencies
2. Run 'npm install' to install node packages
3. Run 'mix ecto.create' to create the postgres db
4. Run 'mix ecto.migrate' to migrate the db

## Development
1. Run 'mix phoenix.server' to start the phoenix server

## Guide
Based on this tutorial: https://blog.diacode.com/trello-clone-with-phoenix-and-react-pt-1