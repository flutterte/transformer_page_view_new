# example

A new Flutter application.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).







name: Publish to Pub.dev

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest
    #if: github.ref != 'refs/heads/master'
    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Publish Dart/Flutter package
        uses: k-paxian/dart-package-publisher@master
        with:
          flutter: true
          skipTests: true
          dryRunOnly: true
          credentialJson: ${{ secrets.DART_PUB_CREDENTIAL_JSON }}
  deploy:
    runs-on: ubuntu-latest
    #if: github.ref == 'refs/heads/master'
    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Publish Dart/Flutter package
        uses: k-paxian/dart-package-publisher@master
        with:
          flutter: true
          skipTests: true
          credentialJson: ${{ secrets.DART_PUB_CREDENTIAL_JSON }}