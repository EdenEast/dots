#!/usr/bin/env bash

extension_list=(
    4ban.rougarou
    adriankollarik.draculish
    AhmedAbdulrahman.aylin
    alefragnani.numbered-bookmarks
    Angular.ng-template
    annliu.1987
    austin.code-gnu-global
    bazutya.bazutya
    bbenoist.vagrant
    belfz.search-crates-io
    bungcip.better-toml
    christian-kohler.path-intellisense
    danielsrothstan.uixninja-theme
    dannymcgee.summer-vacation-theme
    DavidAnson.vscode-markdownlint
    DennisVash.summer-time
    dericcain.feather
    dunstontc.vscode-rust-syntax
    eamodio.gitlens
    EditorConfig.EditorConfig
    endorfina.roseate
    Equinusocio.moxer-icons
    evan-buss.font-switcher
    fabiospampinato.vscode-projects-plus
    fiazluthfi.darkred
    fosshaas.fontsize-shortcuts
    hpe-dev.hpe-dev
    inksea.inksea-theme
    jeff-hykin.better-cpp-syntax
    jeff-hykin.better-dockerfile-syntax
    jeff-hykin.better-shellscript-syntax
    jeff-hykin.xd-theme
    jibjack.styrokai
    jimmydc.everset
    johnpapa.Angular2
    josef.rouge-theme
    juanmnl.vscode-theme-1984
    kenziebottoms.heptapod
    mblode.pretty-formatter
    mhutchie.git-graph
    ms-azuretools.vscode-docker
    ms-vscode.cpptools
    ms-vscode.csharp
    ms-vscode.vscode-typescript-tslint-plugin
    msjsdiag.debugger-for-chrome
    Nimda.deepdark-material
    panicbit.cargo
    paulvandermeijs.loved
    pshershov.blueberry-banana
    rickynormandeau.mariana-pro
    RobbOwen.synthwave-vscode
    rpinski.shebang-snippets
    rust-lang.rust
    samrapdev.outrun
    sanderledegen.angular-follow-selector
    serayuzgur.crates
    skellock.just
    smlombardi.slime
    stkb.rewrap
    tinkertrain.theme-panda
    wart.ariake-dark
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
