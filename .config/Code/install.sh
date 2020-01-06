extensions=(
    adamsome.vscode-theme-gruvbox-minor
    asvetliakov.vscode-neovim
    belfz.search-crates-io
    bungcip.better-toml
    christian-kohler.path-intellisense
    DavidAnson.vscode-markdownlint
    dunstontc.vscode-rust-syntax
    eamodio.gitlens
    EditorConfig.EditorConfig
    Equinusocio.moxer-icons
    justusadam.language-haskell
    kamikillerto.vscode-colorize
    mhutchie.git-graph
    ms-azuretools.vscode-docker
    ms-vscode.cpptools
    ms-vscode.Go
    msjsdiag.debugger-for-chrome
    panicbit.cargo
    rust-lang.rust
    serayuzgur.crates
    skellock.just
    UCL.haskelly
)

function main()
{
    local current_ext_list=($(code --list-extensions))
    local skip_count=0
    local install_count=0

    local a=()
    local name=''

    for ext in ${extensions[@]}; do
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
