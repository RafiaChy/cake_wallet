#!/bin/bash

MONERO_COM=monero.com
CAKEWALLET=cakewallet
CONFIG_ARGS=""

case $APP_ANDROID_TYPE in
        $MONERO_COM)
                CONFIG_ARGS="--monero"
                ;;
        $CAKEWALLET)
                CONFIG_ARGS="--monero --bitcoin"
                ;;
esac

cd ../..
cp -rf pubspec_description.yaml pubspec.yaml
flutter pub get
flutter pub run tool/generate_pubspec.dart
flutter pub get
flutter packages pub run tool/configure.dart $CONFIG_ARGS
cd scripts/android