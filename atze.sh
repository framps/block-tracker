#!/bin/bash

# USAGE: ./getopt_test.sh [GLOBAL OPTIONS] <COMMAND> [OPTIONS]

use_filter=false
verbose=false
quite=false
debug=false

# Get global options
while [[ true ]]; do
    case ${1} in
        # these options are just for proof of concept
        --verbose|-v) verbose=true ; shift ;;
        --quite|-q) quite=true; shift ;;
        --debug|-d) debug=true; shift ;;
        disable|install|status|uninstall|update|enable|run) break ;;
        *) echo "Unknown option ${1}"; exit 1
    esac
done

# get command
cmd="${1}"
shift

# get command options
case "${cmd}" in
    disable|install|status|uninstall|update)
        if [[ ! "${1}" == "" ]]; then
            echo "${cmd} does not accept an option" ; exit 1
        fi ;;
    enable|run)
        while [[ -n "${1}" ]]; do
            case "${1}" in
                --filter|-f)
                    use_filter=true
                    if [[ -n ${2} && ! "${2:0:1}" == "-" ]]; then
                        if [[ ! -f "${2}" ]]; then
                            echo "File not found: ${2}"
                            exit 1
                        fi
                        filter_configs+=("${2}")
                        shift 2
                    else
                        shift
                    fi ;;
                *) echo "Invalid option: ${1}" ; exit 1 ;;
            esac
        done ;;
    *) echo "Unknown command ${cmd}" ; exit 1 ;;
esac

echo "verbose = ${verbose}"
echo "quite = ${quite}"
echo "debug = ${debug}"
echo "command = ${cmd}"
echo "-f = ${use_filter}"
echo "-f-arg = ${filter_configs[@]}"
