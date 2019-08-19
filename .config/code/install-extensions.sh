#!/usr/bin/env bash

extension_list=(
    alefragnani.numbered-bookmarks
    Angular.ng-template
    austin.code-gnu-global
    bbenoist.vagrant
    belfz.search-crates-io
    bungcip.better-toml
    christian-kohler.path-intellisense
    DavidAnson.vscode-markdownlint
    DennisVash.summer-time
    dunstontc.vscode-rust-syntax
    eamodio.gitlens
    EditorConfig.EditorConfig
    Equinusocio.moxer-icons
    fabiospampinato.vscode-projects-plus
    jeff-hykin.better-cpp-syntax
    jeff-hykin.better-dockerfile-syntax
    jeff-hykin.better-shellscript-syntax
    johnpapa.Angular2
    jwoelper.theme-lifeonmars
    mblode.pretty-formatter
    mhutchie.git-graph
    ms-azuretools.vscode-docker
    ms-vscode.cpptools
    ms-vscode.csharp
    ms-vscode.vscode-typescript-tslint-plugin
    msjsdiag.debugger-for-chrome
    panicbit.cargo
    rpinski.shebang-snippets
    rust-lang.rust
    sanderledegen.angular-follow-selector
    serayuzgur.crates
    skellock.just
    stkb.rewrap
    yo1dog.cursor-align
)

function main()
{
    local current_ext_list=($(code --list-extensions))
    local skip_count=0
    local install_count=0

    local a=()
    local name=''

    for ext in ${extension_list[@]}; do
        a=(${ext//./ })
        name=${a[1]}

        if [[ ! "${current_ext_list[@]}" =~ "$ext" ]]; then
            echo "Installing: $name..."
            install "$ext"
            install_count=$((install_count+1))
        else
            echo "Skipping:   $name..."
            skip_count=$((skip_count+1))
        fi
    done

    # determine if there are any local extensions that are on in the saved list
    local local_extensions=()
    local local_count=0
    for ext in ${current_ext_list}; do
        a=(${ext//./ })
        name=${a[1]}

        if [[ ! "$extension_list[@]" =~ "$ext" ]]; then
            local_extensions+=($name)
            local_count=$((local_count+1))
        fi
    done

    echo ""
    echo "Complete! Results:"
    echo "  Installed: $install_count"
    echo "  Skipped:   $skip_count"
    if [[ $local_count -gt 0 ]]; then
        echo ""
        echo "There are currently $local_count extensions installed that are not saved:"
        for e in ${local_extensions[@]}; do
            echo "  $e"
        done
    fi
}

function install()
{
    code --install-extension "$1" 1>/dev/null
}

main "$@"
