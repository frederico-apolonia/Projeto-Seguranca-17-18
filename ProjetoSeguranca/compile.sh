#!/bin/bash

SERVER_OUT_PATH='PhotoShareServer/out'
SERVER_IN_PATH='PhotoShareServer/src'
SERVER_PASSWORDS='PhotoShareServer/PhotoShare/passwords.txt'

CLIENT_OUT_PATH='PhotoShareClient/out'
CLIENT_IN_PATH='PhotoShareClient/src'

########################################################
####      CHECK IF SERVER AND CLIENT OUT EXISTS     ####
########################################################
if [[ ! -d $SERVER_OUT_PATH ]]; then
  mkdir $SERVER_OUT_PATH
fi

if [[ ! -d $CLIENT_OUT_PATH ]]; then
  mkdir $CLIENT_OUT_PATH
fi

########################################################
####      DELETE SERVER AND CLIENT OUT              ####
########################################################
if [[ "$(ls $SERVER_OUT_PATH -A)" ]]; then
  echo Removing old server files
  rm $SERVER_OUT_PATH/*
else
  echo Server out directory is already empty
fi

if [[ "$(ls $CLIENT_OUT_PATH -A)" ]]; then
  echo Removing old server files
  rm $CLIENT_OUT_PATH/*
else
  echo Client out directory is already empty
fi

########################################################
####      COMPILE SERVER AND CLIENT                 ####
########################################################
echo Compiling Server
javac -cp $SERVER_OUT_PATH/ -d $SERVER_OUT_PATH/ $SERVER_IN_PATH/*.java
echo Compiling Client
javac -cp $CLIENT_OUT_PATH/ -d $CLIENT_OUT_PATH/ $CLIENT_IN_PATH/*.java
