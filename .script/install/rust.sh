[[ -x "$(command -v rustup)" ]] && {
    # install stable rust
    rustup install stable

    # install nightly
    rustup toolchain add nightly

    # setting default toolchain to be stable
    rustup default stable

    rustup component add rls rust-analysis rust-src
    rustup component add clippy
    rustup component add racer

    # install sccache and then force it to be the rustc_wrapper
    cargo install sccache
    [ -z $RUSTC_WRAPPER ] && export RUSTC_WRAPPER=sccache
    [ -z $SCCACHE_DIR ]   && export SCCACHE_DIR="$HOME/.cache/sccache"

    # try to install racer but, as it is nightly it might fail
    cargo +nightly install racer

    # useful rust applications for developing rust
    cargo install just
    cargo install mdbook

    # cargo extensions
    cargo install cargo-bloated
    cargo install cargo-deps
    cargo install cargo-edit
    cargo install cargo-expand
    cargo install cargo-outdated
    cargo install cargo-release
    cargo install cargo-tree
    cargo install cargo-update
}
