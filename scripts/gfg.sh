#!/bin/bash
# gfg means - Go Flutter Go. Tribute to the music "Jhonny B Goode"

# this script automatizes flutter rebuild on windows. It's very specific to my actual workplace

## starting text
prints_text_in_cyan() {
    printf "\e[36m$1\e[0m"
}

## succesful text
prints_text_in_green() {
    printf "\e[32m$1\e[0m"
}

prints_starting_message() {
    printf "\n"
    prints_text_in_cyan "Starting $1..."
    printf "\n\n\n"
}

prints_successful_message() {
    printf "\n"
    prints_text_in_green "$1 has successfully run!"
    printf "\n\n\n"
}

calls_flutter_clean() {
    local function_name="Flutter Clean"

    prints_starting_message "$function_name"
    fvm flutter clean
    prints_successful_message "$function_name"
}

calls_flutter_pub_get_with_fvm() {
    local function_name="Flutter Pub Get"

    prints_starting_message "$function_name"
    fvm flutter pub get
    prints_successful_message "$function_name"
}

calls_dart_run_build_runner() {
    local function_name="Flutter Run Build Runner"

    prints_starting_message "$function_name"
    fvm dart run build_runner build --delete-conflicting-outputs
    prints_successful_message "$function_name"
}

gfg() {
    calls_flutter_clean
    calls_flutter_pub_get_with_fvm
    calls_dart_run_build_runner
}

gfg